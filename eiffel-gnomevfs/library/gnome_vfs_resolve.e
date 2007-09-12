indexing
	description: "DNS Resolution -- Generic thread-safe address resolution functions."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

class GNOME_VFS_RESOLVE

inherit 
	SHARED_C_STRUCT
	ITERATOR[GNOME_VFS_ADDRESS]

insert GNOME_VFS_RESULT

creation dummy, resolve, from_external_pointer

feature {} -- Creation

	resolve (a_hostname: STRING) is
			-- Tries to resolve hostname. If the operation was successful
			-- you can get the resolved addresses using `next_address'.

			-- `a_hostname' : hostname you want to resolve.

			-- `last_result' indicates the success of the operation.
		do
			last_result:=gnome_vfs_resolve(a_hostname.to_external,$handle)
		end

feature
	dispose is
		do	
			gnome_vfs_resolve_free(handle)
		end

feature -- Iterator features
	start is
		do
			gnome_vfs_resolve_reset_to_beginning(handle)
			-- gnome_vfs_resolve_reset_to_beginning resets handle so that
			-- a following call to gnome_vfs_resolve_next_address() will
			-- return the first resolved address.
		end

	is_off: BOOLEAN is
		do
			Result := (item /= Void)
		end

	item: GNOME_VFS_ADDRESS

	next is
		local
			an_address_ptr: POINTER
			is_stored: BOOLEAN
		do
			is_stored := (gnome_vfs_resolve_next_address
							  (handle, $an_address_ptr)).to_boolean
			-- gnome_vfs_resolve_next_address stores the next
			-- GnomeVFSAddress available in handle of the former lookup
			-- in address.
			
			-- handle :  a GnomeVFSResolveHandle.

			-- address : a pointer to a pointer to a GnomeVFSAddress.

			-- Returns : TRUE if the next address was stored in address
			-- or FALSE if no other address is available.		
			if is_stored 
			 then create item.from_external_pointer(an_address_ptr)
			else item:=Void
			end
		end

feature {} -- External features
	gnome_vfs_resolve (a_hostname, a_handle: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_resolve (const char *hostname,
			-- GnomeVFSResolveHandle **handle);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_resolve_free (a_handle: POINTER) is
			--  void gnome_vfs_resolve_free (GnomeVFSResolveHandle *handle);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_resolve_next_address (a_handle, an_address_handle: POINTER): INTEGER is
			--  gboolean gnome_vfs_resolve_next_address
			--  (GnomeVFSResolveHandle *handle, GnomeVFSAddress
			--  **address);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_resolve_reset_to_beginning (a_handle: POINTER) is
			--  void gnome_vfs_resolve_reset_to_beginning (GnomeVFSResolveHandle *handle);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgnomevfs/gnome-vfs.h>"
		alias "sizeof(GnomeVFSResolveHandle)"
		end
end -- class GNOME_VFS_RESOLVE
