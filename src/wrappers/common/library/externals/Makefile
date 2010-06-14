## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.

##export GCCXML_COMPILER = gcc-4.2

XML=standard-c-library.gcc-xml
HEADER=plugin/c/standard-c-lib.h

wrappers: $(XML)
	wrappers-generator --global --directory . $(XML)

$(XML): 
	gccxml $(HEADER) -fxml=$(XML)
