#!/bin/csh
# Testsuite for eiffel-gsl
#
# Usage: test_suite [args_for_compile]
#

###################################################################
set libparam="`pkg-config --cflags gsl` `pkg-config --libs gsl`"
set compile="se c -clean"
set clean="se clean"
echo ==== options ====
echo Testing with ${compile} ${libparam} $* >> /dev/stderr
echo if you have time consider -debug_check
echo ==== options ====

###################################################################

cd test
foreach t (test_*.e)
	echo -n $t
        ${clean} $t >& /dev/null
	${compile} ${libparam} $* $t 
	if (${status}) then
	    echo Error While Compiling ${t}
	else
	    echo -n "."
	endif
	if (!(-x ./a.out)) then
	    echo No a.out for file ${t}
	else
	    echo -n "."
	endif
	./a.out
	if (${status}) then
	    echo Error While Running ${t}
	else
	    echo "."
	    /bin/rm -f ./a.out
	endif
end

cd matrix
foreach t (test_*.e)
	echo -n $t
        ${clean} $t >& /dev/null
	${compile} ${libparam} $* $t 
	if (${status}) then
	    echo Error While Compiling ${t}
	else
	    echo -n "."
	endif
	if (!(-x ./a.out)) then
	    echo No a.out for file ${t}
	else
	    echo -n "."
	endif
	./a.out
	if (${status}) then
	    echo Error While Running ${t}
	else
	    echo "."
	    /bin/rm -f ./a.out
	endif
end



