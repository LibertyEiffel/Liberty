#!/bin/sh
for TEST in *; do 
    if [ -d "$TEST" ]; 
    then ( 
	    cd $TEST; 
	    echo "Cleaning $TEST"
	    for ACE in *.ace; do clean $ACE; done
	)
    ## else echo "$TEST is not usable"
    fi
done
