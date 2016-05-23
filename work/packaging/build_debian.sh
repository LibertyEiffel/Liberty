#!/bin/bash

export plain=TRUE

status=0

packages=$(dirname $(readlink -f $0))
export LIBERTY_HOME=$(cd $packages/../..; pwd)

export clean=FALSE
export codename=snapshot
export keep_failed=FALSE
export deploy=FALSE
export doc=TRUE
export staging=TRUE

pkgdate=${PKG_DATE:-$(date -u +'%Y%m%d.%H%M%S')}
export tag="~snapshot.$pkgdate"

debuild_opt=()

while [[ x$1 != x ]]; do
    case $1 in
        -clean)
            clean=TRUE
            ;;
        -commit*)
            codename=commit
            tag="~commit"${1#-commit}
            ;;
        -release*)
            codename=release
            tag="~release"${1#-release}
            staging=FALSE
            ;;
        -rc*)
            codename=rc
            tag="~rc"${1#-rc}
            ;;
        -keep)
            keep_failed=TRUE
            ;;
        -debuild=*)
            debuild_opt+=("${1#-debuild=}")
            ;;
        -deploy)
            deploy=TRUE
            ;;
        -nodoc)
            doc=FALSE
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
    shift
done

if [[ $deploy == FALSE ]]; then
    test -d $packages/debs && rm -rf $packages/debs
    mkdir $packages/debs

    if [[ -d $LIBERTY_HOME/target && $clean != TRUE ]]; then
        export TARGET=$LIBERTY_HOME/target
        export TMPDIR=${TMPDIR:-$TARGET/tmp}
        test -d $TMPDIR || mkdir -m 700 -p $TMPDIR
        export LOGDIR=$TARGET/log
    else
        export LOGDIR=${TMPDIR:-/tmp}/liberty-eiffel-logs
    fi
    mkdir -p $LOGDIR
    orig_home=$HOME
    export HOME=$(mktemp -d -t liberty-eiffel-home.XXXXXX)
    export TARGET=${TARGET:-$HOME/target}

    echo "HOME=$HOME"
    echo "TARGET=$TARGET"

    if [ -d $orig_home/.config/liberty-eiffel ]; then
        mkdir -p $HOME/.config/liberty-eiffel
        cp -p $orig_home/.config/liberty-eiffel/* $HOME/.config/liberty-eiffel
    fi

    if [[ -d $TARGET/bin ]]; then
        echo
        echo "Existing executables will be used from $TARGET/bin"
    else
        echo
        echo "Generating executables into $TARGET/bin"
        $LIBERTY_HOME/install.sh -plain -bootstrap
    fi

    if [[ $doc != TRUE ]]; then
        echo
        echo "Skipping doc"
    elif [[ -d $TARGET/doc ]]; then
        echo
        echo "Existing doc will be used from $TARGET/doc"
    else
        echo
        echo "Generating doc"
        $LIBERTY_HOME/install.sh -plain -doc
    fi

    do_debuild() {
        tmp=$1

        r=0
        if egrep -q '^Architecture: all$' debian/control; then
            debuild -us -uc "${debuild_opt[@]}" > "$LOGDIR/$(basename $tmp)_all.log" 2>&1 || {
                echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_all.log"
                r=1
            }
        else
            arch=$(dpkg --print-architecture)
            debuild -us -uc "${debuild_opt[@]}" > "$LOGDIR/$(basename $tmp)_${arch}.log" 2>&1 || {
                echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_${arch}.log"
                r=1
            }
        fi

        return $r
    }

    echo
    version=$(head -n 1 $packages/debian.skel/debian/changelog | sed 's/#SNAPSHOT#/'"$tag"'/g;s/#DATE#/'"$(date -R)"'/g' | awk -F'[()]' '{print $2}')
    echo "Generating packages: version is $version"
    for debian in $packages/*.pkg/debian; do
        if [[ ( $doc == TRUE || ! -e $debian/isdoc ) && ( $staging == TRUE || ! -e $debian/isstaging ) ]]; then
            package_dir=${debian%/debian}
            package=$(basename ${debian%.pkg/debian})
            tmp=$(mktemp -d -t $package-deb.XXXXXX)
            echo "    $package $version (working in $tmp)"
            cd $tmp
            mkdir build
            cd build
            mkdir debian

            # copy layers
            cp -a $packages/debian.skel/* .
            cp -a $package_dir/* .

            # customize debian/changelog
            sed 's/#SNAPSHOT#/'"$tag"'/g;s/#DATE#/'"$(date -R)"'/g' -i debian/changelog

	    if [[ -e $debian/isdoc ]]; then
		section=doc
	    else
		section=devel
	    fi

            # customize debian/control
            mv debian/control debian/control~
            {
                cat <<EOF
Source: liberty-eiffel
Section: $section
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
            if do_debuild $tmp; then
                cp -p $tmp/*.* $packages/debs/
                cd $packages
                rm -rf $tmp
            else
                cp -p $tmp/*.* $packages/debs/
                if [ $keep_failed == TRUE ]; then
                    echo
                    echo "**** Keeping $tmp for forensics"
                    echo
                else
                    cd $packages
                    rm -rf $tmp
                fi
                status=$(($status + 1))
            fi
        fi
    done

    rm -rf $HOME

else # deploy == TRUE
    test -d $packages/debs || {
        echo "Nothing to deploy!" >&2
        exit 1
    }

    echo
    echo "Generated packages:"
    for deb in $packages/debs/*.{deb,dsc}; do
        echo " -  $deb"
    done

    echo
    echo "Adding packages to repository"
    mkdir -p $LIBERTY_HOME/website/apt
    for deb in $packages/debs/*.deb; do
        test -e $deb && reprepro --basedir $LIBERTY_HOME/website/apt includedeb $codename $deb || status=$(($status + 1))
    done
    for dsc in $packages/debs/*.dsc; do
        test -e $dsc && reprepro --basedir $LIBERTY_HOME/website/apt includedsc $codename $dsc || status=$(($status + 1))
    done

fi

echo
echo "Done (status=$status)."
echo

exit $status
