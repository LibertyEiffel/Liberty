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

class GNOME_VFS_BINARY_FILE_WRITE

inherit
	GNOME_VFS_FILE
	BINARY_FILE_WRITE
		redefine
			flush, write_buffer,
			disconnect,
			connect_to
		end
insert
	EXCEPTIONS
	
creation make, connect_to, with_buffer_size, from_external_pointer

feature 
	disconnect is
		do
			close
			path:=Void
		end
	
	connect_to (a_path: STRING) is
		local last_error: STRING
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
				last_error:=string_from(last_result)
				debug
					print ("GNOME_VFS_BINARY_FILE_WRITE: unhandled GnomeVFS error: `")
					print (last_error) print ("'.%N")
				end
				raise(last_error)
			end
		end
		
		flush is
			-- forces a write of unwritten character (write my have been
			-- delayed, flush writes buffered characters)
		do
			if buffer_position > 0 then
				write_buffer
			end
			io_flush(output_stream)
		end

	write_buffer is
		do
			if buffer_position > 0 then
				last_result := gnome_vfs_write(handle, buffer.to_pointer, capacity, $buffer_size)
				buffer_position := 0
				inspect last_result
				when gnome_vfs_ok then        end_of_input:=False; buffer_position:=0
				when gnome_vfs_error_eof then end_of_input:=True -- buffer_position:=1; buffer_size := 1
				else
					debug
						print ("GNOME_VFS_BINARY_FILE_WRITE: unhandled GnomeVFS error: ")
						print (string_from(last_result) print ("%N")
					end
				end
			end
			buffer_position := 0
		end

end -- class GNOME_VFS_BINARY_FILE_WRITE
