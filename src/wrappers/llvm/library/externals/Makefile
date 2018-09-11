XML=llvm.gcc-xml
HEADER=plugin/c/llvm-liberty.h
HEADERS=`llvm-config --includedir`/llvm-c/*
LLVM_VERSION=`llvm-config --version`

.PHONY: clean

wrappers: $(XML)
	wrappers_generator --verbose $(XML) $(HEADERS)

$(XML): 
	@echo "Using LLVM $(LLVM_VERSION)"
	castxml --castxml-gccxml -x c++ `llvm-config --cppflags` $(HEADER) -o $(XML)

clean: 
	@echo Removing generated files
	rm $(XML) *.e


