## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.

##GCCXML_COMPILER = gcc-4.2

XML=cairo.gcc-xml
HEADER=/usr/include/cairo/cairo.h
HEADERS=cairo.gcc-xml /usr/include/cairo/*.h 

CASTXML:=$(shell command -v castxml 2>/dev/null)

wrappers: $(XML)
	wrappers_generator --local $(XML)  $(HEADERS) 

$(XML): $(HEADER)
	pkg-config --exists cairo
ifdef CASTXML
	castxml --castxml-gccxml -x c++ `pkg-config --cflags-only-I cairo`  $(HEADER) -o $(XML)
else
	gccxml `pkg-config --cflags-only-I cairo` $(HEADER) -fxml=$(XML)
endif

clean: 
	rm $(XML) *.e
