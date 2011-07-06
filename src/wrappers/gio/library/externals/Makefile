XML=gio.gccxml
HEADER=plugin/c/gio.h
HEADERS=/usr/include/glib-2.0/gio/*.h  

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	gccxml `pkg-config --cflags glib-2.0` $(HEADER) -fxml=$(XML)

