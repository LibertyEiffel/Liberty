XML=glib.gccxml
HEADER=/usr/include/glib-2.0/glib.h 
HEADERS=/usr/include/glib-2.0/glib/*.h  

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)

$(XML): $(HEADER) $(HEADERS)
<<<<<<< HEAD
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS `pkg-config --cflags glib-2.0` $(HEADER) -fxml=$(XML)
=======
	gccxml -DGLIB_DISABLE_DEPRECATION_WARNINGS  `pkg-config --cflags glib-2.0` $(HEADER) -fxml=$(XML)
>>>>>>> 4d10e11e147afd08bdc831d991f79c1ebbee2356

