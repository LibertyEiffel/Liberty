indexing
	description: "Specialized list of GNOME_VFS_URI."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Gnome-VFS team
					
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

class GNOME_VFS_URI_LIST

inherit G_LIST[GNOME_VFS_URI] redefine dispose end
creation parse, from_external_pointer

feature {} -- Creation
	parse (an_uri_list: STRING) is
			-- Extracts a list of GnomeVFSURI objects from a standard
			-- text/uri-list, such as one you would get on a drop
			-- operation. 
		do
			from_external_pointer(gnome_vfs_uri_list_parse (an_uri_list.to_external))
			-- Use gnome_vfs_uri_list_free() when you are done with
			-- GnomeVFSURIs.
		end	

feature 
	ref is
			-- Increments the reference count of the items in list by
			-- one.
		local ptr: POINTER
		do
			ptr:=gnome_vfs_uri_list_ref(handle)
			check ptr_is_handle: ptr=handle end
		end

	unref is
		local ptr: POINTER
			-- Decrements the reference count of the items in list by one.
		do
			ptr:=gnome_vfs_uri_list_unref(handle)
			-- Note that the list is *not freed* even if each member of
			-- the list is freed.
			check ptr_is_handle: ptr=handle end
		end

	copy (another: like Current) is
			-- Creates a duplicate of list, and references each member of
			-- that list.
		do
			from_external_pointer (gnome_vfs_uri_list_copy(handle))
		end

	dispose is
			-- Decrements the reference count of each member of list by
			-- one, and frees the list itself.
		do
			gnome_vfs_uri_list_free(handle)
		end

feature {} -- External calls

 	gnome_vfs_uri_list_parse (a_uri_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_parse (const gchar *uri_list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_ref (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_ref (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_unref (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_unref (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_copy (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_copy (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_free (a_list: POINTER) is
			-- void gnome_vfs_uri_list_free (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
end -- class GNOME_VFS_URI_LIST
