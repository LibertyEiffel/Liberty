#!/usr/bin/env bash

if [ "${0%/*}" == "$0" ]; then
	cd ../src
else
	cd ${0%/*}/../src
fi
etags --language-force=Eiffel --extra=+f --fields=+ailmnSz $(find . -name \*.e)
