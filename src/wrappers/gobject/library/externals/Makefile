XML=gobject.gcc-xml
HEADER=/usr/include/glib-2.0/glib-object.h
HEADERS=/usr/include/glib-2.0/gobject/*

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

gobject.gcc-xml:$(HEADER)
	pkg-config --exists gobject-2.0
	castxml --castxml-gccxml -x c++  -DGLIB_DISABLE_DEPRECATION_WARNINGS  `pkg-config --cflags-only-I gobject-2.0` $(HEADER) -o $(XML)

