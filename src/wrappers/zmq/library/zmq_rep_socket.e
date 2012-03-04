class ZMQ_REP_SOCKET
inherit 
	ZMQ_RECEIVING_SOCKET
	ZMQ_SENDING_SOCKET
creation {ZMQ_CONTEXT} from_external_pointer
-- invariant type=zmq_req
end

