## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
GCCXML_COMPILER=gcc-4.2

libxml2.gcc-xml: 
	gccxml "$(pkg-config --cflags libxml-2.0)" /usr/include/libxml2/libxml/parser.h -fxml=libxml2.gccxml

