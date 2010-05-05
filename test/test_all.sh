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
# $ INTERPRETER=libertyi LOG=trace CHECK=all ../../test_all.sh test_agent01.e

ROOT=$(pwd)
cd $(dirname $0)/..
export LIBERTY_HOME=$(pwd)
export LIBERTY_INTERPRETER=${LIBERTY_INTERPRETER:-$(find $LIBERTY_HOME/src/tools/main -name ${INTERPRETER:-libertyi_boost} -type f)}

if [ x"$1" == x ]; then
    find $ROOT -name test_\*.e -exec $LIBERTY_HOME/work/do_test.sh {} \;
else
    while [ x"$1" != x ]; do
	find $ROOT -name "$1" -exec $LIBERTY_HOME/work/do_test.sh {} \;
	shift
    done
fi
