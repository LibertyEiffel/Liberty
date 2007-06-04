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

deferred class	GNOME_VFS_MAKE_URI_DIRS_FLAGS
   -- Flags that can be passed to
   -- gnome_vfs_make_uri_from_input_with_dirs (TODO: put the
   -- Eiffelized name of the feature).  If the given input might be a
   -- relative path it checks for existence of the file in the
   -- directory specified by this flag. If both flags are passed the
   -- current directory is checked first.

inherit ANY undefine is_equal, copy end

feature  -- enum
	are_valid_make_uri_dirs_flags (some_flags: INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (gnome_vfs_make_uri_dir_none |
										  gnome_vfs_make_uri_dir_homedir |
										  gnome_vfs_make_uri_dir_current)).to_boolean
		end
 
   gnome_vfs_make_uri_dir_none: INTEGER is
			-- Don't check any directory
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_MAKE_URI_DIR_NONE"
		end

   gnome_vfs_make_uri_dir_homedir: INTEGER is
			-- Check the home directory
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_MAKE_URI_DIR_HOMEDIR"
		end

   gnome_vfs_make_uri_dir_current: INTEGER is
			-- Check the current direcotry
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_MAKE_URI_DIR_CURRENT"
		end

end
