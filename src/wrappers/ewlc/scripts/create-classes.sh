#!/bin/sh

## Functions

print_usage() {
    cat <<EOF 
Usage: $0 [--package a_debian_package|--directory a_directory]

Scan either a_debian_package or a_directory for HTML documents,
converting them into Eiffel (crude) skeleton classes.

EOF
}

process_file () {
    FILE=$1
    if [ -f "$FILE" ] ; then
	## "Processing $FILE"
	
	CLASS=$(basename $FILE | 
	    sed 's/\B\([A-Z]\)/_\1/g' |
	    sed 's/\(.*\)\.html/\1/g' |
	    tr a-z- A-Z_)
	CLASS=${CLASS%.HTML}
	STUB=$(echo ${CLASS%.html} | tr A-Z a-z ).stub.e
	if [ ! -f $STUB ]; then 
	    echo "Creating $CLASS (in $STUB from $FILE)"

	    ## Dumps HTML documentation into text
	    $LINKS -dump -no-numbering -no-references $FILE | 
	    ## Add trailing indented Eiffel comment 
	    sed 's/^/\t--/' | 
	    ## Adding  "proper" headers and footers
	    cat $HEAD - $FOOT | 
	    ## Replace ##VERSION## with correct $VERSION
	    sed "s/##VERSION##/$VERSION/" |
	    ## Replace ##CLASS## with $CLASS
	    sed "s/##CLASS##/$CLASS/g" >$STUB 
	else 
	    echo "$STUB already exists."
	fi
    fi
}

process_package () {
    if [ -n "$1" ] ; then
	PACKAGE=$1
	if dpkg -l "$PACKAGE" 2>&1 >/dev/null ; then
	    VERSION=$( # Print Debian/Ubuntu package information
		dpkg -l "$PACKAGE" |
		# Keep the only interesting line
		grep ii |
	        # Remove repeated spaces 
		tr --squeeze-repeats [:space:] " " |
	        # Pick version field, now in a format like "2.10.6-0ubuntu3"
		cut -d " " -f 3 |
	        # Retain just the first part (i.e. 2.10.6)
		cut -d "-" -f 1
		)
	    FILES=$(dpkg -L $PACKAGE | grep "\.html")
	    for FILE in $FILES;do process_file $FILE; done
	fi
    fi
}

process_directory () {
    if [ -n "$1" ] ; then
	DIRECTORY=$1
	FILES=$(find $DIRECTORY -iname "*.html")
	VERSION="Unknown"
	for FILE in $FILES;do process_file $FILE; done
    fi
}

LANG=C
HEAD=$(dirname $0)/head
FOOT=$(dirname $0)/foot
LINKS=$(which links)

if [ ! -f $HEAD ] ; then echo "Couldn't find header (file $HEAD)"; exit 5; fi
if [ ! -f $FOOT ] ; then echo "Couldn't find footer (file $FOOT)"; exit 5; fi
if [ -z $LINKS ] ; then
    echo links not found.
    exit 5
fi

case $1 in 
    '--package')
	PACKAGE=$2
	echo "Converting HTML documents of $PACKAGE Debian package into Eiffel skeleton classes."
	process_package $PACKAGE
	;;

    '--directory')
	DIRECTORY=$2
	echo "Converting HTML documents in $DIRECTORY into Eiffel skeleton classes."
	process_directory $DIRECTORY
	;;

    *)
	print_usage
	exit 5
	;;
esac 


