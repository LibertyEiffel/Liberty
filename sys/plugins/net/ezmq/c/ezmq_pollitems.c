#include "eiffel_zmq.h"

void *pollitem_new(int a_capacity) {
   zmq_pollitem_t **items = malloc(sizeof(zmq_pollitem_t*));
   if (items == NULL) return NULL;
   *items = malloc(a_capacity * sizeof(zmq_pollitem_t));
   if (*items == NULL) {
      free(items);
      return NULL;
   }
   memset(*items, 0, a_capacity * sizeof(zmq_pollitem_t));
   return items;
}

int pollitem_grow(void *a_items, int a_capacity) {
   zmq_pollitem_t **items = (zmq_pollitem_t **)a_items;
   zmq_pollitem_t *i;
   int new_capacity = a_capacity * 2;
   i = realloc(*items, new_capacity * sizeof(zmq_pollitem_t));
   if (i == NULL) return a_capacity;
   memset(i + a_capacity, 0, a_capacity * sizeof(zmq_pollitem_t));
   *items = i;
   return new_capacity;
}

void *pollitem_find(void *a_items, int a_count, void *socket) {
   zmq_pollitem_t *items = *(zmq_pollitem_t **)a_items;
   int i;
   for (i = 0; i < a_count; i++) {
      if (items[i].socket == socket) return items + i;
   }
   return NULL;
}

void *pollitem_add(void *a_items, int a_count, void *socket) {
   zmq_pollitem_t *item = ((zmq_pollitem_t **)a_items)[a_count];
   item->socket = socket;
   item->events = item->revents = 0;
   return item;
}

void pollitem_event(void *pollitem, int event) {
   zmq_pollitem_t *item = pollitem;
   item->events |= event;
}

int pollitem_check(void *a_items, int a_count, void *socket, int event) {
   zmq_pollitem_t *items = *(zmq_pollitem_t **)a_items;
   int i;
   for (i = 0; i < a_count; i++) {
      if (items[i].socket == socket) {
         return items[i].revents & event;
      }
   }
   return 0;
}

static int pollitem_on_input(void *socket, void *ehub, void *data) {
   zmq_msg_t msg;
   int r, n;
   char *message;

   r = zmq_msg_init(&msg);
   if (r==-1) return zmq_errno();

   n = zmq_msg_recv(&msg, socket, 0);
   if (n==-1) return zmq_errno();

   message = malloc(n + 1);
   if (!message) return ENOMEM;
   memcpy(message, zmq_msg_data(&msg), n);

   r = zmq_msg_close(&msg);
   if (r==-1) return zmq_errno();

   ehub_on_input(ehub, socket, message, data);
   free(message);
}

static int pollitem_on_output(void *socket, void *ehub, void *data) {
   int r;
   char *message = ehub_on_output(ehub, socket, data);

   r = zmq_send(socket, message, strlen(message), 0);
   if (r==-1) return zmq_errno();

   return 0;
}

static void pollitem_on_timeout(void *ehub, void *data) {
   ehub_on_timeout(ehub, data);
}

int pollitem_poll(void *a_items, int a_count, int64_t tmout, void *ehub, void *data) {
   zmq_pollitem_t *items = *(zmq_pollitem_t **)a_items;
   int i, n = 0;
   int r = zmq_poll(items, a_count, (long)tmout);
   if (r==-1) return zmq_errno();

   for (i = 0; i < a_count; i++) {
      if (items[i].revents & ZMQ_POLLIN) {
         r = pollitem_on_input(items[i].socket, ehub, data);
         if (r) return r;
         n++;
      }
      if (items[i].revents & ZMQ_POLLOUT) {
         r = pollitem_on_output(items[i].socket, ehub, data);
         if (r) return r;
         n++;
      }
   }

   if (n == 0) {
      pollitem_on_timeout(ehub, data);
   }

   return 0;
}
