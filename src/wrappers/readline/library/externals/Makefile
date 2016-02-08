## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/ castxml --castxml-gccxml -x c++ /+bug/293807 for further informations.
## GCCXML_COMPILER = gcc-4.2

XML=readline.gcc-xml
HEADER=readline.h
HEADERS=/usr/include/readline/*.h

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)  

$(XML): $(HEADER)
	castxml --castxml-gccxml -x c++  -o $(XML) $(HEADER) 

