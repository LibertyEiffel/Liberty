#!/usr/bin/env bash

workdir=$(dirname $(readlink -f $0))
find $(dirname $workdir)/tutorial -name 'aux*' -prune -o -name '*.e' | while read e; do
    $workdir/se_run.sh "$e"
done

exit $?
