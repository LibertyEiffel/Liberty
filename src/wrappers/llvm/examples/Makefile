## A crude Makefile to compile Smart/Liberty Eiffel programs using LLVM , because it requires C++ linkage even if Eiffel is usually lowered/compiled to C.

example: example.s
	gcc -o example example.s
	## "as example.s -o example" produces a relocatable; currently llvm tools - even experimantal - do not provide an assembler that produces executables.


example.s: example.bc
	llc example.bc

example.bc: llvm_example
	./llvm_example >example.bc

llvm_example: llvm_example.e
	compile_to_c -no-split -all-check llvm_example 
	gcc `llvm-config --cflags all` -c llvm_example.c
	g++ llvm_example.o -o llvm_example `llvm-config --libs --cflags --ldflags core bitwriter` 

clean:
	rm *.c *.o llvm_example example example.bc example.s

