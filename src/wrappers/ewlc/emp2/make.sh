#!/bin/sh

HEADER=library/externals/main-include.h
EXTERNALS=library/externals/
EIFFEL_GCC_XML=../tools/eiffel_gcc_xml
XML=headers.xml

echo "Please turn this horrible crappy script into a proper Makefile"

echo Processing $HEADER
gccxml $HEADER -fxml=$XML $(mm-config --cflags)
$EIFFEL_GCC_XML --verbose --directory $EXTERNALS --global --header $HEADER $XML /usr/include/$HEADER
