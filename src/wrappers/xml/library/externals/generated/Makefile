XML=libxml2.gcc-xml
HEADER=libxml2-liberty.h
HEADERS := $(shell pkg-config --cflags-only-I libxml-2.0| cut -c 3- |tr --delete  '[:space:]' )/libxml/*
## The previous variable is computed from the output of pkg-config, removing the "-I" 
CASTXML:=$(shell command -v castxml 2>/dev/null)

.PHONY: clean
wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS) 

verbose: $(XML)
	wrappers_generator --verbose --local $(XML) $(HEADERS) 

debug: $(XML)
	wrappers_generator.debug --verbose --local $(XML) $(HEADERS) 

$(XML): $(HEADER) 
ifdef CASTXML
	@castxml --castxml-gccxml -x c++  `pkg-config --cflags libxml-2.0` $(HEADER) -o $(XML)
else
	@gccxml --gccxml-compiler gcc-4.9 `pkg-config --cflags libxml-2.0` $(HEADER) -fxml=$(XML)
endif

clean:
	rm $(XML) *.e
