#!/bin/bash

## Process C files finding enumeration and turning them into proper
## Eiffel enumeration class with the design of Eiffel Wrapper
## Libraries Collection

process_file () {
    if [ -n $1 ] ; then 
	## New sed-based design
	FILE=$1
	echo Processing $FILE
	
	if [ -z $HEADER ] ; then 
	    HEADER=$FILE
	    DEFAULT_HEADER=true
	fi 
        	
	# Find functions
	#echo Functions:
	#create_functions $FILE

	## Find Enumerations
	ENUM_FILES=$(mktemp -t eiffel-enum-XXXXX)
	sed --quiet --expression '/\benum\b/,/}/ { 
          s/;/;\n====/g ## Separate each enum
          { s_\([A-Z_]+.*\)_\1@@_ } ## Leave only the enumeration value  
          p }' $FILE |
	if csplit --quiet --prefix=$ENUM_FILES - "/====/" "{*}" 2>/dev/null 
        then
	    echo -e "\nEnumerations:"
	    for ENUM in $(ls $ENUM_FILES*); do 
		if [ -s $ENUM ] ; then process_enum $ENUM; fi
	    done
	else echo No enumeration found
	fi
	rm $ENUM_FILES*
    else echo "process_file: no file to work on."
    fi
}

print_usage () {
    cat <<EOF
$(basename $0) OPTIONS FILES

Options:
  --header=HEADER   Use HEADER instead of current file in external features

WORK IN PROGRESS

EOF

}

create_functions () {
	sed --expression "/(.*);/M {p}" --quiet $FILE |
	## Removing multiple spaces
	sed --expression "s/[\t ]\{2,\}/ /g" |
	sed --expression "s/, +/, /" |
	## Note the usage of # as separator of substitution command
	sed --expression 's#\(.*\);#\t\1 is\n\t\t\t-- \1;\n\t\texternal "C use '"$HEADER"'"\n\tend\n#g' |
	## Remove "(void)" from Eiffel signatures
	sed --expression "/is$/ s/(void)//g" |
	## Convert all pointer return types 
	sed --expression "/is$/ s/[A-Za-z0-9]+ *\*+\(.*\) is/\1: POINTER is/g" 
	
	if [ -n $DEFAULT_HEADER ] ; then
	    ## remove computed header
	    unset HEADER DEFAULT_HEADER
	fi
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
    if [ ! -s $1 ] ; then  
	echo No enum file to work on, bailing out; 
	exit 5;
    fi
    
    ENUM_FILE=$1
    ENUM_NAME=$(grep ";" $ENUM_FILE | tr --delete --complement [:alnum:] )
    EIFFEL_ENUM=$(eiffellize_class_name $ENUM_NAME)
    EIFFEL_ENUM_FILE=$(echo $EIFFEL_ENUM.e | tr '[:upper:]' '[:lower:]')
    echo "Converting $ENUM_NAME into $EIFFEL_ENUM, file \"$EIFFEL_ENUM_FILE\""
    ENUM_PART=$(mktemp)
    if ! csplit --quiet --prefix=$ENUM_PART $ENUM_FILE "/{/1" "/}/" 2>/dev/null
    then exit 5; fi
    #ENUMERATION_ITEMS=$()
    sed --quiet --expression "/[A-Z0-9_]+/ p" ${ENUM_PART}01 #)
    echo Items:
    for ITEM in $ENUMERATION_ITEMS;do echo -n "'$ITEM' "; done
    echo
	#
	#if [ $(echo $ENUMERATION_ITEMS| tr --delete '_' | wc --words) -eq 1 ] 
	#then echo Skipping $EIFFEL_ENUM because it has only one value
	#else
	#    PREFIX=$(longest_prefix $ENUMERATION_ITEMS)
	#    ITEMS=${ENUMERATION_ITEMS//$PREFIX}
	#    EIFFEL_PREFIX=$(echo $PREFIX| tr '[:upper:]' '[:lower:]')
	#    
	#    emit_header
	#    emit_setters
	#    emit_queries
	#    if [ -z $HEADER ] ; then 
	#	HEADER=$FILE
	#	emit_values
	#	unset HEADER
	#	if [ $HEADER ] ; then echo Header not unset; exit 10; fi
	#    else emit_values
	#    fi
	#    emit_footer
	#    apply_patch
	#fi	    
	# Cleaning up
    rm ${ENUM_PART}* 2>/dev/null 
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
