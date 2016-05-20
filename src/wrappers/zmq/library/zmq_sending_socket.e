deferred class ZMQ_SENDING_SOCKET
	-- A ØMQ socket that sends messages

inherit 
	ZMQ_SOCKET

feature {ANY} -- Sending
	
	post (a_message: ZMQ_MESSAGE)
		-- Enqueue `a_message' to be sent by Current socket. This command
		-- non-blocking as all Eiffel commands are in a concurrent enviroment.
		-- Processing will flow to the next commands and queris without waiting for
		-- the command to finish. If you need a syncronous, blocking behaviour
		-- please use the `has_sent' query.

		-- Note: `a_message' is destroyed (nullified) by this command. If you
		-- want to send the same message to multiple sockets you have to copy
		-- it (with twin or copy).

		-- Note: A successful invocation does not indicate that the message has
		-- been transmitted to the network, only that it has been queued on the
		-- socket and 0MQ has assumed responsibility for the message.

		-- `is_successful' and `errno' are updated. Possible errno values:
		
		-- * eagain: Non-blocking mode was requested and the message cannot be sent at the moment.

		-- * enotsup: the send operation is not supported by this socket type.

		-- * efsm: send operation cannot be performed on this socket at the
		-- moment due to the socket not being in the appropriate state. This
		-- error may occur with socket types that switch between several
		-- states, such as ZMQ_REP. See the messaging patterns section of
		-- ZMQ_SOCKET for more information.
		
		-- * eterm: The 0MQ context associated with the specified socket was terminated.

		-- * enotsock: The provided socket was invalid.

		-- * eintr: The operation was interrupted by delivery of a signal before the message was sent.

		-- * efault: Invalid message.

		-- This class does not offer an analogue of this command that blocks
		-- the control flow until `a_message' has been queued or an error
		-- occurred. In fact, in order to adhere to command-query-separation
		-- principle "a query shall never change the state of the system" so an
		-- eventual "is_sent(a_message: ZMQ_MESSAGE): BOOLEAN' could not change
		-- `a_message' yet since the underlying implementation (C) will nullify
		-- the given message given a copy would be required. This requirement
		-- coupled with the zero-copy architecture requirement that
		-- significately concour to the efficiency of ZMQ means that an Eiffel
		-- wrapper shall not offer such a query.
	require a_message/=Void
	do
		is_successful := zmq_send(handle,a_message.handle,zmq_noblock)=0
	end

	send (a_message: ZMQ_MESSAGE)
		-- Enqueue `a_message' to be sent by Current socket. This command
		-- blocks the control flow until finished. If you need a asyncronous,
		-- non-blocking behaviour please use the `post' command.

		-- Note: `a_message' is destroyed (nullified) by this command. If you
		-- want to send the same message to multiple sockets you have to copy
		-- it (with twin or copy).

		-- Note: A successful invocation does not indicate that the message has
		-- been transmitted to the network, only that it has been queued on the
		-- socket and 0MQ has assumed responsibility for the message.

		-- `is_successful' and `errno' are updated. Possible errno values:
		
		-- * eagain: Non-blocking mode was requested and the message cannot be sent at the moment.

		-- * enotsup: the send operation is not supported by this socket type.

		-- * efsm: send operation cannot be performed on this socket at the
		-- moment due to the socket not being in the appropriate state. This
		-- error may occur with socket types that switch between several
		-- states, such as ZMQ_REP. See the messaging patterns section of
		-- ZMQ_SOCKET for more information.
		
		-- * eterm: The 0MQ context associated with the specified socket was terminated.

		-- * enotsock: The provided socket was invalid.

		-- * eintr: The operation was interrupted by delivery of a signal before the message was sent.

		-- * efault: Invalid message.
	require a_message/=Void
	do
		is_successful := zmq_send(handle,a_message.handle,0)=0
	end

-- TODO: support sending Multi-part messages
--        A 0MQ message is composed of 1 or more message parts; each message part is an independent
--        zmq_msg_t in its own right. 0MQ ensures atomic delivery of messages; peers shall receive
--        either all message parts of a message or none at all.
-- 
--        The total number of message parts is unlimited.
-- 
--        An application wishing to send a multi-part message does so by specifying the ZMQ_SNDMORE
--        flag to zmq_send(). The presence of this flag indicates to 0MQ that the message being sent
--        is a multi-part message and that more message parts are to follow. When the application
--        wishes to send the final message part it does so by calling zmq_send() without the
--        ZMQ_SNDMORE flag; this indicates that no more message parts are to follow.
 
end -- class ZMQ_SENDING_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2016: Paolo Redaelli 

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

