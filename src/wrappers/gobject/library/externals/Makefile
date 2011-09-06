XML=gobject.gcc-xml
HEADER=/usr/include/glib-2.0/glib-object.h
HEADERS=/usr/include/glib-2.0/gobject/*

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)

gobject.gcc-xml:$(HEADER)
	pkg-config --exists gobject-2.0
	gccxml `pkg-config --cflags-only-I gobject-2.0` $(HEADER) -fxml=$(XML)

