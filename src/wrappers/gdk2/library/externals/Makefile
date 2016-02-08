XML=gdk.gcc-xml
HEADER=/usr/include/gtk-2.0/gdk/gdk.h 
HEADERS=/usr/include/gtk-2.0/gdk/*.h  

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)   

$(XML):$(HEADER) 
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS -DGDK_DISABLE_DEPRECATED=1 -DGDK_PIXBUF_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATEDS=1 -DATK_DISABLE_DEPRECATED=1 -DPANGO_DISABLE_DEPRECATED=1 `pkg-config --cflags-only-I gdk-2.0` $(HEADER) -fxml=$(XML)
