#include <errno.h>
#include <zmq.h>

void *pollitem_new(int a_capacity);
int   pollitem_grow(void *items, int capacity);
void *pollitem_find(void *a_items, int a_count, void *socket);
void *pollitem_add(void *a_items, int a_count, void *socket);
void  pollitem_event(void *pollitem, int event);
int   pollitem_check(void *a_items, int a_count, void *socket, int event);
int   pollitem_poll(void *a_items, int a_count, int64_t tmout, void *ehub, void *data);

int ezmq_socket_fd(void *socket);
int ezmq_socket_events(void *socket);

#if ZMQ_VERSION_MAJOR < 4
#define ZMQ_STREAM -1
#endif
