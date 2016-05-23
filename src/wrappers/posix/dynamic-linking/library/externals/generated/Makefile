XML=dl.gcc-xml
HEADER=plugin/c/liberty-dynamic-loader.h
HEADERS=/usr/include/dlfcn.h
CASTXML:=$(shell command -v castxml 2>/dev/null)

.PHONY: clean

wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER)
ifdef CASTXML
	@castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)
else
		@gccxml --gccxml-compiler gcc-4.9 $(HEADER) -fxml=$(XML)
endif

clean: 
	rm $(XML) *.e
