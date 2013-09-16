## A crude Makefile to compile Smart/Liberty Eiffel programs using LLVM , because it requires C++ linkage even if Eiffel is usually lowered/compiled to C.


example: example.s
	@echo "Assembling to executable; 'as example.s -o example' produces a relocatable; when this example were written llvm tools - even experimantal - do not provide an assembler that produces executables."
	gcc -o example example.s
	@echo Running the generated executable.
	./example

example.s: example.bc
	@echo Compiling bytecode into assembly
	llc example.bc

example.bc: llvm_example
	@echo Running Liberty application, outputting bytecode
	./llvm_example >example.bc

llvm_example: llvm_example.e
	@echo "Building the Liberty application \nNote: the warning suppression flag '-w' is used because generated low level code does not interact well with C const"
	compile_to_c -no-split -all-check llvm_example 
	gcc -w `llvm-config --cflags` -c llvm_example.c
	g++ -Xlinker --no-as-needed llvm_example.o -o llvm_example `llvm-config --libs --ldflags core bitwriter` 

clean:
	clean llvm_example
	rm *.c *.o llvm_example example example.bc example.s
	

