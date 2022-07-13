XML=postgresql.gcc-xml
HEADER=/usr/include/libpq-fe.h
HEADERS=/usr/include/*.h

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)  

$(XML):
	castxml --castxml-gccxml -x c++  -o $(XML) $(HEADER) 

