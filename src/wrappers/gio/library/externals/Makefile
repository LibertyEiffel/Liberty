XML=gio.gccxml
HEADER=plugin/c/gio.h
HEADERS=/usr/include/glib-2.0/gio/*.h  

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS  `pkg-config --cflags glib-2.0` $(HEADER) -fxml=$(XML)

