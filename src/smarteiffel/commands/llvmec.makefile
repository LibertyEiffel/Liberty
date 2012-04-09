## A crude Makefile to compile LLVM-Liberty-Eiffel compiler: it requires C++
## linkage even if Eiffel is usually lowered/compiled to C.

## compiling chain will be

## Eiffel source code -> bytecode (.bc) -> assembler (.s) -> executable

## from assembler to executable with "gcc -o a_file a_file.s" (perhaps now llvm-as will do)
## from bytecode to assembly "llc example.bc"

llvmec: 
	@echo "Building LLVM Liberty Eiffel compiler (the warning suppression flag '-w' is used because bootstrapping SmartEiffel or my low level code does not interact well with const)"
	compile_to_c llvmec.ace
	gcc -w `llvm-config --cflags all` -c llvec*.c
	g++ -Xlinker --no-as-needed llvmec*.o -o llvmec `llvm-config --libs --cflags --ldflags core bitwriter` 

clean:
	clean llvm_example

