#!/usr/bin/env bash

# Nominal usage:
# --------------
# $ ./test_all.sh
#
# Example of specific usage:
# --------------------------
# $ cd language/agent
# $ INTERPRETER=libertyi LOG=trace CHECK=require ../../test_all.sh
#
# Example of specific test call:
# ------------------------------
# $ cd language/agent
# $ INTERPRETER=libertyi LOG=trace CHECK=all DEBUG=-debug ../../test_all.sh test_agent01.e

ROOT=$(pwd)
cd $(dirname $0)/..
export LIBERTY_HOME=$(pwd)
export INTERPRETER=${INTERPRETER:-libertyi}
export LIBERTY_INTERPRETER=${LIBERTY_INTERPRETER:-$LIBERTY_HOME/target/bin/$INTERPRETER.d/$INTERPRETER}

export LOG=${LOG:-error}
export CHECK=${CHECK:-all}
export DEBUG=${DEBUG:-}

if [ x"$1" == x ]; then
    find $ROOT -name test_\*.e -exec $LIBERTY_HOME/work/do_test.sh {} -log=$LOG -check=$CHECK $DEBUG \;
else
    while [ x"$1" != x ]; do
	find $ROOT -name "$1" -exec $LIBERTY_HOME/work/do_test.sh {} -log=$LOG -check=$CHECK $DEBUG \;
	shift
    done
fi
