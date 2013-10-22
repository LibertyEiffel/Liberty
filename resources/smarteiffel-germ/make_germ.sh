#!/bin/bash

cd $(dirname $(readlink -f $0))
rm compile_to_c*.c compile_to_c.* eiffel_exec.h
se c2c -verbose -boost -no_gc compile_to_c
