#!/bin/sh

process () {
    FILE=$1
    echo Processing $FILE
    #STARTING_POINTS=$(grep -b "\benum\b" $FILE| cut -d ":" -f 1 | head -1 )
    #ENDING_POINTS=$(grep -b "}.*;" $FILE | cut -d ":" -f 1 |head -1 )
    #echo Starting point: $STARTING_POINTS
    #echo Ending points: $ENDING_POINTS
    PREFIX=$(mktemp)

    csplit $FILE --prefix=$PREFIX "/\benum\b/" "/}/1"

    
    #if [ -n "$ENUM_BODY" ] ; then	echo "=== $ENUM_BODY ==="    fi
}


for FILE in $@ 
do
    process $FILE
done
