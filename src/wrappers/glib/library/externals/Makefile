## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
GCCXML_COMPILER = gcc-4.2

wrappers: glib.gcc-xml
	wrappers-generator --typedefs GLIB_TYPES --local --directory . glib.gcc-xml /usr/include/glib-2.0/glib/*.h  

glib.gcc-xml:/usr/include/glib-2.0/glib.h 
	gccxml `pkg-config --cflags glib-2.0` /usr/include/glib-2.0/glib.h -fxml=glib.gcc-xml

verbose:
	wrappers-generator --verbose --typedefs GLIB_TYPES --local --directory . glib.gcc-xml /usr/include/glib-2.0/glib/*.h  

