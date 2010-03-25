## Let's see if the following bug is solved.
## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##export GCCXML_COMPILER = gcc-4.2

wrappers: dl.gcc-xml
	wrappers-generator --local --directory . dl.gcc-xml /usr/include/dlfcn.h
	# Add those when available: --typedefs POSIX_TYPES   

dl.gcc-xml: plugin/c/liberty-dynamic-loader.h
	gccxml plugin/c/liberty-dynamic-loader.h -fxml=dl.gcc-xml

