## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.

##GCCXML_COMPILER = gcc-4.2

XML=cairo.gcc-xml
HEADER=/usr/include/cairo/cairo.h
HEADERS=cairo.gcc-xml /usr/include/cairo/*.h 

wrappers: $(XML)
	wrappers-generator --local --directory . $(HEADERS) 

$(XML): $(HEADER)
	gccxml `pkg-config --cflags cairo` $(HEADER) -fxml=$(XML)

