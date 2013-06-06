#!/bin/sh
exec watch -d --color -n 1 'find . -name eiffeltest -exec test -e {}/log.ref \; -exec test -e {}/log.new \; -exec diff -u {}/log.ref {}/log.new \; | diffstat -C -w 120 | sed "s!/eiffeltest/log.new!!;s!eiffeltest/log.new  !.!"'
