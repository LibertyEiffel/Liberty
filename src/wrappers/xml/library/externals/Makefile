## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##GCCXML_COMPILER=gcc-4.2

XML=libxml2.gcc-xml
HEADER=/usr/include/libxml2/libxml/parser.h

$(XML): 
	gccxml `pkg-config --cflags libxml-2.0` $(HEADER) -fxml=$(XML)

wrappers: 
	wrappers-generator --local --directory . $(XML) $(HEADER)   


