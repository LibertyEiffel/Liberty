class ZMQ_REQ_SOCKET
        -- A socket that sends requests to and receives replies from a service.
        -- This socket type allows only an alternating sequence of request -
        -- sending a message - and subsequent reply - receiving an answer. Each
        -- request sent is load-balanced among all services, and each reply
        -- received is matched with the last issued request.

        -- When a ZMQ_REQ_SOCKET enters an exceptional state due to having reached
        -- the high water mark for all services, or if there are no services at
        -- all, then any send command on the socket shall block until the
        -- exceptional state ends or at least one service becomes available for
        -- sending; messages are not discarded.

        --    Summary of ZMQ_REQ characteristics
        --    Compatible peer sockets     ZMQ_REP

        --    Direction                Bidirectional

        --    Send/receive pattern        Send, Receive, Send, Receive, ...

        --    Outgoing routing strategy   Load-balanced

        --    Incoming routing strategy   Last peer

        --    ZMQ_HWM option action       Block

inherit
        ZMQ_RECEIVING_SOCKET
        ZMQ_SENDING_SOCKET
create {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_req
end -- class ZMQ_REQ_SOCKET
