XML=readline.gcc-xml
HEADER=readline.h
HEADERS=/usr/include/readline/*.h
CASTXML:=$(shell command -v castxml 2>/dev/null)

wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS)  

$(XML): $(HEADER)
ifdef CASTXML
	@castxml --castxml-gccxml -x c++  -o $(XML) $(HEADER) 
else
	@gccxml --gccxml-compiler gcc-4.9 $(HEADER) -fxml=$(XML)
endif

