XML=gobject-introspection.castxml
HEADER=gobject-introspection.h 
HEADERS=/usr/include/gobject-introspection-1.0/*.h /usr/include/glib-2.0/gobject/*
## /usr/include/glib-2.0/gobject/*.h

wrappers: $(XML)
	wrappers_generator $(XML) $(HEADERS)

verbose: $(XML)
	wrappers_generator --verbose $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	castxml --castxml-gccxml -x c++ -DGLIB_DISABLE_DEPRECATION_WARNINGS `pkg-config --cflags-only-I gobject-introspection-1.0` $(HEADER) -o $(XML)

