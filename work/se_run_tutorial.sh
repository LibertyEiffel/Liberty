#!/usr/bin/env bash

export _MY_PID=$$

function failed {
    exit 1
}

function success {
    exit 0
}

trap failed USR1
trap success USR2

(
    workdir=$(dirname $(readlink -f $0))
    find $(dirname $workdir)/tutorial -name 'aux*' -prune -o -name '*.e' -print | while read e; do
        $workdir/se_run.sh "$e" || {
            echo FAILED >&3
        }
    done 3> >(
        grep -q FAILED && {
            kill -USR1 $_MY_PID 2>/dev/null
            wait $_MY_PID 2>/dev/null
        }
    )
    kill -USR2 $_MY_PID 2>/dev/null
    wait $_MY_PID 2>/dev/null
)

sleep 30
exit 2
