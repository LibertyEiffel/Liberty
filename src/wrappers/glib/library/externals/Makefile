XML=glib.castxml 
HEADER=/usr/include/glib-2.0/glib.h 
HEADERS=/usr/include/glib-2.0/glib/*.h  

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
	castxml --castxml-gccxml -x c++  -DGLIB_DISABLE_DEPRECATION_WARNINGS `pkg-config --cflags glib-2.0` $(HEADER) -o $(XML)

