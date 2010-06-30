XML=gdk.gcc-xml
HEADER=/usr/include/gtk-2.0/gdk/gdk.h 
HEADERS=/usr/include/gtk-2.0/gdk/*.h  

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)   

$(XML):$(HEADER) 
	gccxml `pkg-config --cflags-only-I gdk-2.0` $(HEADER) -fxml=$(XML)
