## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
GCCXML_COMPILER=gcc-4.2

llvm.gcc-xml:/usr/include/glib-2.0/glib.h 
	gccxml `llvm-config --cflags` llvm-liberty.h -fxml=llvm.gcc-xml

wrappers:
	eiffel-gcc-xml --typedefs LLVM_TYPES --use-naturals --local --directory . --plugin . llvm-plugin llvm.gcc-xml llvm-liberty.h  

