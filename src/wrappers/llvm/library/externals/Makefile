XML=llvm.gcc-xml
HEADER=plugin/c/llvm-liberty.h
HEADERS=/usr/include/llvm-c/*

wrappers: $(XML)
	wrappers-generator --verbose --local $(XML) $(HEADERS)
$(XML): 
	## Sometimes gccxml cannot process sources behaving like the default compiler. 
	## We force it to try to behave like versions known to work until it finds one that is actually available.
	## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
	gccxml --gccxml-compiler gcc-4.2 `llvm-config --cflags all` $(HEADER) -fxml=$(XML) || \
		gccxml --gccxml-compiler gcc-4.1 `llvm-config --cflags all` $(HEADER) -fxml=$(XML)




