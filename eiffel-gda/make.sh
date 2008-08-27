#!/bin/sh
 
#set -o verbose #echo on
#set +o verbose #echo off


PREFIX=/usr/include/libgda-3.0 
HEADER=libgda/libgda.h
EIFFEL_GCC_XML=../tools/eiffel_gcc_xml
XML=headers.xml

gccxml $PREFIX/libgda/libgda.h -fxml=$XML $(pkg-config --cflags libgda-3.0)
echo $EIFFEL_GCC_XML --verbose --directory library/externals --local --header $HEADER $XML  $(find $PREFIX -name "*.h") 
$EIFFEL_GCC_XML --verbose --directory library/externals --local --header $HEADER $XML  $(find $PREFIX -name "*.h") 
