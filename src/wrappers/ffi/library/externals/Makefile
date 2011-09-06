## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##export GCCXML_COMPILER = gcc-4.4

XML=ffi.gcc-xml
HEADER=plugin/c/ffi_liberty.h
HEADERS=`dpkg -L libffi-dev | grep "\.h$$"`

wrappers: $(XML)
	@echo "Using dpkg to locate include files; please provide a portable way to locate them." $(HEADERS)
	wrappers-generator --local $(XML) $(HEADERS) 

## Sorry for the Debianism

$(XML):
	pkg-config --exists libffi
	gccxml `pkg-config --cflags libffi` $(HEADER) -fxml=$(XML)


