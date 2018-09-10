XML=cairo.gcc-xml
HEADER=/usr/include/cairo/cairo.h
HEADERS=cairo.gcc-xml /usr/include/cairo/*.h 

wrappers: $(XML)
	wrappers_generator --local $(XML)  $(HEADERS) 

$(XML): $(HEADER)
	pkg-config --exists cairo
	castxml --castxml-gccxml -x c++ `pkg-config --cflags-only-I cairo`  $(HEADER) -o $(XML)

clean: 
	rm $(XML) *.e
