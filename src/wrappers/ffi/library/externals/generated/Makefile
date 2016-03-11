XML=ffi.gcc-xml
HEADER=plugin/c/ffi_liberty.h
## HEADERS=`dpkg -L libffi-dev | grep "\.h$$"`
HEADERS=`find /usr/include/ -name ffi.h -o -name ffitarget.h `
CASTXML:=$(shell command -v castxml 2>/dev/null)

wrappers: $(XML)
	wrappers_generator --local $(XML) $(HEADERS)

debug:
	wrappers_generator.debug --verbose --local $(XML) $(HEADERS)

$(XML):
	pkg-config --exists libffi
ifdef CASTXML
	castxml --castxml-gccxml -x c++  `pkg-config --cflags libffi` $(HEADER) -o $(XML)
else
	gccxml `pkg-config --cflags libffi` $(HEADER) -fxml=$(XML)
endif

clean:
	rm -f $(XML) ffi*.e plugin/c/plugin.[ch]

.PHONY: wrappers debug clean


