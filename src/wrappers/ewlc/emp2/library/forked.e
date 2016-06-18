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

class FORKED
	-- A SEPARATED object implemented using POSIX fork.

	-- This is easily done. Yet the address space of the child process, running
	-- the FORKED object is "polluted" by a copy of the working set of the
	-- father process at the momento of fork(). TODO: explain this better, even
	-- with an example.

inherit
	SEPARATED 
		redefine 
			default_create 
		end

feature {} -- Creation
	default_create
		do
			create port
			child_pid:=fork
			if is_child then 
				debug 
					print ("I'm a child%N")
				end 
				main 
			else
				debug
					print("I forked a child%N")
				end
			end
		end

	main
		-- Wait for messages to arrive on `port' and process
	port: MEMORY_MAPPED_MESSAGE_PORT

feature {} -- Implementation
	is_child: BOOLEAN
		do
			Result := (child_pid=0)
		end	

end -- class FORKED
