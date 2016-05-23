XML=sqlite.gcc-xml
HEADER=/usr/include/sqlite3.h

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADER)

$(XML): $(HEADER)
	castxml --castxml-gccxml -DSQLITE_OMIT_DEPRECATED -x c++  $(HEADER) -o $(XML)


