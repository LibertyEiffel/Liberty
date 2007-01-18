indexing
	description: "Enum gnome_vfs_uri_hide_options"
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

deferred class GNOME_VFS_URI_HIDE_OPTIONS
	-- Packed boolean bitfield controlling hiding of various elements
	-- of a GnomeVFSURI when it is converted to a string.
	
inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_uri_hide_option (some_options :INTEGER): BOOLEAN is
		do	
			Result:=(some_options & (gnome_vfs_uri_hide_user_name |
											 gnome_vfs_uri_hide_password |
											 gnome_vfs_uri_hide_host_name |
											 gnome_vfs_uri_hide_host_port |
											 gnome_vfs_uri_hide_toplevel_method |
											 gnome_vfs_uri_hide_fragment_identifier)).to_boolean
		end

   gnome_vfs_uri_hide_none: INTEGER is
			-- don't hide anything
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_NONE"
		end

   gnome_vfs_uri_hide_user_name: INTEGER is
			-- hide the user name
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_USER_NAME"
		end

   gnome_vfs_uri_hide_password: INTEGER is
			-- hide the password
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_PASSWORD"
		end

   gnome_vfs_uri_hide_host_name: INTEGER is
			-- hide the host name
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_HOST_NAME"
		end

   gnome_vfs_uri_hide_host_port: INTEGER is
			-- hide the port
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_HOST_PORT"
		end

   gnome_vfs_uri_hide_toplevel_method: INTEGER is
			-- hide the method (e.g. http, file)
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_TOPLEVEL_METHOD"
		end

   gnome_vfs_uri_hide_fragment_identifier: INTEGER is
			-- hide the fragment identifier
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_URI_HIDE_FRAGMENT_IDENTIFIER"
		end
end --  class GNOME_VFS_URI_HIDE_OPTIONS

