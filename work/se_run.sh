#!/usr/bin/env bash
cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
in=${e%.e}.in
echo '**** TUTORIAL:' $1
se c -clean -style_warning -o $exe $e || exit 1
if [ -r $in ]; then
    exec <$in
fi
exec ./$exe
