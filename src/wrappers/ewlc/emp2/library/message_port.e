note
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class MESSAGE_PORT

feature {ANY} -- Sending message
	queue (a_message: MESSAGE)
		-- Put `a_message' into the message port queue to be sent later.  See
		-- `send'.
	require message_not_void: a_message/=Void
	deferred
	-- ensure a_message.locked
	end

	send
		-- Send the enqueued messages thorught the port.
		deferred
		end
end -- class MESSAGE_PORT
