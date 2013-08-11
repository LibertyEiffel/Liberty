#!/usr/bin/env bash

MAXTOOLCOUNT=20

cd $(dirname $(readlink -f $0))

export CC_TYPE=${CC_TYPE:-gcc}
export CC=${CC:-$CC_TYPE}
export CXX=${CXX:-g++}
export LIBERTY_HOME=$(pwd)
export TARGET=${TARGET:-$LIBERTY_HOME/target}
export PATH=$TARGET/bin:$PATH
export plain=${plain:-FALSE}
export LOG=$TARGET/log/install$(date +'-%Y%m%d-%H%M%S').log
export PREREQUISITES="$CC $CXX gccxml"
unset CDPATH

. $LIBERTY_HOME/work/tools.sh

function check_prerequisites()
{
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

function bootstrap()
{
    test -d $TARGET && rm -rf $TARGET
    mkdir $TARGET
    cd $TARGET
    test -d log || mkdir log

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

    if [ ! -d serc ]; then
        title "Preparing SmartEiffel environment"
        mkdir serc
        cd serc
        cat > liberty.se <<EOF
[General]
bin: $TARGET/bin
sys: $LIBERTY_HOME/sys
short: $LIBERTY_HOME/resources/short
os: UNIX
flavor: Linux
tag: 3
jobs: $((2 * $(grep '^processor' /proc/cpuinfo|wc -l)))

[Environment]
path_liberty: $LIBERTY_HOME/
path_liberty_core: $LIBERTY_HOME/src/lib/
path_liberty_extra: $LIBERTY_HOME/src/wrappers/
path_smarteiffel: $LIBERTY_HOME/src/smarteiffel/
path_tools: $LIBERTY_HOME/src/tools/
path_tutorial: $LIBERTY_HOME/tutorial/
hyphen: -

[Loadpath]
liberty_core: \${path_liberty_core}loadpath.se
liberty_extra: \${path_liberty_extra}loadpath.se
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
mock: mocker
pretty: pretty
short: short
test: eiffeltest
test_ng: eiffeltest_ng
test_server: eiffeltest_server
wrap: wrappers-generator
x_int: extract_internals

[boost]
-- c_compiler_type: tcc
-- smarteiffel_options: -no_strip
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe -O2 -fno-gcse
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -O2 -fno-gcse
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[no_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe -O1
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -O1
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[require_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[ensure_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[invariant_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[loop_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[all_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed

[debug_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe -g
c_linker_path: $CC
c_linker_options: -Xlinker -${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -g
cpp_linker_path: $CC
cpp_linker_options: -Xlinker -${hyphen}no-as-needed
smarteiffel_options: -no_strip

EOF
        cd ..
    fi

    if [ -L $HOME/.serc ]; then
        rm $HOME/.serc
    elif [ -e $HOME/.serc ]; then
        mv $HOME/.serc $HOME/.serc~
    fi
    ln -s $TARGET/serc $HOME/.serc

    title "Bootstrapping SmartEiffel tools"
    cd $LIBERTY_HOME/resources/smarteiffel-germ

    if [ ! -d $TARGET/bin/compile_to_c.d ]; then
        progress 30 0 $MAXTOOLCOUNT "germ"
        test -d $TARGET/bin/compile_to_c.d || mkdir $TARGET/bin/compile_to_c.d
        run $CC -c compile_to_c.c && run $CC compile_to_c.o -o $TARGET/bin/compile_to_c.d/compile_to_c || exit 1
    fi
    cd $TARGET/bin/compile_to_c.d

    progress 30 1 $MAXTOOLCOUNT "T1: compile_to_c"
    run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c.new || exit 1
    grep -v '^#' compile_to_c.make | while read cmd; do
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
        run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c.new || exit 1
        grep -v '^#' compile_to_c.make | while read cmd; do
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
            run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c.new || exit 1
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
    grep ^$CC compile.make | while read cmd; do
        run $cmd || exit 1
    done
    cd .. && test -e compile || ln -s compile.d/compile .

    while read i gc tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        case $gc in
            no) GC="-no_gc";;
            bdw) GC="-bdw_gc";;
            *) GC="";;
        esac
        run ../compile -verbose -boost $GC -no_split $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
5  no se
6  bdw clean
7  bdw ace_check
8  bdw eiffeltest
9  yes eiffeltest_ng
10 yes eiffeltest_server
EOF
    while read i gc tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        case $gc in
            no) GC="-no_gc";;
            bdw) GC="-bdw_gc";;
            *) GC="";;
        esac
        run ../compile -verbose -boost $GC $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
11 yes pretty
12 yes short
13 yes class_check
14 yes finder
15 yes eiffeldoc
16 yes extract_internals
EOF

    while read i gc tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        if [ -e $tool.ace ]; then
            run ../se c -verbose $tool.ace
        else
            case $gc in
                no) GC="-no_gc";;
                bdw) GC="-bdw_gc";;
                *) GC="";;
            esac
            run ../se c -verbose -boost $GC $tool -o $tool || exit 1
        fi
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
17 _   wrappers-generator
18 yes mocker
EOF

    progress 30 $(($MAXTOOLCOUNT - 1)) $MAXTOOLCOUNT "se_make.sh"
    cp $LIBERTY_HOME/work/se_make.sh .

    progress 30 $MAXTOOLCOUNT $MAXTOOLCOUNT "done."
    echo
}

function compile_plugins()
{
    title "Compiling plugins"
    check_prerequisites
    cd $LIBERTY_HOME/work
    ./compile_plugins.sh
}

function generate_wrappers()
{
    title "Generating wrappers"
    cd $TARGET/bin
    cd wrappers-generator.d
    n=$(ls $LIBERTY_HOME/src/wrappers/*/library/externals/Makefile | wc -l)
    n=$((n+1))
    progress 30 0 $n "Building the wrappers generator"
    run ../se c -verbose wrappers-generator.ace
    cd .. && test -e wrappers-generator || ln -s wrappers-generator.d/wrappers-generator .
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

function compile_all()
{
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

function make_doc()
{
    export DOC_ROOT=$TARGET/doc/
    export LOG=$TARGET/log/build_doc$(date +'-%Y%m%d-%H%M%S').log
    test -d $DOC_ROOT && rm -rf $DOC_ROOT
    mkdir -p $DOC_ROOT

    $LIBERTY_HOME/work/build_doc.sh
}

function do_pkg_tools()
{
    PUBLIC=$DESTDIR/usr/bin
    PRIVATE=$DESTDIR/usr/lib/liberty-eiffel/bin
    ETC=$DESTDIR/etc/serc
    SHORT=$DESTDIR/usr/share/liberty-eiffel/short
    SYS=$DESTDIR/usr/share/liberty-eiffel/sys
    SITE_LISP=$DESTDIR/usr/share/emacs/site-lisp/liberty-eiffel

    install -d -m 0755 -o root -g root $PUBLIC $PRIVATE $ETC $SHORT $SYS $SITE_LISP

    install -m 0755 -o root -g root $TARGET/bin/se $PUBLIC/
    install -m 0644 -o root -g root $LIBERTY_HOME/work/eiffel.el $SITE_LISP/

    for tool in compile compile_to_c clean pretty short find ace_check class_check eiffeldoc eiffeltest extract_internals mocker
    do
        bin=$TARGET/bin/${tool}.d/$tool
        if test -e $bin; then
            echo "$bin to $PRIVATE/"
            install -m 0755 -o root -g root $bin $PRIVATE/
        fi
    done

    cp -a $LIBERTY_HOME/resources/short/* $SHORT
    cp -a $LIBERTY_HOME/sys/* $SYS

    chown -R root:root $SHORT $SYS

    cat >$ETC/liberty.se <<EOF
[General]
bin: /usr/lib/liberty-eiffel/bin
sys: /usr/share/liberty-eiffel/sys
short: /usr/share/liberty-eiffel/short
os: UNIX
flavor: Linux
tag: 3
jobs: 2

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
mock: mocker
pretty: pretty
short: short
test: eiffeltest
test_ng: eiffeltest_ng
test_server: eiffeltest_server
wrap: wrappers-generator
x_int: extract_internals

[boost]
c_compiler_type: gcc
c_compiler_options: -pipe -O2 -fno-gcse
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O2 -fno-gcse
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[no_check]
c_compiler_type: gcc
c_compiler_options: -pipe -O1
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O1
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[require_check]
c_compiler_type: gcc
c_compiler_options: -pipe
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[ensure_check]
c_compiler_type: gcc
c_compiler_options: -pipe
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[invariant_check]
c_compiler_type: gcc
c_compiler_options: -pipe
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[loop_check]
c_compiler_type: gcc
c_compiler_options: -pipe
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[all_check]
c_compiler_type: gcc
c_compiler_options: -pipe
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed

[debug_check]
c_compiler_type: gcc
c_compiler_options: -pipe -g
c_linker_options: -Xlinker -\${hyphen}no-as-needed
cpp_compiler_type: g++
cpp_compiler_options: -pipe -g
cpp_linker_options: -Xlinker -\${hyphen}no-as-needed
smarteiffel_options: -no_strip

EOF

    chown root:root $ETC/liberty.se
}

function _do_pkg_src()
{
    section=$1
    src=$2

    SRC=$DESTDIR/usr/share/liberty-eiffel/src
    ETC=$DESTDIR/etc/serc

    install -d -m 0755 -o root -g root $SRC $ETC

    cp -a $src $SRC/${section}
    find $SRC -type f -exec chmod a-x {} +
    chown -R root:root $SRC/${section}

cat > $ETC/liberty_${section}.se <<EOF
[Environment]
path_${section}: /usr/share/liberty-eiffel/src/${section}/

[Loadpath]
${section}: \${path_${section}}loadpath.se
EOF

    chown root:root $ETC/liberty_${section}.se
}

function do_pkg_tools_src()
{
    _do_pkg_src tools $LIBERTY_HOME/src/smarteiffel
}

function do_pkg_core_libs()
{
    _do_pkg_src core $LIBERTY_HOME/src/lib
}

function do_pkg_extra_libs()
{
    _do_pkg_src extra $LIBERTY_HOME/src/wrappers
}

function do_pkg_tools_doc()
{
    DOC=$DESTDIR/usr/share/doc/liberty-eiffel
    install -d -m 0755 -o root -g root $DOC/tools
    cp -a $TARGET/doc/api/smarteiffel/* $DOC/tools/smarteiffel/
    cp -a $TARGET/doc/api/liberty/* $DOC/tools/liberty/
    find $DOC -type f -exec chmod a-x {} +
    chown -R root:root $DOC
}

function do_pkg_core_doc()
{
    DOC=$DESTDIR/usr/share/doc/liberty-eiffel
    install -d -m 0755 -o root -g root $DOC
    cp -a $TARGET/doc/api/libraries/* $DOC/core/
    find $DOC -type f -exec chmod a-x {} +
    chown -R root:root $DOC
}

function do_pkg_extra_doc()
{
    DOC=$DESTDIR/usr/share/doc/liberty-eiffel
    install -d -m 0755 -o root -g root $DOC
    cp -a $TARGET/doc/api/wrappers/* $DOC/extra/
    find $DOC -type f -exec chmod a-x {} +
    chown -R root:root $DOC
}

function do_pkg()
{
    if [ x$DESTDIR == x ]; then
        echo "No DESTDIR, please call from debian helper tools" >&2
        exit 1
    fi
    echo do_pkg: DESTDIR= $DESTDIR
    echo
    case "$1" in
        tools)      do_pkg_tools;;
        tools_src)  do_pkg_tools_src;;
        tools_doc)  do_pkg_tools_doc;;
        core_libs)  do_pkg_core_libs;;
        core_doc)   do_pkg_core_doc;;
        extra_libs) do_pkg_extra_libs;;
        extra_doc)  do_pkg_extra_doc;;
        *)
            echo "Unknown pkg name: $1" >&2
            exit 1
            ;;
    esac
}

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
            *)
                echo "Unknown argument: $1"
                cat >&2 <<EOF

Usage: $0 {-bootstrap|-plugins|-wrappers|-doc|-package}

  -bootstrap   Bootstraps Liberty starting from SmartEiffel compilation,
               up to the plugins, wrappers, and Liberty tools installation

  -plugins     Compiles the plugins used by the Liberty interpreter

  -wrappers    Generates the library wrappers; some are used by the
               Liberty tools themselves (ffi, readline, llvm, ...)

  -doc         Generates the HTML documentation for all classes.

  -package     Generates the Debian packages into \$DESTDIR.

  If no argument is provided, -bootstrap is assumed.

EOF
                exit 1
                ;;
        esac
        shift
    done
fi
