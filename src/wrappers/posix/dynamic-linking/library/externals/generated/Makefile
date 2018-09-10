XML=dl.gcc-xml
HEADER=plugin/c/liberty-dynamic-loader.h
HEADERS=/usr/include/dlfcn.h

.PHONY: clean

wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER)
	@castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)

clean: 
	rm $(XML) *.e
