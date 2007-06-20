#!/bin/sh

WRONGS=classes-with-errors
RIGHTS=successful-classes

if [ -f $WRONGS ] ; 
then
    TESTABLE=$(cat $WRONGS)
    echo "Testing failing classes:"
    echo $TESTABLE
else 
    echo "Testing all classes"; 
    TESTABLE=$(ls ../library/*.e |
	## Remove stubs
	grep -v stub | 
	## From the end 
	sort -r);
fi

for x in $TESTABLE
do
    echo Checking $x
    if se class_check $x 2>&1;
    then 
	echo $x is correct.
	echo >>$RIGHTS $x 
    else 
	echo $x contains errors.
	echo >>$WRONGS $x
    fi 
done

echo $(wc -l $WRONGS) classes with errors, $(wc -l $RIGHTS) correct.