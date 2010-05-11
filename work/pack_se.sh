#!/usr/bin/env bash

TMPDIR=/tmp/se$$
SEDIR=$TMPDIR/SmartEiffel

cd ${0%/*}/..
export LIBERTY_HOME=$(pwd)

cd $LIBERTY_HOME/../SmartEiffel/se/trunk
export SMARTEIFFEL_HOME=$(pwd)

test -d $TMPDIR && rm -rf $TMPDIR
mkdir -p $SEDIR

svn diff tools > $SEDIR/tools.patch

cd $SEDIR
cp -R $SMARTEIFFEL_HOME/tools ./
cp -R $SMARTEIFFEL_HOME/short ./
mkdir -p work/germ

find . -name .svn -prune -exec rm -rf {} \;

cd tools
find . -type d > loadpath.se
cd ..

cd work/germ
cat > compile_to_c.ace <<EOF
system "compile_to_c"
root COMPILE_TO_C: make
default
	assertion(boost)
	verbose(yes)
cluster
	lib: "$LIBERTY_HOME/src/lib/loadpath.se"
	tools: "$SEDIR/tools/loadpath.se"
generate
	no_strip(no)
	no_split(yes)
EOF
se c2c compile_to_c.ace
rm compile_to_c.ace

cd $TMPDIR
tar cfj $LIBERTY_HOME/work/SmartEiffel.tar.bz2 SmartEiffel
cd $LIBERTY_HOME
rm -rf $TMPDIR
