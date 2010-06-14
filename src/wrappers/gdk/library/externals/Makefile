wrappers: gdk.gcc-xml
	wrappers-generator --verbose --local --directory . gdk.gcc-xml /usr/include/gdk-2.0/gdk/*.h  

gdk.gcc-xml:/usr/include/gdk-2.0/gdk/gdk.h 
	gccxml `pkg-config --cflags-only-I gdk+-2.0` /usr/include/gdk-2.0/gdk/gdk.h -fxml=gdk.gcc-xml

