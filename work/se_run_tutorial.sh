#!/usr/bin/env bash

status=0

travis_fold() {
    local dir="$1"
    d=${dir##*/tutorial}
    echo tutorial${d//[^[:alnum:]]/.}
}

file=$(mktemp)
workdir=$(dirname $(readlink -f $0))
find $(dirname $workdir)/tutorial/ -name 'aux*' -prune -o -name '*.e' -exec dirname {} \; | sort -u >$file
dir=""
while read d; do
    if [[ "$d" != "$dir" ]]; then
        if [[ -n "$dir" ]]; then
            echo travis_fold:end:$(travis_fold "$dir")
        fi
        dir="$d"
        echo travis_fold:start:$(travis_fold "$dir")
    fi
    echo tutorial${dir##*/tutorial}
    for e in "$d"/*.e; do
        $workdir/se_run.sh "$e" || status=1
    done
done <$file
echo travis_fold:end:$(travis_fold "$dir")

exit $status
