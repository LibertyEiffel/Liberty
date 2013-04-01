#!/usr/bin/env bash

testclass=$(basename $1)
cd $(dirname $1)
shift

SRC_LOADPATH=$LIBERTY_HOME/src/loadpath.se

if [ -e loadpath.se ]; then
    mv loadpath.se loadpath.se~
    cat loadpath.se~ | grep -v ^$SRC_LOADPATH > loadpath.se
    echo $SRC_LOADPATH >> loadpath.se
else
    echo './' > loadpath.se
    echo $SRC_LOADPATH >> loadpath.se
fi

eval `se -environment | grep -v '^#'`

$LIBERTY_INTERPRETER ./loadpath.se $(echo ${testclass%.e} | tr '[a-z]' '[A-Z]') make -vsys=$LIBERTY_HOME/work/ -vpath_tutorial=${path_tutorial} "$@"

test -e loadpath.se~ && mv -f loadpath.se~ loadpath.se
