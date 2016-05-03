#!/bin/bash

## Process C files finding enumeration and turning them into proper
## Eiffel enumeration class with the design of Eiffel Wrapper
## Libraries Collection

process_file () {
    if [ -n $1 ] ; then 
	FILE=$1
	echo Processing $FILE
        
        # Loop initialization
	PROCESSABLE=$(mktemp -t create-eiffel-enum-processable-XXXX)
	PROCESSED=$(mktemp -t partially-processed-enum-XXXX)
	#echo Processable $PROCESSABLE Processed $PROCESSED
	cp $FILE $PROCESSABLE 
	
	while csplit --quiet --prefix=$PROCESSED $PROCESSABLE "/\benum\b/" "/}/1" 2>/dev/null
	do
	    cp ${PROCESSED}02 $PROCESSABLE
	    ENUM=${PROCESSED}01
	    process_enum $ENUM
	done
	# Cleanup
	rm $PROCESSABLE ${PROCESSED} \
	    ${PROCESSED}00 ${PROCESSED}01 ${PROCESSED}02 \
	    2>/dev/null 
    else
	echo process_file got no file to work on
    fi
}

print_usage () {
    cat <<EOF
$(basename $0) OPTIONS FILES

Options:
  --header=HEADER   Use HEADER instead of current file in external features

Known limitation: it currently handle only naked enumeration, without
explicit setting of values and comments.

EOF

}

eiffellize_class_name () {
    ## Eiffellize class name, i.e from GtkButton to GTK_BUTTON
    if [ -n $1 ] ; then 
	echo $1 | 
	sed 's/\B\([A-Z]\)/_\1/g' |
	tr a-z- A-Z_
    fi
}

process_enum () {
    if [ -n $1 ] ; then 
	ENUM_FILE=$1
	ENUM_NAME=$(grep ";" $ENUM_FILE | tr --delete --complement [:alnum:] )
	EIFFEL_ENUM=$(eiffellize_class_name $ENUM_NAME)
	EIFFEL_ENUM_FILE=$(echo $EIFFEL_ENUM.e | tr '[:upper:]' '[:lower:]')
	echo "Converting $ENUM_NAME into $EIFFEL_ENUM, file \"$EIFFEL_ENUM_FILE\""
	ENUM_PART=$(mktemp)
	csplit --quiet --prefix=$ENUM_PART $ENUM_FILE "/{/1" "/}/" 
	ENUMERATION_ITEMS=$(cat ${ENUM_PART}01 | tr --delete ",")
	if [ $(echo $ENUMERATION_ITEMS| tr --delete '_' | wc --words) -eq 1 ] 
	then echo Skipping $EIFFEL_ENUM because it has only one value
	else
	    PREFIX=$(longest_prefix $ENUMERATION_ITEMS)
	    ITEMS=${ENUMERATION_ITEMS//$PREFIX}
	    EIFFEL_PREFIX=$(echo $PREFIX| tr '[:upper:]' '[:lower:]')
	    
	    emit_header
	    emit_setters
	    emit_queries
	    if [ -z $HEADER ] ; then 
		HEADER=$FILE
		emit_values
		unset HEADER
		if [ $HEADER ] ; then echo Header not unset; exit 10; fi
	    else emit_values
	    fi
	    emit_footer
	    apply_patch
	fi	    
	# Cleaning up
	    rm ${ENUM_PART}* 2>/dev/null 
    else echo No enum file to work on
    fi
}

longest_prefix () {
    ## TODO: check number of arguments if 1 return
    ## Change space between words to linefeed, 

    LENGTH=$(for item; do echo $item;done | wc --max-line-length )
    PREFIX=""

    echo >/dev/stderr "Prefixes (max length $LENGTH): $@"
        
    while [ -z $PREFIX ] ; do
	PREFIX=$(expr substr $1 1 $LENGTH )
	echo >/dev/stderr "Trying $PREFIX (length $LENGTH)"
	for item; do
	    if expr match "$item" "$PREFIX" >/dev/null
	    then : # Found
	    else PREFIX="" # Not found
	    fi
	done
	LENGTH=$(( $LENGTH - 1 ))
	if [ $LENGTH -le 0 ] ; 
	then echo >/dev/stderr "Couldn't find a proper prefix, bailing out"; exit 5
	fi
    done
    echo $PREFIX
}

emit_header () {
    CREATION_CLAUSE=$(echo $ENUMERATION_ITEMS | cut -d ' ' -f 1 )
    CREATION_CLAUSE=set_$(echo ${CREATION_CLAUSE//${PREFIX}} | tr '[:upper:]' '[:lower:]')
    cat >$EIFFEL_ENUM_FILE <<EOF
note
	description: "Enum $ENUM_NAME"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file $EIFFEL_ENUM_FILE.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class $EIFFEL_ENUM
       -- Enum $ENUM_NAME

insert ENUM

creation $CREATION_CLAUSE

EOF
}

emit_setters () {
    cat >>$EIFFEL_ENUM_FILE <<EOF
feature -- Setters

EOF
    for VALUE in $ENUMERATION_ITEMS; do
	ITEM=$(echo ${VALUE//${PREFIX}} | tr '[:upper:]' '[:lower:]')
	cat >>$EIFFEL_ENUM_FILE <<EOF
    set_$ITEM is 
       do
          value := $EIFFEL_PREFIX$ITEM 
       ensure is_$ITEM 
       end

EOF
    done
}

emit_queries () {
    cat >>$EIFFEL_ENUM_FILE <<EOF
feature -- Queries

EOF
    for VALUE in $ENUMERATION_ITEMS; do
	ITEM=$(echo ${VALUE#$PREFIX}| tr '[:upper:]' '[:lower:]')
	cat >>$EIFFEL_ENUM_FILE <<EOF
    is_$ITEM: BOOLEAN is do Result:=(value=$EIFFEL_PREFIX$ITEM) end

EOF
    done
    ## Emit is_valid_value
    echo >>$EIFFEL_ENUM_FILE "
    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=("
                    
    for VALUE in $ENUMERATION_ITEMS; do
	ITEM=$(echo ${VALUE}| tr '[:upper:]' '[:lower:]')
	echo >>$EIFFEL_ENUM_FILE "                    (a_value=$ITEM) or else"
    done
    echo >>$EIFFEL_ENUM_FILE "                    False -- A little hack to simplifies the generating script.
                    )
        end
"
}

emit_values () {
    cat >>$EIFFEL_ENUM_FILE <<EOF
feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

EOF
    for VALUE in $ENUMERATION_ITEMS; do
	ITEM=$(echo ${VALUE}| tr '[:upper:]' '[:lower:]')
	cat >>$EIFFEL_ENUM_FILE <<EOF
    $ITEM: INTEGER is
         external "C macro use $HEADER"
         alias "$VALUE"
         end

EOF
    done
}

emit_footer () {
    cat >>$EIFFEL_ENUM_FILE <<EOF
end -- class $EIFFEL_ENUM
EOF
}

apply_patch () {
    PATCH=${EIFFEL_ENUM_FILE%.e}.patch
    if [ -f $PATCH ] 
    then 
	echo "Applying $PATCH." ## to $EIFFEL_ENUM_FILE."
	patch -p0 <$PATCH
    fi
}

##until [ -z $1 ]  # Until all parameters used up...
##d##o
##    case $1 in 
##	--header )
##	    if [ -z $1 ]
##	    then echo "Missing header file name"; exit 5
##	    else HEADER=$1; shift
##	    fi
##	    ;;
##	* )
##	    print_usage
##	    exit 1
##	    ;;
##   esac 
##  shift
##done

for FILE; do
    if [ -f $FILE ] ; then process_file $FILE
    else echo "File '$FILE' does not exists."
    fi
done
