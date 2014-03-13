#!/usr/bin/env bash
cd $(dirname $1)
e=$(basename $1)
exe=${e%.e}.exe
in=${e%.e}.in
script=${e%.e}.sh

echo
echo '**** TUTORIAL:' $1
se c -clean -style_warning -o $exe $e || exit 1

ulimit -t 60

if [ -r $in ]; then
    exec <$in
fi

export PIDFILE=$(mktemp)
(
    ./$exe
    ret=$?
    rm -f $PIDFILE
    exit $ret
) &
exe_pid=$!
echo $exe_pid > $PIDFILE

if [ -r $script ]; then
    ./$script $exe_pid &
fi

(
    sleep 30
    test -r $PIDFILE && {
        echo "**** Process takes too long, killing!"
        kill -9 $(<$PIDFILE)
    }
)&
kill_pid=$!

wait $exe_pid
status=$?

kill $kill_pid
rm -f $PIDFILE

exit $status
