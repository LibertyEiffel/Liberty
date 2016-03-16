XML=posix.xml
HEADER=liberty-posix.h
HEADERS=/usr/include/fcntl.h \
	/usr/include/sys/mman.h \
	/usr/include/unistd.h 
CASTXML:=$(shell command -v castxml 2>/dev/null)

wrappers: $(XML)
	@wrappers_generator --local $(XML) $(HEADERS)

$(XML): $(HEADER)
ifdef CASTXML
	@castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)
else
	@gccxml --gccxml-compiler gcc-4.9 $(HEADER) -fxml=$(XML)
endif

## Ideally here we should make wrappers for include files not already wrapped in common wrapper cluster using a command like
## (gcc -M ../../../common/library/externals/plugin/c/standard-c-lib.h; gcc -M plugin/c/liberty-posix.h)|sort |uniq --repeated 
## i.e. print the dependecies of standard-c-lib.g and liberty-posix.h, sort
## them and leave only the lines that are not repeated. Too bad gcc insist putting
## more than one file on each line and using make syntax.... 

