#!/usr/bin/env bash

workdir=$(dirname $(readlink -f $0))
exec find $(dirname $workdir)/tutorial -name 'aux*' -prune -o -name '*.e' -exec $workdir/se_run.sh {} ';'
