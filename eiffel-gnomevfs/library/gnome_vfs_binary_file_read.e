indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli.
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GNOME_VFS_BINARY_FILE_READ

inherit
	GNOME_VFS_FILE
	BINARY_FILE_READ
		redefine
			fill_buffer,
			disconnect,
			connect_to
		end

creation dummy, make, connect_to, with_buffer_size, from_external_pointer

feature {} -- Buffering
	fill_buffer is
		do
			last_result := gnome_vfs_read(handle, buffer.to_pointer, capacity, $buffer_size)
			buffer_position := 0
			inspect last_result
			when gnome_vfs_ok then        end_of_input:=False; buffer_position:=0
			when gnome_vfs_error_eof then end_of_input:=True -- buffer_position:=1; buffer_size := 1
			else
				debug
					print ("GNOME_VFS_BINARY_FILE_READ: unhandled GnomeVFS error: ")
					print (string_from(last_result))
					print ("%N")
				end
			end
		end

	disconnect is
		do
			close
			path:=Void
		end
	
	connect_to (a_path: STRING) is
		do
			open (a_path, an_open_mode)
			inspect last_result
			when gnome_vfs_ok then
				path := a_path
				end_of_input := False
				if capacity = 0 then
					buffer := buffer.calloc(4096)
					capacity := 4096
				end
				buffer_position := 0
				buffer_size := 0
			else
				debug
					print ("GNOME_VFS_BINARY_FILE_READ: unhandled GnomeVFS error: ")
					print (string_from(last_result))
					print ("%N")
				end
			end
		end

end -- class GNOME_VFS_BINARY_FILE_READ
