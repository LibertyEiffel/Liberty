XML=postgresql.gcc-xml
HEADER=/usr/include/postgresql/libpq-fe.h
HEADERS=/usr/include/postgresql/*.h

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)  

$(XML):
	castxml --castxml-gccxml -x c++  -o $(XML) $(HEADER) 

