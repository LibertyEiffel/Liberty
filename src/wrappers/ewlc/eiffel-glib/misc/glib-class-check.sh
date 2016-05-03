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
		# Remove classes with errors (previously prepended)
		grep -v -F -f $WRONG_CLASSES
		rm $WRONG_CLASSES # We are checking them anew.
            else find library -iname "*.e" | grep -v stub 
	    fi
	    );
	do
	    echo Checking $CLASS
	    if se class_check $CLASS 2>&1;
	    then 
		echo $CLASS is correct.
		echo >>$CORRECT_CLASSES $CLASS 
	    else 
		echo $CLASS contains errors.
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

    ## Create a time signal. Examples more recent than it will be run.
    TIME_SIGNAL=$(mktemp)
    if touch $TIME_SIGNAL ; 
    then 
	for EXAMPLE in $(find examples -iname "*.ace") 
	do
	    EXAMPLE_DIR=$(dirname $EXAMPLE)
	    EXAMPLE_NAME=$(basename $EXAMPLE)
	    echo -n "Testing $EXAMPLE_NAME in $EXAMPLE_DIR. "
	    if ( cd $EXAMPLE_DIR ; compile $EXAMPLE_NAME  ) 
	    then
		echo $EXAMPLE_NAME successfully compiled
		echo >>$CORRECT_EXAMPLES $EXAMPLE 
	    else 
		echo $EXAMPLE_NAME contains errors.
		echo >>$WRONG_EXAMPLES $EXAMPLE
	    fi
	done
	
	for EXAMPLE in $(find examples -perm +0100 -newer $TIME_SIGNAL) ;
	do
	    EXAMPLE_DIR=$(dirname $EXAMPLE)
	    EXAMPLE_NAME=$(basename $EXAMPLE)
	    echo Running $EXAMPLE_NAME in $EXAMPLE_DIR.
	    
	    ## read -p "Does $EXAMPLE behave as expected?" OK
	    if 	    ./$EXAMPLE
	    then echo $EXAMPLE_NAME successful
	    else echo $EXAMPLE_NAME NOT successful; exit 5 
	    fi
	done

	rm $TIME_SIGNAL
    fi
}

cat <<EOF
$0

- check all the library classes, starting with those that had error
  the last time the check-cluster script were launched. Those with
  errors are listed in "$WRONG_CLASSES", those without in
  "$CORRECT_CLASSES".

- re-compiles all the examples that needs to be recompiled, run them
  and ask the developer to confirm its correct behaviour. Those that
  seems to behave correctly are added to $CORRECT_EXAMPLES, the others
  to $WRONG_EXAMPLES.

Usage: run it in a cluster of the Eiffel Wrapper Library Collection,
i.e. eiffel-gtk, eiffel-gda, eiffel-glib.

EOF

if check_position ; then
    # This could become a good "commit-filter", i.e.: if the script
    # does not end successfully you should not commit your changes.
    check_classes
    compile_examples
    #  (in a further version) run all tests of the cluster.
else
    echo "Couldn't find a proper cluster directory; exiting"
    exit 5
fi
