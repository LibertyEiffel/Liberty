XML=pango.gcc-xml
HEADER=/usr/include/pango-1.0/pango/pango.h
HEADERS=/usr/include/pango-1.0/pango/*.h

wrappers: $(XML)
	wrappers-generator  --local --directory . $(XML) $(HEADERS)

$(XML): $(HEADERS)
	gccxml `pkg-config --cflags-only-I pango` $(HEADER) -fxml=$(XML)

