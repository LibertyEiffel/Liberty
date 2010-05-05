#!/usr/bin/env bash

test=$(basename $1)
cd $(dirname $1)

{
	test -e loadpath.se && cat loadpath.se | grep -v '^'"$LIBERTY_HOME/src/loadpath.se"
	test -e loadpath.se || echo './'
	echo "$LIBERTY_HOME/src/loadpath.se"
} > loadpath.se~
mv loadpath.se~ loadpath.se

eval `se -environment | grep -v '^#'`

echo $LIBERTY_INTERPRETER ./loadpath.se $(echo ${test%.e} | tr '[a-z]' '[A-Z]') make -vsys=$LIBERTY_HOME/work/ -vpath_tutorial=${path_lib%/lib/}/tutorial/ -log=error -check=all
exec $LIBERTY_INTERPRETER ./loadpath.se $(echo ${test%.e} | tr '[a-z]' '[A-Z]') make -vsys=$LIBERTY_HOME/work/ -vpath_tutorial=${path_lib%/lib/}/tutorial/ -log=error -check=all
