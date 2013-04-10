#!/usr/bin/env bash

MAXTOOLCOUNT=20

test ${0%/*} != $0 && cd ${0%/*}
export CC_TYPE=${CC_TYPE:-gcc}
export CC=${CC:-$CC_TYPE}
export CXX=${CXX:-g++}
export LIBERTY_HOME=$(pwd)
export PATH=$LIBERTY_HOME/target/bin:$PATH
export plain=${plain:-FALSE}
export LOG=$LIBERTY_HOME/target/log/install$(date +'-%Y%m%d-%H%M%S').log
export PREREQUISITES="$CC $CXX gccxml"
unset CDPATH
. $LIBERTY_HOME/work/tools.sh

#BOOST_OPT="-fgcse"
#BOOST_OPT="-fgcse-lm -finline-small-functions -fdevirtualize -fexpensive-optimizations -fcaller-saves -fcrossjumping -fcse-follow-jumps -fcse-skip-blocks -fdelete-null-pointer-checks -fthread-jumps -falign-functions -falign-jumps -falign-loops -falign-labels -findirect-inlining -fipa-sra -foptimize-sibling-calls -fpartial-inlining -fpeephole2 -fregmove -freorder-blocks -freorder-functions -frerun-cse-after-loop -fsched-interblock -fsched-spec -fschedule-insns -fschedule-insns2 -fstrict-aliasing -fstrict-overflow -ftree-switch-conversion -ftree-tail-merge -ftree-pre -ftree-vrp -fpartial-inlining -fpeephole2 -fregmove -freorder-blocks -freorder-functions -frerun-cse-after-loop -fsched-interblock -fsched-spec -fschedule-insns -fschedule-insns2 -fstrict-aliasing -fstrict-overflow -ftree-switch-conversion -ftree-tail-merge -ftree-pre -ftree-vrp"

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
    cd $LIBERTY_HOME
    test -d target || mkdir target
    cd target
    test -d log || mkdir log

    check_prerequisites

    if [ ! -d bin ]; then
        title "Preparing target"
        mkdir bin
        cd bin
        for ace in $LIBERTY_HOME/src/tools/*/*.ace; do
            tool=$(basename $(dirname $ace))
            if [[ $tool.ace == $(basename $ace) ]]; then
                mkdir $LIBERTY_HOME/target/bin/$tool.d
                ln -s $ace $LIBERTY_HOME/target/bin/$tool.d
            fi
        done
        cd ..
    fi

    if [ ! -d libertyrc ]; then
        title "Preparing Liberty environment"
        mkdir libertyrc
        cd libertyrc
        cat > libertyi.rc <<EOF
master libertyi

environment
        path_liberty is "$LIBERTY_HOME"
        sys is "$LIBERTY_HOME/target"

cluster
        LIBERTY_LIBRARY: "\${path_liberty}/src/lib"
        LIBERTY_TOOLS: "\${path_liberty}/src/tools"
        LIBERTY_WRAPPERS: "\${path_liberty}/src/wrappers"
        SMARTEIFFEL_TOOLS: "\${path_liberty}/src/smarteiffel"

end
EOF
        cd ..
    fi

    if [ -L $HOME/.liberty ]; then
        rm $HOME/.liberty
    elif [ -e $HOME/.liberty ]; then
        mv $HOME/.liberty $HOME/.liberty~
    fi
    ln -s $LIBERTY_HOME/target/libertyrc $HOME/.liberty

    if [ ! -d serc ]; then
        title "Preparing SmartEiffel environment"
        mkdir serc
        cd serc
        cat > liberty.se <<EOF
[General]
bin: $LIBERTY_HOME/target/bin
sys: $LIBERTY_HOME/sys
short: $LIBERTY_HOME/resources/short
os: UNIX
flavor: Linux
tag: 3
jobs: $((2 * $(grep '^processor' /proc/cpuinfo|wc -l)))

[Environment]
path_liberty: $LIBERTY_HOME/
path_lib: $LIBERTY_HOME/src/lib/
path_tools: $LIBERTY_HOME/src/smarteiffel/
path_tutorial: $LIBERTY_HOME/tutorial/

[Loadpath]
liberty: \${path_liberty}src/loadpath.se
test: \${path_liberty}test/loadpath.se
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
run: run
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
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -O2 -fno-gcse
cpp_linker_path: $CC

[no_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe -O1
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -O1
cpp_linker_path: $CC

[require_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC

[ensure_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC

[invariant_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC

[loop_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC

[all_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe
cpp_linker_path: $CC

[debug_check]
c_compiler_type: $CC_TYPE
c_compiler_path: $CC
c_compiler_options: -pipe -g
c_linker_path: $CC
cpp_compiler_type: g++
cpp_compiler_path: $CXX
cpp_compiler_options: -pipe -g
cpp_linker_path: $CC
smarteiffel_options: -no_strip

EOF
        cd ..
    fi

    if [ -L $HOME/.serc ]; then
        rm $HOME/.serc
    elif [ -e $HOME/.serc ]; then
        mv $HOME/.serc $HOME/.serc~
    fi
    ln -s $LIBERTY_HOME/target/serc $HOME/.serc

    title "Bootstrapping SmartEiffel tools"
    cd $LIBERTY_HOME/resources/smarteiffel-germ

    if [ ! -d $LIBERTY_HOME/target/bin/compile_to_c.d ]; then
        progress 30 0 $MAXTOOLCOUNT "germ"
        test -d $LIBERTY_HOME/target/bin/compile_to_c.d || mkdir $LIBERTY_HOME/target/bin/compile_to_c.d
        run $CC -c compile_to_c.c && run $CC compile_to_c.o -o $LIBERTY_HOME/target/bin/compile_to_c.d/compile_to_c || exit 1
    fi
    cd $LIBERTY_HOME/target/bin/compile_to_c.d

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
        progress 30 1 $MAXTOOLCOUNT "T2: save"
        mkdir T2
        cp -a compile_to_c* T2/
        progress 30 1 $MAXTOOLCOUNT "T2: check"
        if grep "$CC" compile_to_c.make >/dev/null 2>&1; then
            rm compile_to_c.make
            cp -a compile_to_c.new compile_to_c
            progress 30 3 $MAXTOOLCOUNT "T3: compile_to_c"
            run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c.new || exit 1
            progress 30 1 $MAXTOOLCOUNT "T3: save"
            mkdir T3
            cp -a compile_to_c* T3/
            progress 30 1 $MAXTOOLCOUNT "T3: check"
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
    run ../compile_to_c -verbose -boost -no_split compile -o compile || exit 1
    grep ^$CC compile.make | while read cmd; do
        run $cmd || exit 1
    done
    cd .. && test -e compile || ln -s compile.d/compile .

    while read i tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        run ../compile -verbose -boost -no_split $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
5 se
6 clean
7 ace_check
8 eiffeltest
9 eiffeltest_ng
10 eiffeltest_server
EOF
    while read i tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        run ../compile -verbose -boost $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
11 pretty
12 short
13 class_check
14 finder
15 eiffeldoc
16 extract_internals
EOF

    while read i tool; do
        progress 30 $(($MAXTOOLCOUNT - 2)) $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        if [ -e $tool.ace ]; then
            run ../se c -verbose $tool.ace
        else
            run ../se c -verbose -boost $tool -o $tool || exit 1
        fi
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done <<EOF
17 wrappers-generator
18 mocker
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
    cd $LIBERTY_HOME/target/bin
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
            cd $LIBERTY_HOME/target/bin/${ace}.d
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
    (
        test -d $LIBERTY_HOME/target/doc && rm -rf $LIBERTY_HOME/target/doc
        for doc in tools core; do
            mkdir -p $LIBERTY_HOME/target/doc/$doc
        done

        cd $LIBERTY_HOME/target/doc/tools
        se doc $LIBERTY_HOME/src/smarteiffel/loadpath.se

        cd $LIBERTY_HOME/target/doc/core
        se doc $LIBERTY_HOME/src/lib/loadpath.se
    )
}

function do_pkg_tools()
{
    PUBLIC=$DESTDIR/usr/bin
    PRIVATE=$DESTDIR/usr/share/libertyeiffel/bin
    ETC=$DESTDIR/etc/serc
    SHORT=$DESTDIR/usr/share/libertyeiffel/short
    SYS=$DESTDIR/usr/share/libertyeiffel/sys
    SITE_LISP=$DESTDIR/usr/share/emacs/site-lisp/libertyeiffel

    install -d -m 0755 -o root -g root $PUBLIC $PRIVATE $ETC $SITE_LISP

    install -m 0755 -o root -g root $LIBERTY_HOME/target/bin/se $PUBLIC/
    install -m 0644 -o root -g root $LIBERTY_HOME/work/eiffel.el $SITE_LISP/

    for tool in compile compile_to_c clean pretty short find ace_check class_check eiffeldoc eiffeltest extract_internals
    do
        bin=$LIBERTY_HOME/target/bin/${tool}.d/$tool
        if test -e $bin; then
            echo "$bin to $PRIVATE/"
            install -m 0755 -o root -g root $bin $PRIVATE/
        fi
    done

    cp -a $LIBERTY_HOME/resources/short $SHORT
    cp -a $LIBERTY_HOME/sys $SYS

    chown -R root:root $SHORT $SYS

    cat >$ETC/liberty.se <<EOF
[General]
bin: /usr/share/libertyeiffel/bin
sys: /usr/share/libertyeiffel/sys
short: /usr/share/libertyeiffel/short
os: UNIX
flavor: Linux
tag: 3
jobs: 2

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
run: run
short: short
test: eiffeltest
test_ng: eiffeltest_ng
test_server: eiffeltest_server
wrap: wrappers-generator
x_int: extract_internals

[boost]
c_compiler_type: gcc
c_compiler_options: -pipe -O1
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O1

[no_check]
c_compiler_type: gcc
c_compiler_options: -pipe -O1
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O1

[require_check]
c_compiler_type: gcc
c_compiler_options: -pipe
cpp_compiler_type: g++
cpp_compiler_options: -pipe

[ensure_check]
c_compiler_type: gcc
c_compiler_options: -pipe
cpp_compiler_type: g++
cpp_compiler_options: -pipe

[invariant_check]
c_compiler_type: gcc
c_compiler_options: -pipe
cpp_compiler_type: g++
cpp_compiler_options: -pipe

[loop_check]
c_compiler_type: gcc
c_compiler_options: -pipe
cpp_compiler_type: g++
cpp_compiler_options: -pipe

[all_check]
c_compiler_type: gcc
c_compiler_options: -pipe
cpp_compiler_type: g++
cpp_compiler_options: -pipe

[debug_check]
c_compiler_type: gcc
c_compiler_options: -pipe -g
cpp_compiler_type: g++
cpp_compiler_options: -pipe -g
smarteiffel_options: -no_strip

EOF

    chown root:root $ETC/liberty.se
}

function do_pkg_tools_src()
{
    SRC=$DESTDIR/usr/share/libertyeiffel/src/
    ETC=$DESTDIR/etc/serc

    install -d -m 0755 -o root -g root $SRC $ETC

    cp -a $LIBERTY_HOME/src/smarteiffel $SRC/tools
    chown -R root:root $SRC/tools

cat > $ETC/liberty_tools.se <<EOF
[Environment]
path_tools: /usr/share/libertyeiffel/src/tools/

[Loadpath]
tools: ${path_tools}loadpath.se
EOF
}

function do_pkg_core_libs()
{
    SRC=$DESTDIR/usr/share/libertyeiffel/src/
    ETC=$DESTDIR/etc/serc

    install -d -m 0755 -o root -g root $SRC $ETC

    cp -a $LIBERTY_HOME/src/lib $SRC/core
    chown -R root:root $SRC/core

cat > $ETC/liberty_core.se <<EOF
[Environment]
path_liberty: /usr/share/libertyeiffel/src/core/

[Loadpath]
liberty: ${path_liberty}loadpath.se
EOF
}

function do_pkg_tools_doc()
{
    DOC=$DESTDIR/usr/share/doc/libertyeiffel/
    install -d -m 0755 -o root -g root $DOC
    cp -a $LIBERTY_HOME/target/doc/tools $DOC/
    chown -R root:root $DOC
}

function do_pkg_core_doc()
{
    DOC=$DESTDIR/usr/share/doc/libertyeiffel/
    install -d -m 0755 -o root -g root $DOC
    cp -a $LIBERTY_HOME/target/doc/core $DOC/
    chown -R root:root $DOC
}

function do_pkg()
{
    do_pkg_tools
    do_pkg_tools_src
    do_pkg_tools_doc
    do_pkg_core_libs
    do_pkg_core_doc
}

function do_all()
{
    test -d $LIBERTY_HOME/target && rm -rf $LIBERTY_HOME/target
    bootstrap
    #compile_plugins
    #generate_wrappers
    #compile_all
    #make_doc
}

if [ $# = 0 ]; then
    #if [ -d $LIBERTY_HOME/target ]; then
    #    #compile_all
    #else
    #    do_all
    #fi

    do_all
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
                do_all
                ;;
            x-bootstrap-se)
                bootstrap
                ;;
            x-compile)
                compile_all
                ;;
            x-package)
                do_pkg
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

Usage: $0 {-bootstrap|-plugins|-wrappers|-bootstrap-se|-package}

  -bootstrap   Bootstraps Liberty starting from SmartEiffel compilation,
               Liberty configuration files, up to the plugins, wrappers,
               and Liberty tools installation

  -bootstrap-se Bootstraps SmartEiffel

  -plugins     Compiles the plugins used by the Liberty interpreter

  -wrappers    Generates the library wrappers; some are used by the
               Liberty tools themselves (ffi, readline, llvm, ...)

  -doc         Generates the HTML documentation for all classes.

  -package     Generates the Debian packages into DESTDIR.

  If no argument is provided, then only the Liberty tools are rebuilt
  or the installation is bootstrapped if not already done.

EOF
                exit 1
                ;;
        esac
        shift
    done
fi
