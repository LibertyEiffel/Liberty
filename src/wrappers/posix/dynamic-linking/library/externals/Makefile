## Let's see if the following bug is solved.
## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/ castxml --castxml-gccxml -x c++ /+bug/293807 for further informations.
##export GCCXML_COMPILER = gcc-4.2

XML=dl.gcc-xml
HEADER=plugin/c/liberty-dynamic-loader.h
HEADERS=/usr/include/dlfcn.h

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER)
	castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)

