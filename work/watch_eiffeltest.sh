#!/bin/sh

case x$1 in
    x_internal)
            {
                find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec test -e {}/LOCK \; -print | sort -u
                find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec test \! -e {}/LOCK \; -print | sort -u
            } | while read eiffeltest; do
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
                (
                    cd $eiffeltest
                    diff -u log.new log.ref | diffstat -C -w $(($(tput cols) - 1))
                )
                echo
            done
        ;;
    *)
        exec watch --color -n 30 "$@" $0 _internal
        ;;
esac
