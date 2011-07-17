#!/usr/bin/env bash

cd ${0%/*}/..
export LIBERTY_HOME=$(pwd)
cd target

export LOG=${LOG:-$LIBERTY_HOME/work/compile_plugins.log}

. $LIBERTY_HOME/work/tools.sh

eval `se -environment | grep -v '^#'`
SE_SYS=${SE_SYS%/}
export SE_SYS

n1=$(find $SE_SYS/plugins -name c -type d | wc -l)
n2=$(find $SE_SYS/runtime -name basic_\*.[ch] | sed 's/\.[ch]$//' | uniq | wc -l)
n=$((n1+n2))
i=0

do_generate()
{
    plugin_name="$1"
    plugin_h="$2"
    plugin_c="$3"
    plugin_so="$4"
    plugin_dir="$5"
    location="$6"
    plugin_pattern="$7"
    plugin_source="$8"

    test -d $plugin_dir || mkdir -p $plugin_dir

    progress 30 $((i*3)) $((n*3)) "Generating header file for $plugin_so"

    {
        cat <<EOF
#ifndef __LIBERTY_PLUGIN__
#define __LIBERTY_PLUGIN__

#include "base.h"
#include <errno.h>

EOF
        if [ "$(echo ${plugin_pattern}*.h)" != "$plugin_pattern"'*.h' ]; then
            for f in ${plugin_pattern}*.h; do
                echo '#include "'${f##*/}'"'
            done
        fi

        echo

        find $path_liberty -name \*.e -exec grep -Hn 'location: "${sys}/'$location'"' {} \; | \
            awk -F: '{print $1}' | uniq | \
            xargs -n1 awk '/module_name: "'$plugin_name'"/ { i=1 } /feature_name: "[^"]*"/ { if (i) printf("%s %s\n", ARGV[1], $2); i=0 }' | \
            sed 's/"\([^"]*\)"/\1/g' | sort -u | \
        while read file symbol; do
            {
                cat $file | grep "$symbol" | grep ' is$'
                cat $file | grep -C3 'feature_name: "'$symbol'"'
            } | $LIBERTY_HOME/work/find_feature.py header $symbol ${file##*/}
        done | sort -u

        echo '#endif'
    } > $plugin_h

    progress 30 $((i*3+1)) $((n*3)) "Generating code file for $plugin_so"

    {
        cat <<EOF
#include "${plugin_h##*/}"

EOF
        if [ "$(echo ${plugin_pattern}*.c)" != "$plugin_pattern"'*.c' ]; then
            for f in ${plugin_pattern}*.c; do
                echo '#include "'${f##*/}'"'
            done
        fi

        echo

        find $path_liberty -name \*.e -exec grep -Hn 'location: "${sys}/'"$location"'"' {} \; | \
            awk -F: '{print $1}' | uniq | \
            xargs -n1 awk '/module_name: "'$plugin_name'"/ { i=1 } /feature_name: "[^"]*"/ { if (i) printf("%s %s\n", ARGV[1], $2); i=0 }' | \
            sed 's/"\([^"]*\)"/\1/g' | sort -u | \
        while read file symbol; do
            {
                cat $file | grep -E "^[[:space:]]*$symbol(|[:([:space:]].*) is$"
                cat $file | grep -C3 'feature_name: "'$symbol'"'
            } | $LIBERTY_HOME/work/find_feature.py code $symbol ${file##*/}
        done | sort -u
    } > $plugin_c

    progress 30 $((i*3+2)) $((n*3)) "Building $plugin_so"

    run gcc -iquote $SE_SYS/runtime/c -iquote $plugin_source -shared -fpic -fvisibility=hidden -o $plugin_so $plugin_c
}

find $SE_SYS/runtime -name basic_\*.[ch] | sed 's/\.[ch]$//' | uniq | while read basic_plugin; do
    plugin_dir=${basic_plugin#$SE_SYS/}
    plugin_dir=$(echo $plugin_dir | sed 's=/c/=/=')
    plugin_name=${plugin_dir##*/}
    plugin_h=${plugin_dir}~.h
    plugin_c=${plugin_dir}~.c
    plugin_so=${plugin_dir}.so
    plugin_dir=${plugin_dir%/*}

    do_generate "$plugin_name" "$plugin_h" "$plugin_c" "$plugin_so" "$plugin_dir" "runtime" "$basic_plugin" "$SE_SYS/runtime/c"

    i=$((i+1))
done

find $SE_SYS/plugins -name c -type d | while read plugin; do
    plugin_dir=${plugin#$SE_SYS/}
    plugin_dir=${plugin_dir%/c}
    plugin_name=${plugin_dir##*/}
    plugin_so=${plugin_dir}.so
    plugin_h=${plugin_dir}~.h
    plugin_c=${plugin_dir}~.c
    plugin_dir=${plugin_dir%/*}

    do_generate "$plugin_name" "$plugin_h" "$plugin_c" "$plugin_so" "$plugin_dir" "plugins" "$plugin/" "$plugin"

    i=$((i+1))
done

progress 30 $n $n "done."
