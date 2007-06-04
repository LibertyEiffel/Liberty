indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

deferred class GNOME_VFS_VOLUME_TYPE

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_volume_type (a_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gnome_vfs_volume_type_mountpoint) or else
						(a_type = gnome_vfs_volume_type_vfs_mount) or else
						(a_type = gnome_vfs_volume_type_connected_server))
		end
	
	gnome_vfs_volume_type_mountpoint: INTEGER is
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_VOLUME_TYPE_MOUNTPOINT"
		end

	gnome_vfs_volume_type_vfs_mount: INTEGER is
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_VOLUME_TYPE_VFS_MOUNT"
		end

	gnome_vfs_volume_type_connected_server: INTEGER is
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_VOLUME_TYPE_CONNECTED_SERVER"
		end

end
