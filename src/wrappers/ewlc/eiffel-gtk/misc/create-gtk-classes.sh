#!/bin/sh

## Scan GTK documentation files and produces Eiffel skeleton classes
## for them.

LANG=C
GTK_DOC=/usr/share/doc/libgtk2.0-doc/gtk/
HEAD=$(dirname $0)/head
FOOT=$(dirname $0)/foot


VERSION=$(## Print Debian/Ubuntu package information
    dpkg -l "libgtk2.0-doc" | 
    ## Keep the only interesting line
    grep ii |
    ## Remove repeated spaces 
    tr --squeeze-repeats [:space:] " " |
    ## Pick version field, now in a format like "2.10.6-0ubuntu3"
    cut -d " " -f 3 |
    ## Retain just the first part
    cut -d "-" -f 1 )

echo $HEAD $FOOT $VERSION
if [ ! -f /usr/bin/links] ; then
    echo links not found.
    exit 5
fi
for FULL_PATH_CLASS in $(find $GTK_DOC -iname "*.html")
do
    CLASS=$(basename $FULL_PATH_CLASS)
    CONVERTED=$(echo $CLASS | sed 's/\(\B[A-Z]+[a-z]*\)/_\1/g' | tr A-Z a-z)
    CONVERTED=${CONVERTED%.html}.e
    STUB=${CONVERTED%.e}.stub.e
    if [ ! -f $CONVERTED ]; then 
	echo "Converting $CLASS into $STUB"
	## Dumps HTML documentation into text
	links -dump -no-numbering -no-references $FULL_PATH_CLASS |
	## Add trailing indented Eiffel comment 
	sed 's/^/\t--/' | 
	## Adding  "proper" headers and footers
	cat $HEAD - $FOOT |
	## Replace ##VERSION## with correct $VERSION
	sed "s/##VERSION##/$VERSION/" >$STUB
    else 
	echo "$CONVERTED already exists."
    fi
    
done
