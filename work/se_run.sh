#!/usr/bin/env bash

root=$(dirname $(dirname $(readlink -f $0)))

cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
in=${e%.e}.in
sh=${e%.e}.sh
cmd=${e%.e}.cmd
out=${e%.e}.out
arg=${e%.e}.arg

shift

se() {
    if [[ -x $root/target/bin/se ]]; then
        $root/target/bin/se "$@"
    elif [[ -x /usr/bin/se ]]; then
        /usr/bin/se "$@"
    else
        echo "se not found" >&2
        return 1
    fi
}

status=0
if [ -x $cmd ]; then
    ./$cmd >$out 2>&1 || status=$?
    if [ -x $exe ]; then
        true
    elif [ -x ${e%.e} ]; then
        mv ${e%.e} $exe
    elif [ -x a.out ]; then
        mv a.out $exe
    elif [ -x a.exe ]; then
        mv a.exe $exe
    else
        echo "**** $exe not found!" >> $out
        status=1
    fi
elif [[ $# > 0 ]]; then
    se c -no_split -O1 -clean -o $exe -g -no_strip "$@" $e >$out 2>&1 || status=$?
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

echo >>$out

export PIDFILE=$(mktemp)

(
    ulimit -t 60 2>/dev/null
    test -e $in || touch $in
    if [ -r $arg ]; then
        ./$exe $(< $arg) <$in >>$out 2>&1 &
    else
        ./$exe <$in >>$out 2>&1 &
    fi
    pid=$!
    trap "kill -9 $pid" TERM
    wait
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

exit 0
