#!/bin/sh

## Scan GTK documentation files and produces Eiffel skeleton classes
## for them.

LANG=C
GTK_DOC=/usr/share/doc/libgtk2.0-doc/gtk/
HEAD=$(dirname $0)/head
FOOT=$(dirname $0)/foot

echo $HEAD $FOOT
if [ ! -f /usr/bin/links] ; then
    echo links not found.
    exit 5
fi
for FULL_PATH_CLASS in $(find $GTK_DOC -iname "*.html")
do
    CLASS=$(basename $FULL_PATH_CLASS)
    CONVERTED=$(echo $CLASS | sed 's/\(\B[A-Z][a-z]\)/_\1/g' | tr A-Z a-z)
    CONVERTED=${CONVERTED%.html}.e
    STUB=${CONVERTED%.e}.stub.e
    if [ ! -f $CONVERTED ]; then 
	echo "Converting $CLASS into $STUB"
	## Dumps HTML documentation into text
	links -dump -no-numbering -no-references $FULL_PATH_CLASS |
	## Add trailing indented Eiffel comment 
	sed 's/^/\t--/' | 
	## Adding  "proper" headers and footers
	cat $HEAD - $FOOT ##>$STUB
    else 
	echo "$CONVERTED already exists."
    fi
    
done
