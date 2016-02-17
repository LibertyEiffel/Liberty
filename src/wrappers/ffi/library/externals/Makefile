## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/ castxml --castxml-gccxml -x c++ /+bug/293807 for further informations.
##export GCCXML_COMPILER = gcc-4.4

XML=ffi.gcc-xml
HEADER=plugin/c/ffi_liberty.h
HEADERS=`dpkg -L libffi-dev | grep "\.h$$"`

CASTXML:=$(shell command -v castxml 2>/dev/null)

wrappers: $(XML)
	@echo "Using dpkg to locate include files; please provide a portable way to locate them." $(HEADERS)
	wrappers_generator --verbose --local $(XML) $(HEADERS)

debug:
	wrappers_generator.debug --verbose --local $(XML) $(HEADERS)

$(XML):
	pkg-config --exists libffi

ifdef CASTXML
	castxml --castxml-gccxml -x c++  `pkg-config --cflags libffi` $(HEADER) -o $(XML)
else
	gccxml $(HEADER) `pkg-config --cflags libffi` -fxml=$(XML)
endif

clean:
	rm -f $(XML) ffi*.e plugin/c/plugin.[ch]

.PHONY: wrappers debug clean


