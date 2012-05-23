class ZMQ_PUSH_SOCKET
	--            A socket of type ZMQ_PUSH is used by a pipeline node to send messages to downstream pipeline nodes. Messages are load-balanced to all
	--            connected downstream nodes. The zmq_recv() function is not implemented for this socket type.
	-- 
	--            When a ZMQ_PUSH socket enters an exceptional state due to having reached the high water mark for all downstream nodes, or if there are no
	--            downstream nodes at all, then any zmq_send(3) operations on the socket shall block until the exceptional state ends or at least one downstream
	--            node becomes available for sending; messages are not discarded.
	-- 
	--            Deprecated alias: ZMQ_DOWNSTREAM.
	-- 
	--            Table 7. Summary of ZMQ_PUSH characteristics
	--            Compatible peer sockets     ZMQ_PULL
	-- 
	--            Direction                   Unidirectional
	-- 
	--            Send/receive pattern        Send only
	-- 
	--            Incoming routing strategy   N/A
	-- 
	--            Outgoing routing strategy   Load-balanced
	-- 
	--            ZMQ_HWM option action       Block
	-- 

inherit ZMQ_SENDING_SOCKET 
creation {ZMQ_CONTEXT} from_external_pointer
	-- invariant type=zmq_pub
end -- class ZMQ_PUSH_SOCKET
