XML=gcc-4-9-plugin.gcc-xml
HEADER=/usr/lib/gcc/x86_64-linux-gnu/4.9/plugin/include/gcc-plugin.h
HEADERS= /usr/lib/gcc/x86_64-linux-gnu/4.9/plugin/include/*.h

wrappers: $(XML)
	wrappers_generator --emit-standard-typedefs --local $(XML) $(HEADERS)

$(XML): 
	castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)
