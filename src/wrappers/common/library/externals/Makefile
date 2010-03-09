## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
export GCCXML_COMPILER = gcc-4.2

wrappers: standard-c-library.gcc-xml
	wrappers-generator --global --directory . standard-c-library.gcc-xml posix.gcc-xml 

standard-c-library.gcc-xml: plugin/c/standard-c-lib.h
	gccxml plugin/c/standard-c-lib.h -fxml=standard-c-library.gcc-xml
