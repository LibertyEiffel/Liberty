XML=gobject.gcc-xml
HEADER=/usr/include/glib-2.0/glib-object.h
HEADERS=/usr/include/glib-2.0/gobject/*

wrappers: $(XML)
	wrappers-generator --local --directory . $(XML) $(HEADERS)

gobject.gcc-xml:$(HEADER)
	gccxml `pkg-config --cflags-only-I gobject-2.0` $(HEADER) -fxml=$(XML)

