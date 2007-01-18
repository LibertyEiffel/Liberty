indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

eferred class GNOME_VFS_OPEN_MODE
	-- Mode in which files are opened. If `gnome_vfs_open_random' is not
	-- used, the file will be have to be accessed sequentially.

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_open_mode (a_mode: INTEGER): BOOLEAN is
		do	
			Result:=(a_mode & (gnome_vfs_open_none |
									 gnome_vfs_open_read |
									 gnome_vfs_open_write |
									 gnome_vfs_open_random |
									 gnome_vfs_open_truncat)).to_boolean
		end

	gnome_vfs_open_none: INTEGER is
			-- GNOME_VFS_OPEN_NONE = 0,
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OPEN_NONE"
		end

	gnome_vfs_open_read: INTEGER is
			-- GNOME_VFS_OPEN_READ = 1 < < 0,
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OPEN_READ"
		end

	gnome_vfs_open_write: INTEGER is
			-- GNOME_VFS_OPEN_WRITE = 1 < < 1,
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OPEN_WRITE"
		end

	gnome_vfs_open_random: INTEGER is
			-- GNOME_VFS_OPEN_RANDOM = 1 < < 2,
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OPEN_RANDOM"
		end

	gnome_vfs_open_truncate: INTEGER is
			-- GNOME_VFS_OPEN_TRUNCATE = 1 < < 3
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OPEN_TRUNCATE"
		end
end
