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

deferred class SEPARATE
	-- A SEPARATE object runs in its own process and communicate with its
	-- creator using a MESSAGE_PORT.

	-- Implementation details is deliberately left to its heirs, like
	-- FORKED, SOCKET_SEPARATE and so on.

inherit ANY redefine default_create end

feature {ANY} -- Creation
	main is
		deferred
		end

end -- class SEPARATE

