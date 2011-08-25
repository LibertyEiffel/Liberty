#!/usr/bin/env bash

MAXTOOLCOUNT=16

test ${0%/*} != $0 && cd ${0%/*}
export LIBERTY_HOME=$(pwd)
export PATH=$LIBERTY_HOME/target/bin:$PATH
export plain=FALSE
export LOG=$LIBERTY_HOME/target/log/install$(date +'-%Y%m%d-%H%M%S').log

unset CDPATH
. $LIBERTY_HOME/work/tools.sh


# TODO: packaging
#
# Currently there is no top level Makefile. This may require additional tuning.
# Done. Please edit the files in the debian/ subdirectory now. You should also
# check that the libertyeiffel Makefiles install into $DESTDIR and not in / .
#


function bootstrap()
{
    cd $LIBERTY_HOME
    test -d target || mkdir target
    cd target
    test -d log || mkdir log

    if [ ! -d bin ]; then
        title "Preparing target"
        mkdir bin
        cd bin
        for f in $LIBERTY_HOME/src/tools/main/*.ace; do
            ace=${f##*/} && ace=${ace%.ace}
            mkdir $LIBERTY_HOME/target/bin/${ace}.d
            ln -s $f $LIBERTY_HOME/target/bin/${ace}.d/
        done
        mkdir $LIBERTY_HOME/target/bin/wrappers-generator.d
        ln -s $LIBERTY_HOME/src/tools/wrappers-generator/wrappers-generator.ace $LIBERTY_HOME/target/bin/wrappers-generator.d
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
jobs: 4

[Environment]
path_liberty: $LIBERTY_HOME/
path_se_tools: $LIBERTY_HOME/src/smarteiffel/
path_se_tutorial: $LIBERTY_HOME/tutorial/

[Loadpath]
liberty: \${path_liberty}src/loadpath.se
test: \${path_liberty}test/loadpath.se
se_tools: \${path_se_tools}loadpath.se
se_tutorial: \${path_se_tutorial}loadpath.se

[Tools]
c: compile
c2c: compile_to_c
clean: clean
pretty: pretty
short: short
find: finder
ace_check: ace_check
class_check: class_check
doc: eiffeldoc
test: eiffeltest
x_int: extract_internals
make: se_make.sh

[boost]
-- c_compiler_type: tcc
-- smarteiffel_options: -no_strip
c_compiler_type: gcc
c_compiler_options: -pipe -Os
cpp_compiler_type: g++
cpp_compiler_options: -pipe -Os

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

[release]
c_compiler_type: gcc
c_compiler_options: -pipe -O3 -fomit-frame-pointer
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O3 -fomit-frame-pointer
smarteiffel_options: -no_split

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
        run gcc -c compile_to_c.c && run gcc compile_to_c.o -o $LIBERTY_HOME/target/bin/compile_to_c.d/compile_to_c || exit 1
    fi
    cd $LIBERTY_HOME/target/bin/compile_to_c.d

    progress 30 1 $MAXTOOLCOUNT "compile_to_c T1"
    run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c || exit 1
    if [ $(grep -c ^gcc compile_to_c.make) != 0 ]; then
        grep ^gcc compile_to_c.make | while read cmd; do
            progress 30 1 $MAXTOOLCOUNT "$cmd"
            run $cmd || exit 1
        done

        progress 30 2 $MAXTOOLCOUNT "compile_to_c T2"
        run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c || exit 1
        if [ $(grep -c ^gcc compile_to_c.make) != 0 ]; then
            grep ^gcc compile_to_c.make | while read cmd; do
                progress 30 2 $MAXTOOLCOUNT "$cmd"
                run $cmd || exit 1
            done

            progress 30 3 $MAXTOOLCOUNT "compile_to_c T3"
            run ./compile_to_c -verbose -boost compile_to_c -o compile_to_c || exit 1
            if [ $(grep -c ^gcc compile_to_c.make) != 0 ]; then
                cat compile_to_c.make >> $LOG
                error "The compiler is not stable."
                exit 1
            fi
        fi
    fi
    cd .. && test -e compile_to_c || ln -s compile_to_c.d/compile_to_c .

    progress 30 4 $MAXTOOLCOUNT "compile"
    test -d compile.d || mkdir compile.d
    cd compile.d
    run ../compile_to_c -verbose -boost -no_split compile -o compile || exit 1
    grep ^gcc compile.make | while read cmd; do
        run $cmd || exit 1
    done
    cd .. && test -e compile || ln -s compile.d/compile .

    {
        echo 5 se
        echo 6 clean
        echo 7 eiffeldoc
    } | while read i tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        run ../compile -verbose -boost -no_split $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done
    {
        echo 8  pretty
        echo 9  short
        echo 10 class_check
        echo 11 finder
        echo 12 eiffeltest
        echo 13 ace_check
        echo 14 extract_internals
    } | while read i tool; do
        progress 30 $i $MAXTOOLCOUNT "$tool"
        test -d ${tool}.d || mkdir ${tool}.d
        cd ${tool}.d
        run ../compile -verbose -boost $tool -o $tool || exit 1
        cd .. && test -e ${tool} || ln -s ${tool}.d/$tool .
    done

    progress 30 $(($MAXTOOLCOUNT - 1)) $MAXTOOLCOUNT "se_make.sh"
    cp $LIBERTY_HOME/work/se_make.sh .

    progress 30 $MAXTOOLCOUNT $MAXTOOLCOUNT "done."
    echo
}

function compile_plugins()
{
    title "Compiling plugins"
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
    n=$(ls $LIBERTY_HOME/src/tools/main/*.ace | wc -l)
    i=0
    for f in $LIBERTY_HOME/src/tools/main/*.ace; do
        ace=${f##*/} && ace=${ace%.ace}
        progress 30 $i $n $ace
        cd $LIBERTY_HOME/target/bin/${ace}.d
        run ../se c -verbose ${ace}.ace
        cd .. && test -e $ace || ln -s ${ace}.d/$ace .
        i=$((i+1))
    done
    progress 30 $n $n "done."
    echo
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

    mkdir -p $PUBLIC $PRIVATE $ETC

    cp $LIBERTY_HOME/target/bin/se $PUBLIC/

    for tool in c compile_to_c clean pretty short find ace_check class_check eiffeldoc eiffeltest extract_internals
    do
        cp $LIBERTY_HOME/target/bin/$tool $PRIVATE/
    done

    cp -a $LIBERTY_HOME/resources/short $SHORT
    cp -a $LIBERTY_HOME/sys $SYS

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
c: compile
c2c: compile_to_c
clean: clean
pretty: pretty
short: short
find: finder
ace_check: ace_check
class_check: class_check
doc: eiffeldoc
test: eiffeltest
x_int: extract_internals

[boost]
c_compiler_type: gcc
c_compiler_options: -pipe -Os
cpp_compiler_type: g++
cpp_compiler_options: -pipe -Os

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

[release]
c_compiler_type: gcc
c_compiler_options: -pipe -O3 -fomit-frame-pointer
cpp_compiler_type: g++
cpp_compiler_options: -pipe -O3 -fomit-frame-pointer
smarteiffel_options: -no_split

EOF
}

function do_pkg_tools_src()
{
    SRC=$DESTDIR/usr/share/libertyeiffel/src/
    ETC=$DESTDIR/etc/serc

    cp -a $LIBERTY_HOME/src/smarteiffel $SRC/tools
    mkdir -p $SRC $ETC

cat > $ETC/serc/liberty_tools.se <<EOF
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

    cp -a $LIBERTY_HOME/src/lib $SRC/core
    mkdir -p $SRC $ETC

cat > $ETC/serc/liberty_core.se <<EOF
[Environment]
path_liberty: /usr/share/libertyeiffel/src/core/

[Loadpath]
liberty: ${path_liberty}loadpath.se
EOF
}

function do_pkg_tools_doc()
{
    DOC=$DESTDIR/usr/share/doc/libertyeiffel/
    mkdir -p $DOC
    cp -a $LIBERTY_HOME/target/doc/tools $DOC/
}

function do_pkg_core_doc()
{
    DOC=$DESTDIR/usr/share/doc/libertyeiffel/
    mkdir -p $DOC
    cp -a $LIBERTY_HOME/target/doc/core $DOC/
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
    make_doc
    #compile_plugins
    #generate_wrappers
    #compile_all
}

if [ $# = 0 ]; then
    if [ -d $LIBERTY_HOME/target ]; then
        compile_all
    else
        do_all
    fi
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
            x-package)
                do_pkg
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
