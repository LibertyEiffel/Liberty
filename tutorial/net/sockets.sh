#!/bin/sh

sleep 1

nc localhost 2001 <<EOF
stop
EOF
