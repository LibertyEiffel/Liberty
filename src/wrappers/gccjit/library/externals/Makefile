XML=gccjit.cast-xml
HEADER=/usr/lib/gcc/x86_64-linux-gnu/5/include/libgccjit.h
HEADERS=/usr/lib/gcc/x86_64-linux-gnu/5/include/libgccjit.h

wrappers: $(XML)
	wrappers_generator --local  $(XML) $(HEADERS)

## Previous versions used
## `pkg-config --cflags-only-I libzlib| cut -c 3- |tr --delete  '[:space:]' `/zmq.h 
## to Pick the included directories from the compilation flags, hoping
## that only one is given, cut from the third character, skipping the '-I'
## remove all space characters then add /zlib.h 

## Since it does not work reliably I now assume that the library is installed in usual places.

$(XML): 
	find -path $(HEADER)
	castxml --castxml-gccxml -x c++  $(HEADER) -o $(XML)




