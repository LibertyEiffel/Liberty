#!/bin/sh

WRONG_CLASSES=classes-with-errors
CORRECT_CLASSES=correct-classes

WRONG_EXAMPLES=examples-with-errors
CORRECT_EXAMPLES=correct-examples

check_position () {
    if [ ! $eiffel_libraries ] 
    then 
	echo "\$eiffel_libraries enviromental variable not set. Quitting"
	exit 5
    fi
    if [ ! -f loadpath.se ] ; then
	echo "Couldn't find loadpath.se in current directory cluster."
	exit 5
    fi
}

check_classes () {
    # check all the library classes, starting with those that had
    # error the oast time the check-cluster script were launched
    
    if [ ! -d library ] ; then
	echo "Couldn't find library in current directory cluster"
	exit 5
    else
	echo "Testing library classes."
	for CLASS in $( # Testable classes 
            if [ -s $WRONG_CLASSES ] ; 
	    then # Prepend wrong classes
		cat $WRONG_CLASSES
	        # Find all classes in the library
		find library -iname "*.e" | 
		## Remove stubs
		grep -v stub  |
		# Remove classes with errors (previously prepended)
		grep -v -F -f $WRONG_CLASSES
		rm $WRONG_CLASSES # We are checking them anew.
            else find library -iname "*.e" | grep -v stub 
	    fi
	    );
	do
	    echo -n "Checking $CLASS: "
	    if se class_check $CLASS 2>&1;
	    then 
		echo correct.
		echo >>$CORRECT_CLASSES $CLASS 
	    else 
		echo contains errors.
		echo >>$WRONG_CLASSES $CLASS
	    fi 
	done

	if [ -s $CORRECT_CLASSES ]
	then echo $(wc -l $CORRECT_CLASSES) correct classes.
	fi

	if [ -s $WRONG_CLASSES ] 
	then
	    echo $(wc -l $WRONG_CLASSES) classes with errors
	    exit 5
	fi
    fi ## library exits
}

compile_examples () { 
    # re-compile all the examples that needs to be recompiled and
    # rechecked, run them and ask the developer to confirm the
    # correctness of the output.
    if [ ! -d examples ] ; then
	echo "Couldn't find examples directory in current cluster"
	exit 5
    fi
    
    echo "Testing examples."

    ## Create a time mark. Examples more recent than it will be run.
    TIME_MARK=$(mktemp)
    if touch $TIME_MARK ; 
    then 
	for EXAMPLE in $(find examples -iname "*.ace") 
	do
	    EXAMPLE_DIR=$(dirname $EXAMPLE)
	    EXAMPLE_NAME=$(basename $EXAMPLE)
	    EXECUTABLE=$(se ace_check $EXAMPLE |
		grep system |
		cut  --delimiter=" " --fields=2)
	    echo -n "Testing $EXAMPLE_NAME in $EXAMPLE_DIR. "
	    if ( cd $EXAMPLE_DIR; compile $EXAMPLE_NAME )
	    then
		TESTABLE="$TESTABLE $EXAMPLE_DIR/$EXECUTABLE"
		echo "$EXECUTABLE successfully compiled."
		echo >>$CORRECT_EXAMPLES $EXAMPLE 
	    else 
		echo Contains errors.
		echo >>$WRONG_EXAMPLES $EXAMPLE
	    fi
	done
	
	echo Testing $TESTABLE
	for EXAMPLE in $TESTABLE
	do
	    EXAMPLE_DIR=$(dirname $EXAMPLE)
	    EXAMPLE_NAME=$(basename $EXAMPLE)
	    echo Running $EXAMPLE_NAME in $EXAMPLE_DIR.
	    
	    ## read -p "Does $EXAMPLE behave as expected?" OK
	    if 	    ./$EXAMPLE
	    then echo $EXAMPLE_NAME successful
	    else echo $EXAMPLE_NAME NOT successful
	    fi
	done

	rm $TIME_MARK
    fi
}

cat <<EOF
$(basename $0) branch_name

Create or update a branch for a release. 
If all classes are correct, examples compiles, 

TODO: IS IT USEFUL TO FINISH IT?

EOF

if check_position ; then
    # This could become a good "commit-filter", i.e.: if the script
    # does not end successfully you should not commit your changes.
    until [ -z $1 ]  # Until all parameters used up...
    do
	echo -n "$1 "
	case $1 in 
	    library )
		# check library classes
		#check_classes
		;;
	    examples )
		# check library examples
		#compile_examples
		;;
	    all )
		#check_classes
		#compile_examples
		;;
	    * )
		
	esac 
	shift
    done


    #  (in a further version) run all tests of the cluster.
else
    echo "Couldn't find a proper cluster directory; exiting"
    exit 5
fi
