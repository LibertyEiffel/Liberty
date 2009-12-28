## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
export GCCXML_COMPILER = gcc-4.2

wrappers: llvm.gcc-xml
	wrappers-generator --local --directory . llvm.gcc-xml /usr/include/llvm-c/*
#	llvm-liberty.h  
#	eiffel-gcc-xml --typedefs LLVM_TYPES --use-naturals --local --directory . --plugin . llvm-plugin llvm.gcc-xml llvm-liberty.h  

llvm.gcc-xml: plugin/c/llvm-liberty.h
	gccxml `llvm-config --cflags` llvm-liberty.h -fxml=llvm.gcc-xml



