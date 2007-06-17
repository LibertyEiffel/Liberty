#!/bin/sh

WRONGS=classes-with-errors
RIGHTS=successful-classes

cat <<EOF
$0 will check all classes it founds in current directory tree. 

If "$WRONGS" file is present it will check the classes found there,
assuming that previous run of this script found errors in them.

Otherwise all the classes found are tested. Those with errors are
listed in "$WRONGS", those without in "$RIGHTS".

EOF

if [ ! -f loadpath.se ] ; then
    echo "Couldn't find loadpath.se in current firectory"
    exit 5
fi

if [ -f $WRONGS ] ; 
then
    TESTABLE=$(cat $WRONGS)
    echo "Testing failing classes:"
    echo $TESTABLE
else 
    echo "Testing all classes"; 
    TESTABLE=$(find library -iname "*.e" |
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