#!/usr/bin/env bash

cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
in=${e%.e}.in
sh=${e%.e}.sh
cmd=${e%.e}.cmd
out=${e%.e}.out

status=0
if [ -x $cmd ]; then
    ./$cmd >$out 2>&1 || status=$?
    test -x ${e%.e} && mv ${e%.e} $exe
else
    se c -boost -no_split -O1 -clean -o $exe $e >$out 2>&1 || status=$?
fi

test $status -ne 0 && {
    echo -n "**** FAILED: compile $exe"
    test -x $cmd && echo -n " cmd"
    echo " status=$status"
    cat $out
    exit 1
}

export PIDFILE=$(mktemp)

(
    ulimit -t 60 2>/dev/null
    test -r $in && {
        exec <$in
    }
    ./$exe >$out 2>&1
    ret=$?
    rm -f $PIDFILE
    exit $ret
) &
exe_pid=$!

echo $exe_pid > $PIDFILE

ssh_pid=""
test -x $sh && {
    ./$sh $exe_pid &
    sh_pid=$!
}

(
    sleep 30
    test -r $PIDFILE && {
        echo "**** Process $exe takes too long, killing!"
        kill $(<$PIDFILE)
    }
)&
kill_pid=$!

wait $exe_pid
status=$?

{
    kill $kill_pid
    wait $kill_pid
    if [ -n "$sh_pid" ]; then
        kill $sh_pid
        wait $sh_pid
    fi
} 2>/dev/null

rm -f $PIDFILE

test $status -ne 0 && {
    echo -n "**** FAILED: run $exe"
    test -r $in && echo -n " in"
    test -x $sh && echo -n " sh"
    echo " status=$status"
    cat $out
    exit 1
}
