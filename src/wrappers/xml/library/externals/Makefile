## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##GCCXML_COMPILER=gcc-4.2

XML=libxml2.gcc-xml
HEADER=/usr/include/libxml2/libxml/parser.h

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADER)   

$(XML): $(HEADER) 
	gccxml `pkg-config --cflags libxml-2.0` $(HEADER) -fxml=$(XML)

