## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
## export GCCXML_COMPILER = gcc-4.2

XML=llvm.gcc-xml
HEADER=plugin/c/llvm-liberty.h
HEADERS=/usr/include/llvm-c/*

wrappers: $(XML)
	wrappers-generator --verbose --local $(XML) $(HEADERS)
$(XML): 
	gccxml `llvm-config --cflags all` $(HEADER) -fxml=$(XML)



