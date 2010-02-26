/* Support functions for ØMQ Liberty wrappers */

#include <zmq.h>
#include <stdlib.h>

void liberty_zmq_msg_free (void *data, void *hint) 
{
	free (data);
}
