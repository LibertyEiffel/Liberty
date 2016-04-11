#!/bin/bash

# An home-grown script to check all the classes
# found in a wrapper library having a library and
# example subdirectories.

TIMESTAMP=.check_cluster_timestamp

WRONG_CLASSES=classes-with-errors
CORRECT_CLASSES=correct-classes

WRONG_EXAMPLES=examples-with-errors
CORRECT_EXAMPLES=correct-examples

export WRONG_CLASSES CORRECT_CLASSES WRONG_EXAMPLES CORRECT_EXAMPLES

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

run_tests () {
	## Run eiffeltest test
	if [ ! -d tests ] ; then 
		echo "Couldn't find tests in current directory cluster"
		exit 5
	else
		echo "Running tests"
		eiffeltest tests
	fi

}

wrong_and_correct_classes () { 
	# All the testable classes; the classes with known error are listed first

	if [ -s $WRONG_CLASSES ] ; 
	then # Prepend wrong classes
		cat $WRONG_CLASSES
		# Find all classes in the library
		find library -iname "*.e" | 
		# Remove stubs
		grep -v stub  |
		sort --numeric-sort --reverse | 
		# Remove classes with errors (previously prepended)
		grep -v -F -f $WRONG_CLASSES
	else find library -iname "*.e" | grep -v stub 
	fi
}

changed_classes_first () {
	# The files ordered from the latest to the oldest

	## Find in the directory "library" all Eiffel source code, print
	## its change time (in seconds from epoch) and its name
	find library -name "*.e" -printf "%T@ %p\n" |
	## remove stubs
	grep -v stub |
	sort --numeric-sort --reverse | 
	## Remove the first column (changetime)
	cut -f 2 -d ' '

	# if [ -f $TIMESTAMP ] ; then
	# find library -iname "*.e" -newer $TIMESTAMP   | grep -v stub 
	# find library -iname "*.e" ! -newer $TIMESTAMP | grep -v stub 
	# else
	# find library -iname "*.e" | grep -v stub 
	# fi
	# touch $TIMESTAMP
}

check-class () {
    RESULT=$(mktemp -t check-class-XXXXX)
    CLASS=$1

    echo -n "Checking $CLASS: "
    if se class_check $CLASS >$RESULT 2>&1
    then 
        echo correct.
        echo >>$CORRECT_CLASSES $CLASS 
    else 
        echo contains errors.
        cat $RESULT
        echo >>$WRONG_CLASSES $CLASS
    fi
    rm --force $RESULT
}

export -f check-class # to satisfy parallel command; this command is bash specific.

check_classes () {
	# check all the library classes
	if [ ! -d library ] ; then
		echo "Couldn't find library in current directory cluster"
		exit 5
	else
		echo "Testing library classes."
		if [ -s $WRONG_CLASSES ] ; then rm $WRONG_CLASSES; fi
		if [ -s  $CORRECT_CLASSES ] ; then rm  $CORRECT_CLASSES; fi

        touch $WRONG_CLASSES $CORRECT_CLASSES
        if which parallel >/dev/null
        then 
            echo Using parallel command
            changed_classes_first | 
            parallel --no-notice check-class {} 2>&1
        else
            for CLASS in $( changed_classes_first ) # $( wrong_and_correct_classes )
            do
                class_check $CLASS
            done
        fi

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
	TIME_MARK=$(mktemp -t)
	if touch $TIME_MARK ; 
	then 
		rm $WRONG_EXAMPLES $CORRECT_EXAMPLES # We're testing them anew

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

clear_temporary_files () {
	for EXAMPLE in $(find examples -iname "*.ace") 
	do
		EXAMPLE_DIR=$(dirname $EXAMPLE)
		EXAMPLE_NAME=$(basename $EXAMPLE)
		EXECUTABLE=$(se ace_check $EXAMPLE |
		grep system |
		cut  --delimiter=" " --fields=2)
		echo -n "Testing $EXAMPLE_NAME in $EXAMPLE_DIR. "
		( cd $EXAMPLE_DIR; se clean $EXAMPLE_NAME )
	done
}
print_usage () {
	cat <<EOF
	$(basename $0) ARGUMENTS

	Arguments: 

	test

	run eiffeltest using the "test" directory

	library 

	check all the library classes, starting with those that have been 
	changed since the last time this were launched. Those with
	errors are listed in "$WRONG_CLASSES", those without in
	"$CORRECT_CLASSES".

	examples

	re-compiles all the examples that needs to be recompiled, run them
	and ask the developer to confirm its correct behaviour. Those that
	seems to behave correctly are added to $CORRECT_EXAMPLES, the
	others to $WRONG_EXAMPLES.

	clean

	remove all the temporary files.

	Usage: run it in a cluster of the Eiffel Wrapper Library Collection,
	i.e. eiffel-gtk, eiffel-gda, eiffel-glib.

	This script would like to be (become) a good "commit-filter", i.e.: if
	it does not end successfully you should not commit your changes.

EOF

	## library was: check all the library classes, starting with those
	## that had error the last time the check-cluster script were
	## launched. Those with errors are listed in "$WRONG_CLASSES", those
	## without in "$CORRECT_CLASSES".

}

until [ -z $1 ]  # Until all parameters used up...
do
	case $1 in 
		test )
		# run tests
		run_tests
		;;
		library )
		# check library classes
		check_classes
		;;
		examples )
		# check library examples
		compile_examples
		;;
		clean )
		# Remove temporary files
		clear_temporary_files
		;;
		all )
		check_classes
		compile_examples
		;;
		* )
		print_usage
		;;
	esac 
	shift
done
