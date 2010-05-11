#!/usr/bin/env bash

cd ${0%/*}
export LIBERTY_HOME=$(pwd)
export PATH=$LIBERTY_HOME/target/bin:$PATH

function bootstrap()
{
    cd $LIBERTY_HOME
    test -d target || mkdir target
    cd target

    if [ ! -d SmartEiffel ]; then
	echo "Unpacking SmartEiffel..."
	tar xfj $LIBERTY_HOME/work/SmartEiffel.tar.bz2
    fi

    if [ ! -d bin ]; then
	echo "Preparing target..."
	mkdir bin
	cd bin
	for f in $LIBERTY_HOME/src/tools/main/*.ace; do
	    ace=${f##*/} && ace=${ace%.ace}
	    mkdir $LIBERTY_HOME/target/bin/$ace
	    ln -s $f $LIBERTY_HOME/target/bin/$ace/
	done
	cd ..
    fi

    if [ ! -d serc ]; then
	echo "Preparing SmartEiffel environment..."
	mkdir serc
	cd serc
	cat > liberty.se <<EOF
[General]
bin: $LIBERTY_HOME/target/bin
sys: $LIBERTY_HOME/sys
short: $LIBERTY_HOME/target/SmartEiffel/short
os: UNIX
flavor: Linux
tag: 3
jobs: 4

[Environment]
path_liberty: $LIBERTY_HOME/
path_se_tools: $LIBERTY_HOME/target/SmartEiffel/tools/
path_se_tutorial: $LIBERTY_HOME/SmartEiffel/tutorial/

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
--ace_check: ace_check
class_check: class_check
--doc: eiffeldoc
test: eiffeltest
--x_int: extract_internals
--sedb: se_debug

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

    echo "Bootstrapping SmartEiffel tools..."
    cd SmartEiffel/work/germ

    if [ ! -e ../../../bin/compile_to_c ]; then
	echo " - germ"
	gcc compile_to_c.c -pipe -o ../../../bin/compile_to_c || exit 1
    fi
    cd ../../../bin

    echo " - compile_to_c T1"
    ./compile_to_c -boost compile_to_c -o compile_to_c || exit 1
    if [ $(cat compile_to_c.make | grep ^gcc | wc -l) != 0 ]; then
	grep ^gcc compile_to_c.make | while read cmd; do
	    echo "   $cmd"
	    eval "$cmd" || exit 1
	done

	echo " - compile_to_c T2"
	./compile_to_c -boost compile_to_c -o compile_to_c || exit 1
	if [ $(cat compile_to_c.make | grep ^gcc | wc -l) != 0 ]; then
	    grep ^gcc compile_to_c.make | while read cmd; do
		echo "   $cmd"
		eval "$cmd" || exit 1
	    done

	    echo " - compile_to_c T3"
	    ./compile_to_c -boost compile_to_c -o compile_to_c || exit 1
	    if [ $(cat compile_to_c.make | grep ^gcc | wc -l) != 0 ]; then
		cat compile_to_c.make
		echo "The compiler is NOT stable."
		exit 1
	    fi
	fi
    fi
    echo "   The compiler is stable."

    echo " - compile"
    ./compile_to_c -boost -no_split compile -o compile || exit 1
    grep ^gcc compile.make | while read cmd; do
	eval "$cmd" || exit 1
    done

    for tool in se clean; do
	echo " - $tool"
	./compile -boost -no_split $tool -o $tool || exit 1
    done
    for tool in pretty short class_check finder; do
	echo " - $tool"
	./compile -boost $tool -o $tool || exit 1
    done
}

function compile_all()
{
    cd $LIBERTY_HOME/work
    ./compile_plugins.sh
    for f in $LIBERTY_HOME/src/tools/main/*.ace; do
	ace=${f##*/} && ace=${ace%.ace}
	cd $LIBERTY_HOME/target/bin/$ace
	se c ${ace}.ace
    done
}

test -d $LIBERTY_HOME/target -a x"$1" != x"-bootstrap" || bootstrap
compile_all
