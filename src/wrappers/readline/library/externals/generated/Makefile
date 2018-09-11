XML=readline.gcc-xml
HEADER=readline.h
HEADERS=/usr/include/readline/*.h

wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS)  

$(XML): $(HEADER)
	@castxml --castxml-gccxml -x c++  -o $(XML) $(HEADER) 

