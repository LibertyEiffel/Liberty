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
create {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_pub
end -- class ZMQ_PUSH_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2022: Paolo Redaelli, 2013 Cyril Adrian

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

