XML=glib.gccxml
HEADER=/usr/include/glib-2.0/glib.h 
HEADERS=/usr/include/glib-2.0/glib/*.h  

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	gccxml `pkg-config --cflags glib-2.0` $(HEADER) -fxml=$(XML)

