#!/usr/bin/env bash
e=$1
exe=${e%.e}.exe
$(which se) c -clean -style_warning -o $exe $e || exit 1
exec ./$e
