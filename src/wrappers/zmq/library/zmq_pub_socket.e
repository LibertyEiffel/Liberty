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
        --         Direction                   Unidirectional
        --
        --         Send/receive pattern        Send only
        --
        --         Incoming routing strategy   N/A
        --
        --
        --
        --         Outgoing routing strategy   Fan out
        --
        --         ZMQ_HWM option action       Drop
        --
inherit ZMQ_SENDING_SOCKET create {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_pub
end  -- class ZMQ_PUB_SOCKET

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

