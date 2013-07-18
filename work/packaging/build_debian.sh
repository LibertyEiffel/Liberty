#!/bin/bash

export plain=TRUE

status=0

packages=$(dirname $(readlink -f $0))
export LIBERTY_HOME=$(cd $packages/../..; pwd)
test -d $packages/debs && rm -rf $packages/debs
mkdir $packages/debs

export clean=FALSE
export release=FALSE
export codename=snapshot

while [ x$1 != x ]; do
    case $1 in
        -clean)
            clean=TRUE
            ;;
        -release)
            release=TRUE
            codename=release
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
    shift
done

if [ -d $LIBERTY_HOME/target ] && [ $clean != TRUE ]; then
    export TARGET=$LIBERTY_HOME/target
    export TMPDIR=${TMPDIR:-$TARGET/tmp}
    test -d $TMPDIR || mkdir -m 700 -p $TMPDIR
    export LOGDIR=$TARGET/log
else
    export LOGDIR=${TMPDIR:-/tmp}/liberty-eiffel-logs
fi
mkdir -p $LOGDIR
export HOME=$(mktemp -d -t liberty-eiffel-home.XXXXXX)
export TARGET=${TARGET:-$HOME/target}

test -d $TARGET/bin || {
    echo
    echo "Generating executables"
    $LIBERTY_HOME/install.sh -plain -bootstrap
}

test -d $TARGET/doc || {
    echo
    echo "Generating doc"
    $LIBERTY_HOME/install.sh -plain -doc
}

build_chroot() {
    arch=$1
    (
        cd $LIBERTY_HOME/target/chroot/liberty-$arch
        fakeroot fakechroot /usr/sbin/chroot debootstrap --variant=fakechroot --arch=$arch stable $LIBERTY_HOME/target/chroot/$arch http://ftp.us.debian.org/debian
    )
}

do_debuild() {
    if egrep -q '^Architecture: all$' debian/control; then
        debuild -us -uc > "$LOGDIR/$(basename $tmp)_all.log" 2>&1
        ret=$?
        if [ $ret -ne 0 ]; then
            echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_all.log"
        fi
    fi

    mkdir -p $LIBERTY_HOME/target/chroot
    r=0
    for arch in $(dpkg --print-architecture; dpkg --print-foreign-architectures); do
        test -d $LIBERTY_HOME/target/chroot/liberty-$arch || build_chroot $arch
        fakeroot fakechroot /usr/sbin/chroot $LIBERTY_HOME/target/chroot/liberty-$arch "linux32 debuild -a$arch -us -uc > '$LOGDIR/$(basename $tmp)_$arch.log' 2>&1"
        ret=$?
        if [ $ret -ne 0 ]; then
            echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_$arch.log"
        fi
        r=$(($r + $ret))
    done
    return $r
}

echo
echo "Generating packages"
if [ $release == TRUE ]; then
    version=$(head -n 1 $packages/debian.skel/debian/changelog | sed 's/#SNAPSHOT#//g' | awk -F'[()]' '{print $2}')
else
    pkgdate=$(date -u +'%Y%m%d.%H%M%S')
    version=$(head -n 1 $packages/debian.skel/debian/changelog | sed 's/#SNAPSHOT#/~snapshot~'"$pkgdate"'/g' | awk -F'[()]' '{print $2}')
fi
for debian in $packages/*.pkg/debian; do
    package_dir=${debian%/debian}
    package=$(basename ${debian%.pkg/debian})
    tmp=$(mktemp -d -t $package-deb.XXXXXX)
    echo "    $package (working in $tmp)"
    cd $tmp
    mkdir build
    cd build
    mkdir debian

    # copy layers
    cp -a $packages/debian.skel/* .
    cp -a $package_dir/* .

    # customize debian/changelog
    if [ $release == TRUE ]; then
        sed 's/#SNAPSHOT#//g' -i debian/changelog
    else
        sed 's/#SNAPSHOT#/~snapshot~'"$pkgdate"'/g' -i debian/changelog
    fi

    # customize debian/control
    mv debian/control debian/control~
    {
        cat <<EOF
Source: liberty-eiffel
Section: devel
Priority: extra
Maintainer: Cyril Adrian <cyril.adrian@gmail.com>
Build-Depends: debhelper (>= 8.0.0), docbook-to-man, libgc-dev
Standards-Version: 3.9.2
Homepage: http://www.gnu.org/software/liberty-eiffel/
Vcs-Git: http://git.savannah.gnu.org/cgit/liberty-eiffel.git

EOF
        cat debian/control~
    } | sed 's/#VERSION#/'"$version"'/g' > debian/control
    rm debian/control~

    # customize Makefile
    mv Makefile Makefile~
    {
        cat <<EOF
LIBERTY_HOME := ${LIBERTY_HOME}
PACKAGE := $(echo ${package} | sed 's/^liberty-eiffel-//;s/-/_/g')
plain := ${plain}

EOF

        cat Makefile~
    } > Makefile
    rm Makefile~

    # now let debian helpers run
    if do_debuild; then
        cp $tmp/*.deb $packages/debs/
        cd $packages
        rm -rf $tmp
    else
        cp $tmp/*.deb $packages/debs/
        echo
        echo "**** Keeping $tmp for forensics"
        echo
        status=$(($status + 1))
    fi
done

rm -rf $HOME

echo
echo "Generated packages:"
for deb in $packages/debs/*.deb; do
    echo "    $deb"
done

echo
echo "Adding packages to repository"
mkdir -p $LIBERTY_HOME/website/apt
for deb in $packages/debs/*.deb; do
    reprepro --basedir $LIBERTY_HOME/website/apt includedeb $codename $deb || status=$(($status + 1))
done

echo
echo Done.
echo

exit $status
