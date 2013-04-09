XML=gobject-introspection.gccxml
HEADER=gobject-introspection.h 
HEADERS=/usr/include/gobject-introspection-1.0/*.h  /usr/include/glib-2.0/gobject/*.h

wrappers: $(XML)
	wrappers-generator $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS `pkg-config --cflags-only-I gobject-introspection-1.0` $(HEADER) -fxml=$(XML)

