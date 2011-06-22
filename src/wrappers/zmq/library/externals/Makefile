XML=zmq.gcc-xml
HEADER=plugin/c/zmq_liberty.h

wrappers: $(XML)
	wrappers-generator --local  $(XML) `pkg-config --cflags-only-I libzmq| cut -c 3- |tr --delete  '[:space:]' `/zmq.h 
	## Pick the included directories from the compilation flags, hoping
	## that only one is given, cut from the third character, skipping the '-I'
	## remove all space characters then add /zmq.h 

$(XML): 
	pkg-config --exists libzmq
	gccxml `pkg-config --cflags libzmq` $(HEADER) -fxml=$(XML)



