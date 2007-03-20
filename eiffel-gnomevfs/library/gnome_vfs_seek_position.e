indexing
	description: "enum GnomeVFSSeekPosition "
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, GnomeVFS team
					
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

deferred class GNOME_VFS_SEEK_POSITION
	-- Specify the start position for seek operations.

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_seek_position (a_position: INTEGER): BOOLEAN is
		do	
			Result:=((a_position = gnome_vfs_seek_start) or else
						(a_position = gnome_vfs_seek_current) or else
						(a_position = gnome_vfs_seek_end))
		end
	
	gnome_vfs_seek_start: INTEGER is
		-- Start of the file.
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_SEEK_START"
		end

	gnome_vfs_seek_current: INTEGER is
		-- Current position.
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_SEEK_CURRENT"
		end

	gnome_vfs_seek_end: INTEGER is
		-- End of the file.
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_SEEK_END"
		end
end
