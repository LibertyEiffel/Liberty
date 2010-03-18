## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##export GCCXML_COMPILER = gcc-4.4

wrappers: ffi.gcc-xml
	@echo "Using dpkg to locate include files; please provide a portable way to locate them."
	wrappers-generator --local --directory . ffi.gcc-xml plugin/c/ffi_liberty.h `dpkg -L libffi-dev | grep "\.h$$"`

## Sorry for the Debianism

ffi.gcc-xml: 
	pkg-config --exists libffi
	gccxml `pkg-config --cflags libffi` plugin/c/ffi_liberty.h -fxml=ffi.gcc-xml


