XML=gtk3.gcc-xml
HEADER=/usr/include/gtk-3.0/gtk/gtk.h

HEADERS=/usr/include/gtk-3.0/gtk/*

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

verbose: $(XML)
	wrappers_generator --verbose --local $(XML) $(HEADERS)

gtk3.gcc-xml:$(HEADER)
	pkg-config --exists gtk+-3.0
	castxml --castxml-gccxml -x c++   -DGLIB_DISABLE_DEPRECATION_WARNINGS \
		-DGDK_DISABLE_DEPRECATION_WARNINGS \
		-D GLIB_DISABLE_DEPRECATED \
		-D G_DISABLE_DEPRECATED \
		-D GTK_DISABLE_DEPRECATED \
		`pkg-config --cflags-only-I gtk+-3.0` $(HEADER) -o $(XML)

