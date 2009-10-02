## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
GCCXML_COMPILER=gcc-4.2

glib.gcc-xml:/usr/include/glib-2.0/glib.h 
	gccxml `pkg-config --cflags glib-2.0` /usr/include/glib-2.0/glib.h -fxml=glib.gcc-xml

wrappers:
	eiffel-gcc-xml --use-naturals --local --directory . --plugin ../../../plugins glib glib.gcc-xml /usr/include/glib-2.0/glib/*.h  
	## Used to have --typedefs GLIB_TYPES

verbose:
	eiffel-gcc-xml --verbose --typedefs GLIB_TYPES --use-naturals --local --directory . --plugin ../../../plugins glib glib.gcc-xml /usr/include/glib-2.0/glib/*.h  

