class ZMQ_CONTEXT
	-- An ØMQ Context where ØMQ sockets live within.
	
	-- Each ØMQ socket  lives  within  a  specific  context.  Creating  and
	-- destroying context is a counterpart of library
	-- initialisation/deinitialisation as used elsewhere. Ability to create
	-- multiple  contexts saves  the  day  when an application happens to
	-- link (indirectly and involuntarily) with several instances of 0MQ.

	-- Implementation notes: the fact that ØMQ can work in a threaded
	-- enviroment is currently hidden by this Liberty wrappers

	-- TODO: add support for pollability (ZMQ_POLL)

inherit 
	WRAPPER redefine default_create end
	EIFFEL_OWNED redefine default_create, dispose end 

insert 
	ZMQ_EXTERNALS undefine default_create end
	ZMQ_SOCKET_TYPES undefine default_create end

create {ANY} default_create
feature {} -- Creation
	default_create
		-- Context creation; currently only non-threaded programs are handled.
	do
		from_external_pointer(zmq_init(1))
	end
feature {} -- Disposing
	dispose
		local res: INTEGER
		do
			res := zmq_term(handle)
			-- TODO: handle return value
		end
feature {ANY} -- Comparison and copying

	-- Since a ZMQ_CONTEXT is entirely opaque object they are not
	-- distinguishable so is_equal is always True. Copying just create another
	-- context.

	is_equal (another: like Current): BOOLEAN
		do
			Result:=True
		end

	copy (another: like Current)
		do
			default_create	
		end

feature {ANY} -- Request-reply pattern

	-- The request-reply pattern is used for sending requests from a client to
	-- one or more instances of a service, and receiving subsequent replies to
	-- each request sent.

	new_req_socket: ZMQ_REQ_SOCKET
		-- A new ZMQ_REQ_SOCKET, that sends requests to and receives replies from a service.
		-- This socket type allows only an alternating sequence of request -
		-- sending a message - and subsequent reply - receiving an answer. Each
		-- request sent is load-balanced among all services, and each reply
		-- received is matched with the last issued request.
	do
		create Result.from_external_pointer (zmq_socket(handle,zmq_req))
	ensure Result/=Void
	end

	new_rep_socket: ZMQ_REP_SOCKET
		-- A new ZMQ_REP socket to receive requests from and send replies to a client. 

		-- It allows only an alternating sequence of request (receive) and 
		-- subsequent reply (send) commands. Each request received
		-- fair-queued from among all clients, and each reply sent is routed to
		-- the client that issued the last request. If the original requester
		-- doesn’t exist any more the reply is silently discarded.
		
			do
		create Result.from_external_pointer(zmq_socket(handle,zmq_rep))
	ensure Result/=Void
	end

--        ZMQ_DEALER
-- 	   A socket of type ZMQ_DEALER is an advanced pattern used for extending request/reply
-- 	   sockets. Each message sent is load-balanced among all connected peers, and each
-- 	   message received is fair-queued from all connected peers.
-- 
-- 	   Previously this socket was called ZMQ_XREQ and that name remains available for
-- 	   backwards compatibility.
-- 
-- 	   When a ZMQ_DEALER socket enters an exceptional state due to having reached the high
-- 	   water mark for all peers, or if there are no peers at all, then any zmq_send(3)
-- 	   operations on the socket shall block until the exceptional state ends or at least one
-- 	   peer becomes available for sending; messages are not discarded.
-- 
-- 	   When a ZMQ_DEALER socket is connected to a ZMQ_REP socket each message sent must
-- 	   consist of an empty message part, the delimiter, followed by one or more body parts.
-- 
-- 	   Table 3. Summary of ZMQ_DEALER characteristics
-- 	   Compatible peer sockets     ZMQ_ROUTER, ZMQ_REQ, ZMQ_REP
-- 
-- 	   Direction		       Bidirectional
-- 
-- 	   Send/receive pattern        Unrestricted
-- 
-- 	   Outgoing routing strategy   Load-balanced
-- 
-- 	   Incoming routing strategy   Fair-queued
-- 
-- 
-- 
-- 	   ZMQ_HWM option action       Block
-- 
-- 
--        ZMQ_ROUTER
	-- 	   A socket of type ZMQ_ROUTER is an advanced pattern used for extending request/reply
-- 	   sockets. When receiving messages a ZMQ_ROUTER socket shall prepend a message part
-- 	   containing the identity of the originating peer to the message before passing it to
-- 	   the application. Messages received are fair-queued from among all connected peers.
-- 	   When sending messages a ZMQ_ROUTER socket shall remove the first part of the message
-- 	   and use it to determine the identity of the peer the message shall be routed to. If
-- 	   the peer does not exist anymore the message shall be silently discarded.
-- 
-- 	   Previously this socket was called ZMQ_XREP and that name remains available for
-- 	   backwards compatibility.
-- 
-- 	   When a ZMQ_ROUTER socket enters an exceptional state due to having reached the high
-- 	   water mark for all peers, or if there are no peers at all, then any messages sent to
-- 	   the socket shall be dropped until the exceptional state ends. Likewise, any messages
-- 	   routed to a non-existent peer or a peer for which the individual high water mark has
-- 	   been reached shall also be dropped.
-- 
-- 	   When a ZMQ_REQ socket is connected to a ZMQ_ROUTER socket, in addition to the identity
-- 	   of the originating peer each message received shall contain an empty delimiter message
-- 	   part. Hence, the entire structure of each received message as seen by the application
-- 	   becomes: one or more identity parts, delimiter part, one or more body parts. When
-- 	   sending replies to a ZMQ_REQ socket the application must include the delimiter part.
-- 
-- 	   Table 4. Summary of ZMQ_ROUTER characteristics
-- 	   Compatible peer sockets     ZMQ_DEALER, ZMQ_REQ, ZMQ_REP
-- 
-- 	   Direction		       Bidirectional
-- 
-- 	   Send/receive pattern        Unrestricted
-- 
-- 	   Outgoing routing strategy   See text
-- 
-- 	   Incoming routing strategy   Fair-queued
-- 
-- 	   ZMQ_HWM option action       Drop
-- 
-- 
feature {ANY} -- Publish-subscribe pattern

	-- The publish-subscribe pattern is used for one-to-many distribution of
	-- data from a single publisher to multiple subscribers in a fan out
	-- fashion.

	new_pub_socket: ZMQ_PUB_SOCKET
		-- A new ZMQ_PUB_SOCKET, used by a publisher to distribute data.
		-- Messages sent are distributed in a fan out fashion to all connected
		-- peers. 

		-- When a ZMQ_PUB_SOCKET enters an exceptional state due to having
		-- reached the high water mark for a subscriber, then any messages that
		-- would be sent to the subscriber in question shall instead be dropped
		-- until the exceptional state ends. The `send' command shall never
		-- block for this socket type.
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_pub))
	ensure Result/=Void
	end


	new_sub_socket: ZMQ_SUB_SOCKET
		-- A new ZMQ_SUB_SOCKET used by a subscriber to subscribe to data
		-- distributed by a publisher.  Initially this socket is not subscribed
		-- to any messages, use `subscribe_to' or `subscribe_to_all' to specify
		-- which messages to subscribe to. This is a receiving only socket.
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_sub))
	ensure Result/=Void
	end


feature {ANY} --    Pipeline pattern
	
	-- The pipeline pattern is used for distributing data to nodes arranged in
	-- a pipeline. Data always flows down the pipeline, and each stage of the
	-- pipeline is connected to at least one node. When a pipeline stage
	-- connected to multiple nodes data is load-balanced among all connected
	-- nodes.

	new_push_socket: ZMQ_PUSH_SOCKET
		-- A new socket used in a pipeline node to send messages to downstream
		-- pipeline nodes. Messages are load-balanced to all connected
		-- downstream nodes. 
		
		-- When a ZMQ_PUSH_SOCKET enters an exceptional state due to having
		-- reached the high water mark for all downstream nodes, or if there
		-- are no downstream nodes at all, then any send operations on the
		-- socket shall block until the exceptional state ends or at least one
		-- downstream node becomes available for sending; messages are not
		-- discarded.
		 
		--   Summary of ZMQ_PUSH characteristics
		--   Compatible peer sockets     ZMQ_PULL
		--
		--   Direction		       Unidirectional
		--
		--   Send/receive pattern        Send only
		--
		--   Incoming routing strategy   N/A
		--
		--   Outgoing routing strategy   Load-balanced
		--
		--   ZMQ_HWM option action       Block
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_push))
	ensure Result/=Void
	end

	new_pull_socket: ZMQ_PULL_SOCKET
		--
		--        ZMQ_PULL
		-- 	   A socket of type ZMQ_PULL is used by a pipeline node to receive messages from upstream
		-- 	   pipeline nodes. Messages are fair-queued from among all connected upstream nodes. The
		-- 	   zmq_send() function is not implemented for this socket type.
		-- 
		-- 	   Deprecated alias: ZMQ_UPSTREAM.
		-- 
		-- 	   Table 8. Summary of ZMQ_PULL characteristics
		-- 	   Compatible peer sockets     ZMQ_PUSH
		-- 
		-- 	   Direction		       Unidirectional
		-- 
		-- 	   Send/receive pattern        Receive only
		-- 
		-- 	   Incoming routing strategy   Fair-queued
		-- 
		-- 	   Outgoing routing strategy   N/A
		-- 
		-- 	   ZMQ_HWM option action       N/A
		-- 
		-- 
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_pull))
	ensure Result/=Void
	end


feature {ANY} -- Exclusive pair pattern

--        The exclusive pair pattern is used to connect a peer to precisely one other peer. This
--        pattern is used for inter-thread communication across the inproc transport.
-- 
--        ZMQ_PAIR
-- 	   A socket of type ZMQ_PAIR can only be connected to a single peer at any one time. No
-- 	   message routing or filtering is performed on messages sent over a ZMQ_PAIR socket.
-- 
-- 	   When a ZMQ_PAIR socket enters an exceptional state due to having reached the high
-- 	   water mark for the connected peer, or if no peer is connected, then any zmq_send(3)
-- 	   operations on the socket shall block until the peer becomes available for sending;
-- 	   messages are not discarded.
-- 
-- 	       Note
-- 	       ZMQ_PAIR sockets are designed for inter-thread communication across the
-- 	       zmq_inproc(7) transport and do not implement functionality such as
-- 	       auto-reconnection. ZMQ_PAIR sockets are considered experimental and may have other
-- 	       missing or broken aspects.
-- 
-- 	   Table 9. Summary of ZMQ_PAIR characteristics
-- 	   Compatible peer sockets     ZMQ_PAIR
-- 
-- 	   Direction		       Bidirectional
-- 
-- 	   Send/receive pattern        Unrestricted
-- 
-- 	   Incoming routing strategy   N/A
-- 
-- 	   Outgoing routing strategy   N/A
-- 
-- 	   ZMQ_HWM option action       Block


end -- class ZMQ_CONTEXT

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010-2016: Paolo Redaelli 

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

