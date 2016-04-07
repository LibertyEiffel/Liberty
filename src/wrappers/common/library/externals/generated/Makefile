XML=standard-c-library.xml
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

debug: $(XML)
	wrappers_generator.debug --verbose --emit-standard-typedefs --local $(XML) $(HEADERS)

verbose: $(XML)
	wrappers_generator --verbose --emit-standard-typedefs --local $(XML) $(HEADERS)


CASTXML:=$(shell command -v castxml 2>/dev/null)

$(XML): 
ifdef CASTXML
	castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)
else
	gccxml $(HEADER) -fxml=$(XML)
endif

clean:
	rm $(XML) *.e
