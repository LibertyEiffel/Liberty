class ZMQ_PULL_SOCKET

--        ZMQ_PULL
--            A socket of type ZMQ_PULL is used by a pipeline node to receive messages from upstream pipeline nodes. Messages are fair-queued from among all
--            connected upstream nodes. The zmq_send() function is not implemented for this socket type.
-- 
--            Deprecated alias: ZMQ_UPSTREAM.
-- 
--            Table 8. Summary of ZMQ_PULL characteristics
--            Compatible peer sockets     ZMQ_PUSH
-- 
--            Direction                   Unidirectional
-- 
--            Send/receive pattern        Receive only
-- 
--            Incoming routing strategy   Fair-queued
-- 
--            Outgoing routing strategy   N/A
-- 
--            ZMQ_HWM option action       N/A
-- 
inherit 
	ZMQ_RECEIVING_SOCKET
creation {ZMQ_CONTEXT} from_external_pointer
-- invariant type=zmq_req
end

