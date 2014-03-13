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

pidfile=$(mktemp)
(
    ./$exe &
    pid=$!
    echo $pid > $pidfile
    wait
    ret=$!
    rm -f $pidfile
    exit $ret
) &

exe_pid=$(<$pidfile)
if [ $? -ne 0 ]; then
    wait $exe_pid
    exit $!
fi

if [ -r $script ]; then
    ./$script $exe_pid &
fi

(
    sleep 30
    echo "**** Process takes too long, killing!"
    test -r $pidfile && kill -9 $(<$pidfile)
)&
kill_pid=$!

wait $exe_pid
status=$?

kill $kill_pid
rm -f $pidfile

exit $status
