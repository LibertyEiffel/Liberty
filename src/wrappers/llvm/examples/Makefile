## A crude Makefile to compile Smart/Liberty Eiffel programs using LLVM , becasue it requires C++ linkage even if Eiffel is usually lowered/compiled to C.

llvm_example: *.o
	g++ *.o -o llvm_example `llvm-config --libs --cflags --ldflags core` 

*.c : *.e
	compile_to_c llvm_example 

*.o: *.c
	gcc `llvm-config --cflags core` -c *.c

