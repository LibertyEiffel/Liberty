class ZMQ_PUB_SOCKET
	-- A socket of type ZMQ_PUB is used by a publisher to distribute data.
	-- Messages sent are distributed in a fan out fashion to all connected
	-- peers. 

	-- When a ZMQ_PUB socket enters an exceptional state due to having reached
	-- the high water mark for a subscriber, then any messages that would be
	-- sent to the subscriber in question shall instead be dropped until the
	-- exceptional state ends. The zmq_send() function shall never block for
	-- this socket type.
	 
	-- Table 5. Summary of ZMQ_PUB characteristics Compatible peer sockets
	-- ZMQ_SUB
	-- 
	-- 	   Direction		       Unidirectional
	-- 
	-- 	   Send/receive pattern        Send only
	-- 
	-- 	   Incoming routing strategy   N/A
	-- 
	-- 
	-- 
	-- 	   Outgoing routing strategy   Fan out
	-- 
	-- 	   ZMQ_HWM option action       Drop
	-- 
inherit ZMQ_SENDING_SOCKET creation {ZMQ_CONTEXT} from_external_pointer
	-- invariant type=zmq_pub
end  -- class ZMQ_PUB_SOCKET
