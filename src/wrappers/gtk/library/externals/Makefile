wrappers: gtk.gcc-xml
	wrappers-generator --local --directory . gtk.gcc-xml /usr/include/gtk-2.0/gtk/*.h  

gtk.gcc-xml:/usr/include/gtk-2.0/gtk/gtk.h 
	gccxml `pkg-config --cflags-only-I gtk+-2.0` /usr/include/gtk-2.0/gtk/gtk.h -fxml=gtk.gcc-xml

