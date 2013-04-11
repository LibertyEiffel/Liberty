class ZMQ_REP_SOCKET
        -- A ZMQ_REP socket that receives requests from and send replies to a client.

        -- It allows only an alternating sequence of request (receive) and and
        -- subsequent reply (send) commands. Each request received is
        -- fair-queued from among all clients, and each reply sent is routed to
        -- the client that issued the last request. If the original requester
        -- doesn’t exist any more the reply is silently discarded.

        -- When a ZMQ_REP socket enters an exceptional state due to having
        -- reached the high water mark for a client, then any replies sent to
        -- the client in question shall be dropped until the exceptional state
        -- ends.

        -- Summary of ZMQ_REP characteristics
        -- - Compatible peer sockets     ZMQ_REQ
        --
        -- - Direction                 Bidirectional
        --
        -- - Send/receive pattern        Receive, Send, Receive, Send,
        --                                     ...
        --
        -- - Incoming routing strategy   Fair-queued
        --
        -- - Outgoing routing strategy   Last peer
        --
        --      - ZMQ_HWM option action       Drop
inherit
        ZMQ_RECEIVING_SOCKET
        ZMQ_SENDING_SOCKET
creation {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_req
end -- class ZMQ_REP_SOCKET
