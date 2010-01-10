## A crude Makefile to compile Smart/Liberty Eiffel programs using LLVM , because it requires C++ linkage even if Eiffel is usually lowered/compiled to C.

example: example.s
	as example.s -o example

example.s: example.bc
	llc example.bc

example.bc: llvm_example
	./llvm_example >example.bc

llvm_example: *.o
	g++ *.o -o llvm_example `llvm-config --libs --cflags --ldflags core bitwriter` 

*.o: *.c
	gcc `llvm-config --cflags all` -c *.c

debug: llvm_example.e
	compile_to_c -debug llvm_example 

*.c : llvm_example.e
	compile_to_c -all-check llvm_example 

clean:
	rm *.c *.o llvm_example example example.bc example.s

