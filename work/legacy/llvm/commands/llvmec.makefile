## A crude Makefile to compile LLVM-Liberty-Eiffel compiler: it requires C++
## linkage even if Eiffel is usually lowered/compiled to C.

## compiling chain will be: Eiffel source code -> bytecode (.bc) -> assembler (.s) -> executable:

## * from assembler to executable with "gcc -o a_file a_file.s" (perhaps now llvm-as will do)
## * from bytecode to assembly with "llc example.bc"

CFLAGS = $(shell llvm-config --cflags all) 
CFLAGS += $(shell pkg-config --cflags libzmq)
LDFLAGS = $(shell llvm-config --libs --ldflags core bitwriter)
LDFLAGS += $(shell pkg-config --libs libzmq)
ACE = llvmec.ace
EXECUTABLE = llvmec
C_SOURCES = llvmec_*.c
OBJECTS  = $(patsubst %.c,%.o,$(wildcard $(C_SOURCES)))
CC = gcc

$(EXECUTABLE): $(OBJECTS)
	@echo "Building LLVM Liberty Eiffel compiler (the warning suppression flag '-w' is used because bootstrapping SmartEiffel or my low level code does not interact well with const)"
	g++ -Xlinker --no-as-needed -o $(EXECUTABLE) $(OBJECTS) $(LDFLAGS)

#à %.o: %.c 
#à 	## $(OBJECTS): $(C_SOURCES)
#à 	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
	
$(C_SOURCES):
	compile_to_c $(ACE)  
    
clean:
	clean $(EXECUTABLE)

