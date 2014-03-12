#!/usr/bin/env bash
cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
/usr/bin/se c -clean -style_warning -o $exe $e || exit 1
exec ./$e
