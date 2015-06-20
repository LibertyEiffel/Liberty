XML=sqlite.gcc-xml
HEADER=/usr/include/sqlite3.h

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADER)

$(XML): $(HEADER)
	gccxml $(HEADER) -fxml=$(XML)


