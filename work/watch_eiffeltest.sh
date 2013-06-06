#!/bin/sh
exec watch -d --color -n 10 'find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec diff -u {}/log.new {}/log.ref \; | diffstat -C -w 120 | sed "s!/eiffeltest/log.ref!!;s!eiffeltest/log.ref  !.!"'
