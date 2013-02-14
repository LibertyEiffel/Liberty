XML=gtk.gcc-xml
HEADER=/usr/include/gtk-2.0/gtk/gtk.h 
HEADERS=/usr/include/gtk-2.0/gtk/*.h  

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)   

$(XML):$(HEADER) 
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS  `pkg-config --cflags-only-I gtk+-2.0` $(HEADER) -fxml=$(XML)

