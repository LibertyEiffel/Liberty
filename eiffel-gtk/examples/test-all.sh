#!/bin/sh
for TEST in *; do 
    if [ -d "$TEST" ]; then
	if (cd $TEST; 
		echo "Testing $TEST"
		for ACE in *.ace; do
		    if compile $ACE 2>&1 >/dev/null
		    then echo $ACE successful
		    else echo Errors in $ACE; exit 5;
		    fi
		done
	    )
	then echo Successful
	## else echo Failing ; exit 5;
	fi
    ## else echo "$TEST is not usable"
    fi
done
