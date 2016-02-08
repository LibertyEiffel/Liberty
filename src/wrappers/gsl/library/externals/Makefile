XML=gsl.gcc-xml
HEADER=plugin/c/gsl_liberty.h
HEADERS=/usr/include/gsl/*.h

wrappers: $(XML)
	wrappers_generator --local  $(XML) $(HEADERS)


$(XML): 
	gccxml `gsl-config --cflags` $(HEADER) -fxml=$(XML)




