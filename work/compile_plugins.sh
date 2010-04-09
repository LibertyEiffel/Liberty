#!/usr/bin/env bash

eval `se -environment`

SE_SYS=${SE_SYS%/}

find $SE_SYS/plugins -name c -type d | while read plugin; do

    plugin_dir=${plugin#$SE_SYS/}
    plugin_dir=${plugin_dir%/c}
    plugin_so=${plugin_dir}.so
    plugin_dir=${plugin_dir%/*}

    echo Building $plugin_so

    test -d $plugin_dir || mkdir -p $plugin_dir

    {
	cat <<EOF
#ifndef __LIBERTY_PLUGIN__
#define __LIBERTY_PLUGIN__
#include "base.h"
#include <errno.h>
EOF
	if [ $(ls $plugin/*.h | wc -l | xargs echo) -gt 0 ]; then
	    for f in $plugin/*.h; do
		echo '#include "'${f##*/}'"'
	    done
	fi
	echo '#endif'
    } > plugin.h

    {
	cat <<EOF
#include "plugin.h"

EOF
	if [ $(ls $plugin/*.c | wc -l | xargs echo) -gt 0 ]; then
	    for f in $plugin/*.c; do
		echo '#include "'${f##*/}'"'
	    done
	fi
    } > plugin.c

    gcc -iquote $plugin -iquote $SE_SYS/runtime/c -shared -fpic -fvisibility=default -o $plugin_so plugin.c
    rm -f plugin.[ch]

done
