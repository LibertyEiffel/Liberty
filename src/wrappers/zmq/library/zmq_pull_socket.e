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
create {ZMQ_CONTEXT} from_external_pointer
invariant -- type=zmq_req
end -- class ZMQ_PULL_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2018: Paolo Redaelli, 2013 Cyril Adrian

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

