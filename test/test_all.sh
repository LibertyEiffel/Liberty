#!/usr/bin/env bash

ROOT=$(pwd)
cd $(dirname $0)/..
export LIBERTY_HOME=$(pwd)
export LIBERTY_INTERPRETER=${LIBERTY_INTERPRETER:-$(find $LIBERTY_HOME/src/tools/main -name libertyi_boost -type f)}

exec find $ROOT -name test_\*.e -exec $LIBERTY_HOME/work/do_test.sh {} \;
