indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

deferred class GNOME_VFS_FILE_SIZE

inherit ANY undefine is_equal, copy end

feature {WRAPPER, WRAPPER_HANDLER}
-- 	gnome_vfs_offset_is_long_long

--  #define GNOME_VFS_OFFSET_IS_LONG_LONG

--    --------------------------------------------------------------------------

--   GNOME_VFS_SIZE_FORMAT_STR

--  #define GNOME_VFS_SIZE_FORMAT_STR G_GUINT64_FORMAT

--    --------------------------------------------------------------------------

--   GNOME_VFS_OFFSET_FORMAT_STR

--  #define GNOME_VFS_OFFSET_FORMAT_STR G_GINT64_FORMAT

--    --------------------------------------------------------------------------

	gnome_vfs_file_size: INTEGER_64 is
			-- An "example" of the type of the file size in the
			-- GnomeVFS. This feature is useful in anchored declarations
			-- (i.e. file_size: like gnome_vfs_file_size)

			-- TODO: should be NATURAL_64, since it is a guint64

			--  G_GNUC_EXTENSION typedef guint64 GnomeVFSFileSize;

		do
			-- Empty feature by design.
		end
	
	gnome_vfs_file_offset: INTEGER_64 is
			-- An "example" of the type of the file offset in the
			-- GnomeVFS. This feature is useful in anchored declarations
			-- (i.e. offset: like gnome_vfs_file_offset)
		
			--  G_GNUC_EXTENSION typedef gint64 GnomeVFSFileOffset;
		do
		end

	size_of_gnome_vfs_file_size: INTEGER is
			-- sizeof(GnomeVFSFileSize)
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "sizeof(GnomeVFSFileSize)"
		end
	
	size_of_gnome_vfs_file_offset: INTEGER is
			-- sizeof(GnomeVFSFileOffset)
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "sizeof(GnomeVFSFileOffset)"
		end
	

feature {} -- External calls
--  #define     GNOME_VFS_OFFSET_IS_LONG_LONG
--  #define     GNOME_VFS_SIZE_FORMAT_STR
--  #define     GNOME_VFS_OFFSET_FORMAT_STR
--  typedef     GnomeVFSFileSize;
--  typedef     GnomeVFSFileOffset;
invariant
	file_size_is_64_bit: size_of_gnome_vfs_file_size=8
	offset_is_64_bit size_of_gnome_vfs_file_offset=8
 end
