#include "eiffel_zmq.h"

int ezmq_socket_fd(void *socket) {
   int res;
   size_t len;
   zmq_getsockopt(socket, ZMQ_FD, &res, &len);
   return res;
}

int ezmq_socket_events(void *socket) {
   int res;
   size_t len;
   zmq_getsockopt(socket, ZMQ_EVENTS, &res, &len);
   return res;
}
