#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
rm -f compile_to_c*.[co] compile_to_c.* eiffel_exec.h
exec se c2c -verbose -boost -no_gc -no-split compile_to_c
