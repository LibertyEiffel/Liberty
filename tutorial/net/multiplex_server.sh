#!/bin/sh

nc localhost 2001 <<EOF
first test and bye
bye
EOF

nc localhost 2001 <<EOF
second test and shutdown (one could also call "halt" which is more radical because it kills the open connections)
shutdown
EOF
