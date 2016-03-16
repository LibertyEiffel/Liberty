XML=qt5.gcc-xml
HEADER=/usr/include/x86_64-linux-gnu/qt5/QtWidgets/QtWidgets

HEADERS=/usr/include/x86_64-linux-gnu/qt5/*/*

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

debug: $(XML)
	wrappers_generator.debug --verbose --local $(XML) $(HEADERS)

verbose: $(XML)
	wrappers_generator --verbose --local $(XML) $(HEADERS)

qt5.gcc-xml:$(HEADER)
	pkg-config --exists Qt5Gui
	castxml --castxml-gccxml -x c++  \
		-fPIC \
		`pkg-config --cflags-only-I Qt5Gui` $(HEADER) -o $(XML)

