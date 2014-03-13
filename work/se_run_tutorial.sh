#!/usr/bin/env bash

status=0

file=$(mktemp)
workdir=$(dirname $(readlink -f $0))
find $(dirname $workdir)/tutorial -name 'aux*' -prune -o -name '*.e' -print >$file
while read e; do
    $workdir/se_run.sh "$e" || status=1
done <$file

exit $status
