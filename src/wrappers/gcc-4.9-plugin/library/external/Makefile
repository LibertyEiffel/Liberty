XML=gcc-4-9-plugin.gcc-xml
HEADER=/usr/lib/gcc/x86_64-linux-gnu/4.9/plugin/include/gcc-plugin.h
HEADERS= /usr/lib/gcc/x86_64-linux-gnu/4.9/plugin/include/*.h

wrappers: $(XML)
	wrappers-generator --verbose --emit-standard-typedefs --local $(XML) $(HEADERS)

$(XML): 
	gccxml $(HEADER) -fxml=$(XML)
