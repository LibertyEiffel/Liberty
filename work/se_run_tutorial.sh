#!/usr/bin/env bash

travis_fold() {
    local op=$1
    local title="$2"
    echo travis_fold:$op:${title//[^[:alnum:]]/.}
}

workdir=$(dirname $(readlink -f $0))

file=$(mktemp)
find $(dirname $workdir)/tutorial/ -name 'aux*' -prune -o -name '*.e' -exec dirname {} \; | sort -u >$file

declare -a fail=()
while read dir; do
    title=${dir##$(dirname $workdir)/}
    travis_fold start $title

    st=0
    echo " >> $title"
    for e in "$dir"/*.e; do
        $workdir/se_run.sh "$e" || st=$(($st + 1))
    done

    case $st in
        0)
            true
            ;;
        1)
            fail+=("$title: 1 failure")
            ;;
        *)
            fail+=("$title: $s failures")
            ;;
    esac

    travis_fold end $title
done <$file

if [ ${#fail[@]} -gt 0 ]; then
    echo
    echo '**** FAILURES:'
    for f in "${fail[@]}"; do
        echo "  - $f"
    done
    echo
    exit 1
fi

exit 0
