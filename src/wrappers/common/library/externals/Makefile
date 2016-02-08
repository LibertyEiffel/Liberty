## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/ castxml --castxml-gccxml -x c++ /+bug/293807 for further informations.

##export GCCXML_COMPILER = gcc-4.2

XML=standard-c-library.gcc-xml
HEADER=plugin/c/standard-c-lib.h
HEADERS= /usr/include/assert.h \
	 /usr/include/ctype.h \
	 /usr/include/errno.h \
	 /usr/include/float.h \
	 /usr/include/math.h \
	 /usr/include/stddef.h \
	 /usr/include/stdio.h \
	 /usr/include/stdint.h \
	 /usr/include/stdlib.h \
	 /usr/include/string.h \
	 /usr/include/time.h

wrappers: $(XML)
	wrappers_generator --emit-standard-typedefs --local $(XML) $(HEADERS)

$(XML): 
	castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)
