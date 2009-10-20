## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
export GCCXML_COMPILER = gcc-4.2

wrappers: posix.gcc-xml
	wrappers-generator --local --directory . posix.gcc-xml /usr/include/* /usr/include/sys/*
	# Add those when available: --typedefs POSIX_TYPES   

posix.gcc-xml: posix-includes.h
	gccxml posix-includes.h -fxml=posix.gcc-xml



