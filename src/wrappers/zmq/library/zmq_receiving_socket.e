deferred class ZMQ_RECEIVING_SOCKET
	-- A ØMQ socket that receives messages.

inherit 
	ZMQ_SOCKET

feature {ANY} -- Receiving messages
	receive (a_message: ZMQ_MESSAGE)
		-- Receive an eventual incoming message from Current socket, putting it
		-- into `a_message'; this command does not block. 
		-- `is_successful' and `errno' are updated.		

		-- After this command when `is_successful' is True `a_message' will
		-- contain the received message; otherwise `errno' (from ERRNO) will be
		-- eagain.

	require a_message/=Void
	do
		is_successful:= zmq_recv(handle,a_message.handle,zmq_noblock)=0
		a_message.update
	--ensure 
	--	not is_successful implies a_message.is_equal(old a_message) and errno=eagain
	--	is_successful or errno=eagain
	end

	wait_for (a_message: ZMQ_MESSAGE)
		-- Wait until an incoming message in received by Current socket, putting it
		-- into `a_message'; this command blocks until `a_message' is received. 
		-- `is_successful' and `errno' are updated.	

		-- After this command when `is_successful' is True `a_message' will
		-- contain the received message; otherwise `errno' (from ERRNO) will be
		-- eagain.

		-- Possible errors
		
		-- * eagain: Non-blocking mode was requested and no messages are available at the moment.

		-- * enotsup: The receive operation is not supported by this socket type.

		-- * efsm: the receive operation cannot be performed on this socket at the moment due to the socket not being in the appropriate state. This error may occur with socket types that switch between several states, such as ZMQ_REP_SOCKET. See the messaging patterns section of 
		-- 	   zmq_socket(3) for more information.
		-- 
		--        ETERM
		-- 	   The 0MQ context associated with the specified socket was terminated.
		-- 
		--        ENOTSOCK
		-- 	   The provided socket was invalid.
		-- 
		--        EINTR
		-- 	   The operation was interrupted by delivery of a signal before a message was available.
		-- 
		--        EFAULT
		-- 	   The message passed to the function was invalid.

	require a_message/=Void
	do
		is_successful:=zmq_recv(handle,a_message.handle,0)=0
		a_message.update
		-- Possible postconditions 
		-- not is_successful implies a_message.is_equal(old a_message) and errno=eagain
		-- is_successful or errno=eagain
	end

-- Multi-part messages
-- A 0MQ message is composed of 1 or more message parts; each message part is an independent
-- zmq_msg_t in its own right. 0MQ ensures atomic delivery of messages; peers shall receive
-- either all message parts of a message or none at all.
--
-- The total number of message parts is unlimited.
--
-- An application wishing to determine if a message is composed of multiple parts does so by
-- retrieving the value of the ZMQ_RCVMORE socket option on the socket it is receiving the
-- message from. If there are no message parts to follow, or if the message is not composed
-- of multiple parts, ZMQ_RCVMORE shall report a value of zero. Otherwise, ZMQ_RCVMORE shall
-- report a value of 1, indicating that more message parts are to follow.

end -- class ZMQ_RECEIVING_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2017: Paolo Redaelli 

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

