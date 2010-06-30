class ZMQ_SOCKET
	-- A ØMQ socket

inherit 
	C_STRUCT
	EIFFEL_OWNED
		redefine 
			dispose
		end

insert
	ZMQ_EXTERNALS
	ERRNO
	EXCEPTIONS undefine copy, is_equal end

creation {ZMQ_CONTEXT} from_external_pointer

feature {} -- Disposing
	dispose is
		local res: INTEGER
		do
			res := zmq_close(handle)	
			-- TODO: handle return value
		end

feature {ANY} -- Binding
	bind (an_address: ABSTRACT_STRING) is 
		-- Bind Current socket to a particular transport.
	require an_address/=Void
	local res: INTEGER_32
	do
		res := zmq_bind(handle,an_address.to_external)
		if res/=0 then 
			raise(create {STRING}.from_external_copy(zmq_strerror(errno)))
		end
	end

	connect (an_address: ABSTRACT_STRING) is
		-- Connect Current socket to the peer identified by `an_address'.  Actual
		-- semantics of the  command depend on the underlying transport mechanism,
		-- however, in cases where peers connect in an asymetric manner, `bind'
		-- should be called first, `connect' afterwards. Formats of `an_address' is
		-- defined by individual transports. For a list of supported transports
		-- have a look at zmq(7) manual page.

		-- Note that single socket can be connected (and bound) to arbitrary number of peers using different transport mechanisms.
	require an_address/=Void
	local rc: INTEGER_32
	do
		rc:=zmq_connect(handle,an_address.to_external)
		check
			-- TODO: proper error handling
			rc=0
		end
	end
	
	flush is
		-- Flushes pre-sent messages to Current sockect i.e. those that have
		-- been sent with ZMQ_NOFLUSH flag - to the socket. This functionality
		-- improves performance in cases  where  several  messages are sent
		-- during a single business operation.  It should not be used as a
		-- transaction - ACID properties are not guaranteed.  Note  that
		-- calling  zmq_send without ZMQ_NOFLUSH flag automatically flushes all
		-- previously pre-sent messages.
	local res: INTEGER_32
	do
		res:=zmq_flush(handle)
		if res/=0 then
			raise(create {STRING}.from_external_copy(zmq_strerror(errno)))
		end
	end
feature {ANY} -- Receiving messages
	last_message: ZMQ_MESSAGE is
		-- Last received message
		attribute
		end

	receive (a_message: ZMQ_MESSAGE) is
		-- Receive a message from Current socket; it will be available as
		-- `last_message'. Program blocks until a message is received; see also
		-- `receive_now'. `is_successful' and `errno' (from ERRNO) are updated.
	do
		is_successful:= zmq_recv(handle,last_message.handle,0).to_boolean
	end

	receive_now (a_message: ZMQ_MESSAGE) is
		-- Receive `a_message' from Current socket; any previous content of
		-- `a_message' will be properly deallocated. If it cannot be processed
		-- immediately, `is_successful' will be False and `errno' is set to
		-- eagain (TODO: provide access to Posix errors).

		-- TODO: perhaps non_blocking_receive is a better name?
	do
		is_successful:=zmq_recv(handle,a_message.handle,zmq_noblock).to_boolean
	end

feature {ANY} -- Sending
	send (a_message: ZMQ_MESSAGE) is
		-- Queue `a_message' to be sent to the Current socket. See also
		-- `send_now', a non-blocking version of this command.

		-- `is_successful' and `errno' are updated.
		
		-- Note: A successful invocation of does not indicate that the message
		-- has been transmitted to the network, only that it has been queued on
		-- the message queue associated with the socket and 0MQ has assumed
		-- responsibility for the message.
	
		-- When the socket does not support send `errno' will be set to `enotsup'.

		-- When the socket cannot send the message because it is not in the
		-- appropriate state `errno' will be set to `efsm.' This error may
		-- occur with socket types that switch between several states, such as
		-- ZMQ_REP.  See the messaging patterns section of ZMQ_SOCKET_TYPES for
		-- more information.

	require a_message/=Void
	do
		is_successful:=zmq_send(handle,a_message.handle,0).to_boolean
	end

feature -- Status
	is_successful: BOOLEAN 
	-- Was last command successful?

feature {} -- Constants
	zmq_noblock: INTEGER_32 is 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_NOBLOCK"
		}"
		end

end -- class ZMQ_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010 Paolo Redaelli 

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

