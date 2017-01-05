class ZMQ_REP_SOCKET
        -- A ZMQ_REP socket that receives requests from and send replies to a client.

        -- It allows only an alternating sequence of request (receive) and and
        -- subsequent reply (send) commands. Each request received
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
create {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_req
end -- class ZMQ_REP_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2017: Paolo Redaelli, 2013 Cyril Adrian 

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

