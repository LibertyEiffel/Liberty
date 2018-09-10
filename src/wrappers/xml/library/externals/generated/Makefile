XML=libxml2.gcc-xml
HEADER=libxml2-liberty.h
HEADERS := $(shell pkg-config --cflags-only-I libxml-2.0| cut -c 3- |tr --delete  '[:space:]' )/libxml/*
## The previous variable is computed from the output of pkg-config, removing the "-I" 

.PHONY: clean
wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS) 

verbose: $(XML)
	wrappers_generator --verbose --local $(XML) $(HEADERS) 

debug: $(XML)
	wrappers_generator.debug --verbose --local $(XML) $(HEADERS) 

$(XML): $(HEADER) 
	@castxml --castxml-gccxml -x c++  `pkg-config --cflags libxml-2.0` $(HEADER) -o $(XML)

clean:
	rm $(XML) *.e
