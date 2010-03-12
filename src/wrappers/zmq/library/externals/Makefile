## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
export GCCXML_COMPILER = gcc-4.2

wrappers: zmq.gcc-xml
	wrappers-generator --local --directory . zmq.gcc-xml /usr/local/include/zmq.h

zmq.gcc-xml: 
	pkg-config --exists libzmq
	gccxml `pkg-config --cflags libzmq` plugin/c/zmq_liberty.h -fxml=zmq.gcc-xml



