XML=gtk.gcc-xml
HEADER=/usr/include/gtk-2.0/gtk/gtk.h 
HEADERS=/usr/include/gtk-2.0/gtk/*.h  

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)   

$(XML):$(HEADER) 
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS -DGTK_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DGDK_PIXBUF_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATEDS=1 -DATK_DISABLE_DEPRECATED=1 -DPANGO_DISABLE_DEPRECATED=1 `pkg-config --cflags-only-I gtk+-2.0` $(HEADER) -fxml=$(XML)

