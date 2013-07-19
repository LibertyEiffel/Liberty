#!/bin/bash

case x$1 in
    x_internal)
        pwd
        {
            find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec test -e {}/LOCK \; -print | sort -u
            find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec test \! -e {}/LOCK \; -print | sort -u
        } |
        while read eiffeltest; do
            awk -vcol=$(tput cols) 'BEGIN {printf("[1;34m"); for(i=0;i<col;i++)printf("-"); printf("[m\n")}'
            abnormals=$(grep Abnormal $eiffeltest/log.new | wc -l)
            case $abnormals in
                0)
                    echo '[1;32m'$eiffeltest'[m'
                    ;;
                1)
                    echo '[1;31m'$eiffeltest' -- 1 anomaly[m'
                    ;;
                *)
                    echo '[1;31m'$eiffeltest' -- '$abnormals' anomalies[m'
                    ;;
            esac
            if [ -e $eiffeltest/LOCK ]; then
                echo 'Running since '$(stat --format='%z' $eiffeltest/LOCK)
            else
                echo 'Not running'
            fi
            echo
            tail -n 5 $eiffeltest/log.new | sed 's/^/[1;34m    | [1;33m/;s/$/[m/'
            echo
            ps axu | head -1
            ps axu | grep "$(tail -n 1 $eiffeltest/log.new | grep -o '[A-Za-z0-9_]*\.exe')" | egrep -v 'grep|sh -c'
            echo
            (
                cd $eiffeltest
                diff -u log.new log.ref | diffstat -C -w $(($(tput cols) - 1))
            )
            echo
        done
        ;;
    x-run)
        shift
        (
            rm -f eiffeltest/LOCK
            ulimit -t ${ULIMIT_TIME:-60}
            ulimit -v ${ULIMIT_VIRT:-$((1024*1024*4))}
            nice se test . > eiffeltest/log 2>&1
        ) &
        test_pid=$!
        $0 "$@" &
        watch_pid=$!
        function cleanup {
            pgid=$(ps x -o  "%p %r" | awk '$1 == "'$test_pid'" {print $2}')
            test -n "$pgid" && kill -TERM -$pgid 2>/dev/null
            kill -TERM $watch_pid 2>/dev/null
            exit 1
        }
        trap cleanup INT TERM HUP
        wait $test_pid
        kill $watch_pid
        ;;
    *)
        exec watch --color -n 30 "$@" $0 _internal
        ;;
esac
