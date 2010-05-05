#!/usr/bin/env bash

test=$(basename $1)
cd $(dirname $1)

{
	echo './'
	echo "$LIBERTY_HOME/src/loadpath.se"
} > loadpath.se

echo "Executing ${test%.e} in $(pwd)"
exec $LIBERTY_INTERPRETER ./loadpath.se $(echo ${test%.e} | tr '[a-z]' '[A-Z]') make -vsys=$LIBERTY_HOME/work/ -log=trace -check=all
