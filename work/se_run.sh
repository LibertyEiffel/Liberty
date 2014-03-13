#!/usr/bin/env bash
cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
echo '**** TUTORIAL:' $1
se c -verbose -clean -style_warning -o $exe $e || exit 1
exec ./$e
