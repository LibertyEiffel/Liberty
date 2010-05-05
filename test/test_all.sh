#!/usr/bin/env bash

cd $(dirname $0)
export LIBERTY_TEST_HOME=$(pwd)
cd ..
export LIBERTY_HOME=$(pwd)
export LIBERTY_INTERPRETER=$(find $LIBERTY_HOME/src/tools/main -name libertyi_boost -type f)

exec find $TEST_HOME -name test_\*.e -exec $LIBERTY_HOME/work/do_test.sh {} \;
