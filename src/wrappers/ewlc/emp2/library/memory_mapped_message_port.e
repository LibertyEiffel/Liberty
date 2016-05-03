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

class MEMORY_MAPPED_MESSAGE_PORT
	-- A MESSAGE_PORT that is shared between processes using anonymous memory
	-- mapped region.

inherit 
	LOCAL_MESSAGE_PORT
		redefine 
			default_create
		end

insert 
	MMAP_EXTERNALS
	MMAP_FLAGS
	MMAP_PROTECTION
	ERRNO

create {ANY} default_create, make

feature	{} -- Creation
	defualt_create is
		do
			size := default_size
			allocate
		end

	make (a_size: INTEGER) is
		do
			size := a_size
			allocate
		end

	allocate is
		do
			start := mmap
			(default_pointer, length, prot_read|prot_write,
			map_anonymous, 0,0)
		end	

end -- class MEMORY_MAPPED_MESSAGE_PORT
