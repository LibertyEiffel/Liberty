#!/bin/sh
 
set -o verbose #echo on
#set +o verbose #echo off


INCLUDE=/usr/local/include/libgda-4.0
HEADER=library/externals/all-gda-includes.h
EIFFEL_GCC_XML=../tools/eiffel_gcc_xml
XML=headers-3.99.xml

if pkg-config --exists libgda-4.0
then
	gccxml ${HEADER} -fxml=$XML $(pkg-config --cflags-only-I libgda-4.0) && \
	$EIFFEL_GCC_XML --verbose --directory library/externals \
	--local --header $HEADER $XML $(find $INCLUDE -name "*.h") 
	##--global --header $HEADER $XML 
else
	echo "Couldn't find libgda-4.0"
	exit 5
fi
