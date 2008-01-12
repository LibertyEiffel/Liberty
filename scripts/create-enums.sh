#!/bin/sh

eiffellize () {
    ## Eiffellize class name 
    if [ -n $1 ] ; then 
	echo $1 | 
	sed 's/\B\([A-Z]\)/_\1/g' |
	tr a-z- A-Z_
    fi
}
process_file () {
    if [ -n $1 ] ; then 
	FILE=$1
	echo Processing $FILE
        
        # Loop initialization
	PROCESSABLE=$(mktemp -t create-eiffel-enum-processable-XXXX)
	PROCESSED=$(mktemp -t partially-processed-enum-XXXX)
	# echo Processable $PROCESSABLE Processed $PROCESSED
	cp $FILE $PROCESSABLE 
	
	while csplit --quiet --prefix=$PROCESSED $PROCESSABLE "/\benum\b/" "/}/1" 2>/dev/null
	do
	    cp ${PROCESSED}02 $PROCESSABLE
	    ENUM=${PROCESSED}01
	    process_enum $ENUM
	done
	rm $PROCESSABLE ${PROCESSED} ${PROCESSED}00 ${PROCESSED}01 ${PROCESSED}02 2>/dev/null
    else
	echo process_file got no file to work on
    fi
}

process_enum () {
    if [ -n $1 ] ; then 
	ENUM_FILE=$1
	ENUM_NAME=$(grep ";" $ENUM_FILE | tr --delete --complement [:alnum:] )
	EIFFEL_ENUM=$(eiffellize $ENUM_NAME)
	echo Enumeration $ENUM_NAME into $EIFFEL_ENUM
	ENUM_PART=$(mktemp)
	csplit --quiet --prefix=$ENUM_PART $ENUM_FILE "/{/1" "/}/" 
	echo Enumeration items:
	cat ${ENUM_PART}01 | tr --delete ","
	echo =======
	rm ${ENUM_PART}* 2>/dev/null
    else echo No enum file to work on
    fi
}

for FILE in $@ ; do
    process_file $FILE
done
