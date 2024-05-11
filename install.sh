#!/usr/bin/env bash

MAXTOOLCOUNT=20

################################################################################
#
# I need to work in the canonical location, because I want to access
# resources that are typically bundled with this script.
#
# I try GNU readlink first, if I don't find it I will rely on POSIX
# readlink. I think.
# 

CANONICAL_SOURCE=$(readlink -f "$BASH_SOURCE" 2>/dev/null) || {
    unsymlink() {
        if [ -L "$1" ]; then
            unsymlink $(readlink "$1")
        elif [ "${1%/*}" == "$1" ]; then
            echo "$1"
        else
            echo $(unsymlink "${1%/*}")/"${1##*/}"
        fi
    }

    CANONICAL_SOURCE=$(unsymlink "$BASH_SOURCE")
}
cd ${CANONICAL_SOURCE%/*}

################################################################################
#
# Environment variables
#

# export CC_TYPE=${CC_TYPE:-gcc}
# export CC=${CC:-$CC_TYPE}
# export CXX=${CXX:-g++}
export LIBERTY_HOME=$(pwd)
export TARGET=${TARGET:-$LIBERTY_HOME/target}
export TMPDIR=${TMPDIR:-$TARGET/tmp}
export PATH=$TARGET/bin:$PATH
export plain=${plain:-FALSE}
export LOG=$TARGET/log/install$(date +'-%Y%m%d-%H%M%S').log
export PREREQUISITES="$CC $CXX" # gccxml"
unset CDPATH

################################################################################
#
# Source the Liberty tools (they provide the progress bar)
#

. $LIBERTY_HOME/work/tools.sh
mkdir -p $TMPDIR

################################################################################
#
# Checking prerequisites
#


_check_libgc() {
    title "Checking BDW GC"

    cat > $TMPDIR/check_libgc.c <<EOF
#include <stdlib.h>
#include <stdio.h>
#include "gc/gc.h"

int main() {
    unsigned major = 0;
    unsigned minor = 0;
    unsigned micro = 0;
    unsigned alpha = 0;
#ifdef GC_VERSION_MICRO
    major = GC_VERSION_MAJOR;
    minor = GC_VERSION_MINOR;
    micro = GC_VERSION_MICRO;
#else
    unsigned version = GC_get_version();
    major = (version & 0x00ff0000) >> 16;
    minor = (version & 0x0000ff00) >> 8;
    alpha = (version & 0x000000ff) != GC_NOT_ALPHA;
#endif
    printf("BDW (libgc) Version %02d.%02d.%02d %s\n", major, minor, micro, alpha ? "alpha" : "");
    if (   (major < 7)
        || (major == 7 && minor < 1)
        || (alpha)) {
        exit(1);
    }
    exit(0);
} 
EOF
    ${CC} ${CFLAGS} ${LDFLAGS} -lgc $TMPDIR/check_libgc.c -o $TMPDIR/check_libgc >/dev/null 2>&1 || return 1
    if $TMPDIR/check_libgc; then
        return 0
    else
        return 1
    fi
}

check_libgc() {
    if _check_libgc; then
       BDW_GC="-bdw_gc"
    else
       error_message "BDW too old or missing. On Debian based distribution install libgc and libgc-dev packages; on rpm-based distributions (Fedora) gc and gc-devel; on BSD systems install boehm-gc package"
       BDW_GC="-no_gc"
    fi
    export BDW_GC
}

check_prerequisites() {
    title "Checking required programs."
    i=0
    for PROGRAM in $PREREQUISITES; do
        progress 30 $i 3 "Checking $PROGRAM..."
        if which $PROGRAM >/dev/null; then
            : # all right
        else
            error_message "$PROGRAM not found, cannot proceed"
            exit 5
        fi
        i=$(($i + 1))
    done
    progress 30 3 3 "All programs present, proceeding."
    echo
}

################################################################################
#
# The bootstrap function:
#
# Locally install Liberty Eiffel starting from the C germ
#

bootstrap() {
    test -d $TARGET && rm -rf $TARGET
    mkdir -p $TARGET
    mkdir -p $TMPDIR
    cd $TARGET
    test -d log || mkdir log

    check_libgc
    check_prerequisites

    if [ ! -d bin ]; then
        title "Preparing $TARGET"
        mkdir bin
        cd bin
        for ace in $LIBERTY_HOME/src/tools/*/*.ace; do
            tool=$(basename $(dirname $ace))
            if [[ $tool.ace == $(basename $ace) ]]; then
                mkdir $TARGET/bin/$tool.d
                ln -s $ace $TARGET/bin/$tool.d
            fi
        done
        cd ..
    fi

    if [ ! -d liberty-eiffel ]; then
        title "Preparing Liberty environment"
        mkdir liberty-eiffel
        cd liberty-eiffel
        cat > liberty.se <<EOF
[General]
bin: $TARGET/bin
sys: $LIBERTY_HOME/sys
short: $LIBERTY_HOME/resources/short
os: ${OS}
flavor: ${flavor}
tag: 3
jobs: ${jobs}

[Environment]
path_liberty: $LIBERTY_HOME/
path_liberty_core: $LIBERTY_HOME/src/lib/
path_liberty_extra: $LIBERTY_HOME/src/wrappers/
path_liberty_staging: $LIBERTY_HOME/src/staging/
path_smarteiffel: $LIBERTY_HOME/src/smarteiffel/
path_tools: $LIBERTY_HOME/src/tools/
path_tutorial: $LIBERTY_HOME/tutorial/
hyphen: -

[Loadpath]
liberty_core: \${path_liberty_core}loadpath.se
liberty_extra: \${path_liberty_extra}loadpath.se
liberty_staging: \${path_liberty_staging}loadpath.se
test: \${path_liberty}test/loadpath.se
smarteiffel: \${path_smarteiffel}loadpath.se
tools: \${path_tools}loadpath.se
tutorial: \${path_tutorial}loadpath.se

[Tools]
ace_check: ace_check
c2c: compile_to_c
c: compile
class_check: class_check
clean: clean
doc: eiffeldoc
find: finder
make: se_make.sh
mock: mock
pretty: pretty
short: short
test: eiffeltest
test_ng: eiffeltest_ng
test_server: eiffeltest_server
wrap: wrappers_generator
x_int: extract_internals

[boost]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O2 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: -O2 ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[no_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: -O1 ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[require_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[ensure_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[invariant_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[loop_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[all_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}

[debug_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -g -O1 ${CFLAGS}
c_linker_path: $CC
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_path: $CXX
cpp_compiler_options: -g ${CXXFLAGS}
cpp_linker_path: $CC
cpp_linker_options: ${LDFLAGS}
smarteiffel_options: -no_strip

EOF
                cd ..
    fi

    export CONFIG_DIR=${HOME:-/home/$USER}/.config
    test -d $CONFIG_DIR || mkdir -p $CONFIG_DIR

    if [ -L $CONFIG_DIR/liberty-eiffel ]; then
        rm $CONFIG_DIR/liberty-eiffel
    elif [ -e $CONFIG_DIR/liberty-eiffel ]; then
        mv $CONFIG_DIR/liberty-eiffel $CONFIG_DIR/liberty-eiffel~
    fi
    ln -s $TARGET/liberty-eiffel $CONFIG_DIR/

    find $LIBERTY_HOME -name c -type d -print |
        while read c; do
            for run in $c/*.run; do
                if [[ -x "$run" ]]; then
                    "$run" > ${run%.run}
                fi
            done
        done

    title "Bootstrapping Liberty Eiffel tools"
    cd $LIBERTY_HOME/resources/smarteiffel-germ

    if [ ! -d $TARGET/bin/compile_to_c.d ]; then
        test -d $TARGET/bin/compile_to_c.d || mkdir $TARGET/bin/compile_to_c.d
        rm -f compile_to_c*.o
        for src in compile_to_c*.c ; do
            cmd="${germ_cc} ${germ_cflags} ${src}"
            progress 30 0 $MAXTOOLCOUNT "germ: $cmd"
            run $cmd || exit 1
        done
        ${CC} ${LDFLAGS} *.o
        test -e a.exe && mv a.exe a.out
        cp -a * $TARGET/bin/compile_to_c.d/
    fi
    cd $TARGET/bin/compile_to_c.d
    mv a.out compile_to_c || exit 1

    progress 30 1 $MAXTOOLCOUNT "T1: compile_to_c"
    run ./compile_to_c -verbose -boost -no_gc compile_to_c -o compile_to_c.new || exit 1
    grep -v '^#' compile_to_c.make |
        while read cmd; do
            progress 30 1 $MAXTOOLCOUNT "T1: $cmd"
            run $cmd || exit 1
        done
    progress 30 1 $MAXTOOLCOUNT "T1: save"
    mkdir T1
    cp -a compile_to_c* T1/
    progress 30 1 $MAXTOOLCOUNT "T1: check"
    if grep "^$CC" compile_to_c.make >/dev/null 2>&1; then
        rm compile_to_c.make
        cp -a compile_to_c.new compile_to_c
        progress 30 2 $MAXTOOLCOUNT "T2: compile_to_c"
        run ./compile_to_c -verbose -boost -no_gc compile_to_c -o compile_to_c.new || exit 1
        grep -v '^#' compile_to_c.make |
            while read cmd; do
                progress 30 2 $MAXTOOLCOUNT "T2: $cmd"
                run $cmd || exit 1
            done
        progress 30 2 $MAXTOOLCOUNT "T2: save"
        mkdir T2
        cp -a compile_to_c* T2/
        progress 30 2 $MAXTOOLCOUNT "T2: check"
        if grep "$CC" compile_to_c.make >/dev/null 2>&1; then
            rm compile_to_c.make
            cp -a compile_to_c.new compile_to_c
            progress 30 3 $MAXTOOLCOUNT "T3: compile_to_c"
            run ./compile_to_c -verbose -boost -no_gc compile_to_c -o compile_to_c.new || exit 1
            progress 30 3 $MAXTOOLCOUNT "T3: save"
            mkdir T3
            cp -a compile_to_c* T3/
            progress 30 3 $MAXTOOLCOUNT "T3: check"
            if grep "^$CC" compile_to_c.make >/dev/null 2>&1; then
                echo
                cat compile_to_c.make >> $LOG
                error "The compiler is not stable."
                exit 1
            fi
        else
            rm -f compile_to_c.new
        fi
    else
        rm -f compile_to_c.new
    fi

    cd .. && test -e compile_to_c || ln -s compile_to_c.d/compile_to_c .

    progress 30 4 $MAXTOOLCOUNT "compile"
    test -d compile.d || mkdir compile.d
    cd compile.d
    run ../compile_to_c -verbose -boost -no_gc -no_split compile -o compile || exit 1
    grep ^$CC compile.make |
        while read cmd; do
            run $cmd || exit 1
        done
    cd .. && test -e compile || ln -s compile.d/compile .

    {
        grep -v '^#' |
            while read i gc tool; do
                progress 30 $i $MAXTOOLCOUNT "$tool"
                test -d ${tool}.d || mkdir ${tool}.d
                cd ${tool}.d
                case $gc in
                    no) GC="-no_gc";;
                    bdw) GC="$BDW_GC";;
                    *) GC="";;
                esac
                run ../compile -verbose -boost $GC -no_split $tool -o $tool || exit 1
                cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
            done
    } <<EOF
5  no  se
6  bdw clean
7  bdw ace_check
8  bdw eiffeltest
9  no  mock
9  bdw eiffeltest_ng
10 bdw eiffeltest_server
EOF
    {
        grep -v '^#' |
            while read i gc tool; do
                progress 30 $i $MAXTOOLCOUNT "$tool"
                test -d ${tool}.d || mkdir ${tool}.d
                cd ${tool}.d
                case $gc in
                    no) GC="-no_gc";;
                    bdw) GC="$BDW_GC";;
                    *) GC="";;
                esac
                run ../compile -verbose -boost $GC $tool -o $tool || exit 1
                cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
            done
    } <<EOF
11 no  pretty
12 no  short
13 no  class_check
14 no  finder
15 bdw  eiffeldoc
16 no  extract_internals
17 no  wrappers_generator
EOF

    {
        grep -v '^#' |
            while read i gc tool; do
                progress 30 $i $MAXTOOLCOUNT "$tool"
                test -d ${tool}.d || mkdir ${tool}.d
                cd ${tool}.d
                if [ -e $tool.ace ]; then
                    run ../se c -verbose $tool.ace
                else
                    case $gc in
                        no) GC="-no_gc";;
                        bdw) GC="$BDW_GC";;
                        *) GC="";;
                    esac
                    run ../se c -verbose -boost $GC $tool -o $tool || exit 1
                fi
                cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
            done
    } <<EOF
#18 bdw mocker
EOF

        progress 30 $(($MAXTOOLCOUNT - 1)) $MAXTOOLCOUNT "se_make.sh"
        cp $LIBERTY_HOME/work/se_make.sh .

      
        progress 30 $MAXTOOLCOUNT $MAXTOOLCOUNT "done."
        echo
}

################################################################################
#
# The compile_plugins function:
#
# Generate "plugins" for the runner
#

compile_plugins() {
    title "Compiling plugins"
    check_prerequisites
    cd $LIBERTY_HOME/work
    ./compile_plugins.sh
}

################################################################################
#
# The generate_wrappers function:
#
# Generate C library wrappers
#

generate_wrappers() {
    title "Generating wrappers"
    cd $TARGET/bin
    cd wrappers_generator.d
    n=$(ls $LIBERTY_HOME/src/wrappers/*/library/externals/Makefile | wc -l)
    n=$((n+1))
    progress 30 0 $n "Building the wrappers generator"
    run ../se c -verbose wrappers_generator.ace
    cd .. && test -e wrappers_generator || ln -s wrappers_generator.d/wrappers_generator .
    i=1
    for f in $(ls $LIBERTY_HOME/src/wrappers/*/library/externals/Makefile); do
        cd ${f%/Makefile}
        rm -f *.xml *.e plugin/c/plugin.[ch]
        t=${f%/library/externals/Makefile}
        t=${t#$LIBERTY_HOME/src/wrappers/}
        progress 30 $i $n $t
        run make
        i=$((i+1))
    done
    progress 30 $n $n "done."
    echo
}

################################################################################
#
# The compile_all function:
#
# Compile the Liberty Eiffel tools
#

compile_all() {
    n=$(ls $LIBERTY_HOME/src/tools/main/*.ace 2>/dev/null | wc -l || echo 0)
    if [ $n -gt 0 ]; then
        i=0
        for f in $LIBERTY_HOME/src/tools/main/*.ace; do
            ace=${f##*/} && ace=${ace%.ace}
            progress 30 $i $n $ace
            cd $TARGET/bin/${ace}.d
            run ../se c -verbose ${ace}.ace
            cd .. && test -e "$ace" || ln -s ${ace}.d/$ace .
            i=$((i+1))
        done
        progress 30 $n $n "done."
        echo
    fi
}

################################################################################
#
# The make_doc function:
#
# Invoke eiffeldoc to build the documentation
#

make_doc() {
    export DOC_ROOT=$TARGET/doc/
    export LOG=$TARGET/log/build_doc$(date +'-%Y%m%d-%H%M%S').log
    test -d $DOC_ROOT && rm -rf $DOC_ROOT
    mkdir -p $DOC_ROOT

    $LIBERTY_HOME/work/build_doc.sh
}

################################################################################
#
# The packaging functions
#

do_pkg_tools() {
    PUBLIC=$USRDIR/bin
    PRIVATE=$USRDIR/lib/liberty-eiffel/bin
    ETC=$ETCDIR/xdg/liberty-eiffel
    SHORT=$USRDIR/share/liberty-eiffel/short
    SYS=$USRDIR/share/liberty-eiffel/sys
    SITE_LISP=$USRDIR/share/emacs/site-lisp/liberty-eiffel

    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $PUBLIC $PRIVATE $ETC $SHORT $SYS $SITE_LISP

    install -m 0755 -o ${LE_USER} -g ${LE_GROUP} $TARGET/bin/se $PUBLIC/
    install -m 0644 -o ${LE_USER} -g ${LE_GROUP} $LIBERTY_HOME/work/eiffel.el $SITE_LISP/

    for tool in compile compile_to_c clean pretty short finder ace_check class_check eiffeldoc eiffeltest extract_internals mock
    do
        bin=$TARGET/bin/${tool}.d/$tool
        if test -e $bin; then
            echo "$bin to $PRIVATE/"
            install -m 0755 -o ${LE_USER} -g ${LE_GROUP} $bin $PRIVATE/
        fi
    done

    cp -a $LIBERTY_HOME/resources/short/* $SHORT
    cp -a $LIBERTY_HOME/sys/* $SYS

    chown -R ${LE_USER}:${LE_GROUP} $SHORT $SYS

    cat >$ETC/liberty.se <<EOF
[General]
bin: /usr/lib/liberty-eiffel/bin
sys: /usr/share/liberty-eiffel/sys
short: /usr/share/liberty-eiffel/short
os: ${OS}
flavor: ${flavor}
tag: 3
jobs: ${jobs}

[Environment]
hyphen: -

[Tools]
ace_check: ace_check
c2c: compile_to_c
c: compile
class_check: class_check
clean: clean
doc: eiffeldoc
find: finder
mock: mock
pretty: pretty
short: short
test: eiffeltest
test_ng: eiffeltest_ng
test_server: eiffeltest_server
wrap: wrappers_generator
x_int: extract_internals

[boost]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS} -O2
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS} -O2
cpp_linker_options: ${LDFLAGS}

[no_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS} -O1
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS} -O1
cpp_linker_options: ${LDFLAGS}

[require_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS}
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_options: ${LDFLAGS}

[ensure_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS}
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_options: ${LDFLAGS}

[invariant_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS}
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_options: ${LDFLAGS}

[loop_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS}
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_options: ${LDFLAGS}

[all_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS}
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS}
cpp_linker_options: ${LDFLAGS}

[debug_check]
c_compiler_type: ${CC_TYPE}
c_compiler_options: ${CFLAGS} -g
c_linker_options: ${LDFLAGS}
cpp_compiler_type: ${CXX_TYPE}
cpp_compiler_options: ${CXXFLAGS} -g
cpp_linker_options: ${LDFLAGS}
smarteiffel_options: -no_strip

EOF

    chown ${LE_USER}:${LE_GROUP} $ETC/liberty.se
}

_do_pkg_src() {
    local section=$1
    shift
    local src=("$@")

    SRC=$USRDIR/share/liberty-eiffel/src/$section
    ETC=$ETCDIR/xdg/liberty-eiffel

    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $SRC $ETC

    for s in "${src[@]}"; do
        if [ -r $SRC/loadpath.se ]; then
            mv $SRC/loadpath.se $SRC/loadpath.se.old
        else
            touch $SRC/loadpath.se.old
        fi

        cp -a $s/* $SRC/

        if [ -r $SRC/loadpath.se ]; then
            mv $SRC/loadpath.se $SRC/loadpath.se.new
        else
            touch $SRC/loadpath.se.new
        fi

        cat $SRC/loadpath.se.{old,new} | sort -u > $SRC/loadpath.se
        rm $SRC/loadpath.se.{old,new}
    done

    find $SRC -type f -exec chmod a-x {} +
    chown -R ${LE_USER}:${LE_GROUP} $SRC

    cat > $ETC/liberty_${section}.se <<EOF
[Environment]
path_${section}: /usr/share/liberty-eiffel/src/${section}/

[Loadpath]
${section}: \${path_${section}}loadpath.se
EOF

    chown ${LE_USER}:${LE_GROUP} $ETC/liberty_${section}.se
}

do_pkg_tools_src() {
    _do_pkg_src tools $LIBERTY_HOME/src/smarteiffel $LIBERTY_HOME/src/tools
}

do_pkg_core_libs() {
    _do_pkg_src core $LIBERTY_HOME/src/lib
}

do_pkg_extra_libs() {
    _do_pkg_src liberty_extra $LIBERTY_HOME/src/wrappers
}

do_pkg_staging_libs() {
    _do_pkg_src liberty_staging $LIBERTY_HOME/src/staging
}

do_pkg_tutorial() {
    _do_pkg_src tutorial $LIBERTY_HOME/tutorial
}

do_pkg_tools_doc() {
    DOC=$USRDIR/share/doc/liberty-eiffel
    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $DOC/tools/{liberty,smarteiffel}
    cp -a $TARGET/doc/api/smarteiffel/* $DOC/tools/smarteiffel/
    cp -a $TARGET/doc/api/liberty/* $DOC/tools/liberty/
    find $DOC -type f -exec chmod a-x {} +
    chown -R ${LE_USER}:${LE_GROUP} $DOC
}

do_pkg_core_doc() {
    DOC=$USRDIR/share/doc/liberty-eiffel
    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $DOC/core
    cp -a $TARGET/doc/api/libraries/* $DOC/core/
    find $DOC -type f -exec chmod a-x {} +
    chown -R ${LE_USER}:${LE_GROUP} $DOC
}

do_pkg_extra_doc() {
    DOC=$USRDIR/share/doc/liberty-eiffel
    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $DOC/extra
    cp -a $TARGET/doc/api/wrappers/* $DOC/extra/
    find $DOC -type f -exec chmod a-x {} +
    chown -R ${LE_USER}:${LE_GROUP} $DOC
}

do_pkg_staging_doc() {
    DOC=$USRDIR/share/doc/liberty-eiffel
    install -d -m 0755 -o ${LE_USER} -g ${LE_GROUP} $DOC/staging
    cp -a $TARGET/doc/api/staging/* $DOC/staging/
    find $DOC -type f -exec chmod a-x {} +
    chown -R ${LE_USER}:${LE_GROUP} $DOC
}

get_user_group_info() {
    read -p "User to install as [$(id -un)]: " LE_USER
    read -p "Group to install as [$(id -gn)]: " LE_GROUP
    export LE_USER=${LE_USER:-$(id -un)}
    export LE_GROUP=${LE_GROUP:-$(id -gn)}
}

check_target_dir_permissions() {
    for d in $*
    do
       if test ! -x "${d}"
       then
           error_message "${d} does not exist.  You may need to create it."
       elif test ! -w "${d}"
       then
           error_message "You don't have write permission to ${d}." "Specify a writeable directory or run using sudo."
           exit 1
       fi
    done
}

do_local_install() {
    export USRDIR=${USRDIR:-/usr/local}
    export ETCDIR=${ETCDIR:-/usr/local/etc}
    check_target_dir_permissions "${USRDIR}" "${ETCDIR}"
    get_user_group_info
    do_pkg_tools
    do_pkg_tools_src
    do_pkg_tools_doc
    do_pkg_core_libs
    do_pkg_core_doc
    do_pkg_extra_libs
    do_pkg_extra_doc
    do_pkg_staging_libs
    do_pkg_staging_doc
    do_pkg_tutorial

    ## TODO: move into a separate function
    export LOCAL_MAN_PATH="~/.local/share/man/man1/"
    echo "Locally installing manpages in $LOCAL_MAN_PATH"
    if [ ! -d $LOCAL_MAN_PATH]; then
       echo "Creating $LOCAL_MAN_PATH"
       mkdir -p $LOCAL_MAN_PATH
    fi
    cp $LIBERTY_HOME/misc/manpages/*.1.gz $LOCAL_MAN_PATH
}

do_pkg() {
    if [ x$DESTDIR == x ]; then
        echo "No DESTDIR, please call from debian helper tools" >&2
        exit 1
    fi
    echo do_pkg: DESTDIR= $DESTDIR
    echo
    export USRDIR=$DESTDIR/usr
    export ETCDIR=$DESTDIR/etc
    case "$1" in
        tools)        do_pkg_tools;;
        tools_src)    do_pkg_tools_src;;
        tools_doc)    do_pkg_tools_doc;;
        core_libs)    do_pkg_core_libs;;
        core_doc)     do_pkg_core_doc;;
        extra_libs)   do_pkg_extra_libs;;
        extra_doc)    do_pkg_extra_doc;;
        tutorial)     do_pkg_tutorial;;
        staging_libs) do_pkg_staging_libs;;
        staging_doc)  do_pkg_staging_doc;;
        *)
            echo "Unknown pkg name: $1" >&2
            exit 1
            ;;
    esac
}

################################################################################
#
# Main
#

if [ $# = 0 ]; then
    bootstrap
else
    while [ $# -gt 0 ]; do
        case x"$1" in
            x-plugins)
                compile_plugins
                ;;
            x-wrappers)
                generate_wrappers
                ;;
            x-bootstrap)
                bootstrap
                ;;
            x-compile)
                compile_all
                ;;
            x-package)
                shift
                do_pkg "$1"
                ;;
            x-plain)
                plain=TRUE
                ;;
            x-doc)
                make_doc
                ;;
            x-local_install)
                do_local_install
                ;;
            *)
                echo "Unknown argument: $1"
                cat >&2 <<EOF

Usage: $0 {-bootstrap|-plugins|-wrappers|-doc|-package}

  -bootstrap   Bootstraps Liberty Eiffel.

  -plugins     Compiles the plugins used by the Liberty interpreter.

  -wrappers    Generates the library wrappers; some are used by the
                           Liberty tools themselves (ffi, readline, llvm, ...)

  -doc         Generates the HTML documentation for all classes.

  -package     Generates the Debian packages into \$DESTDIR.

  -local_install Installs Liberty Eiffel in /usr/local (config in /usr/local/etc)

  If no argument is provided, -bootstrap is assumed.

EOF
                exit 1
                ;;
        esac
        shift
    done
fi
