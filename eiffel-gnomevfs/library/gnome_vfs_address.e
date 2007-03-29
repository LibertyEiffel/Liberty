indexing
	description: "."
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

class GNOME_VFS_ADDRESS

inherit SHARED_C_STRUCT

creation make, from_external_pointer

feature {} -- Creation 
	from_ipv4 (ipv4_address: INTEGER_64) is
			-- Creates a new GnomeVFSAddress from `an_ipv4_address'.
		
			-- `an_ipv4_address': A IPv4 Address in network byte order; 
			-- TODO: should be NATURAL_32
		
			obsolete "This feature should be avoided because newly written code should be protocol independent."
		do
			from_external_pointer(gnome_vfs_address_new_from_ipv4(an_ipv4_address))
		end

	-- TODO:  gnome_vfs_address_new_from_sockaddr ()
	
	--  GnomeVFSAddress* gnome_vfs_address_new_from_sockaddr (struct
	--  sockaddr *sa, int len);

	--    Creates a new GnomeVFSAddress from sa.
	
	--    sa :      A pointer to a sockaddr.
	--    len :     The size of sa.
	--    Returns : The new GnomeVFSAddress or NULL if sa was invalid or the
	--              address family isn't supported.
	
	--    Since 2.8
	
   from_string (an_address: STRING) is
			-- Creates a new GNOME_VFS_ADDRESS from `an_address'. If it
			-- isn't a valid, `is_valid' will be False.
		require 
			address_not_void: an_address /= Void
		do
			-- gnome_vfs_address_new_from_string creates a new
			-- GnomeVFSAddress from the given string or NULL if address
			-- isn't a valid.
			from_external_pointer(gnome_vfs_address_new_from_string(an_address))
		end			

feature 
	is_valid: BOOLEAN is
		do 
			Result:=is_not_null
		end

	family_type: INTEGER is
			-- The address family of address.

			-- TODO: provide an enumeration class, taken from the 
			-- appropriate manpage.
		require is_valid
		do
			Result := gnome_vfs_address_get_family_type(handle)
		end

	ipv4: INTEGER_64 is
			-- The associated IPv4 address in network byte order.

		obsolete "You should avoid using this function because newly written code should be protocol independent."
		require is_valid
		do
			Result:=gnome_vfs_address_get_ipv4(handle)
		end

	to_string: STRING is
			-- Translate address to a printable string.
		require is_valid
		do
			create Result.from_external(gnome_vfs_address_to_string(handle))
			-- gnome_vfs_address_to_string returns a newly alloced string
			-- representation of address which the caller must free.
		ensure not_void: Result/=Void
		end

feature {} -- External calls
	gnome_vfs_address_get_family_type (an_address: POINTER): INTEGER is
			--  int gnome_vfs_address_get_family_type (GnomeVFSAddress *address);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_address_get_ipv4 (an_address: POINTER): INTEGER_64 is
			-- guint32 gnome_vfs_address_get_ipv4 (GnomeVFSAddress*address);

			-- TODO: MUST BE NATURAL_32!!!
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_address_get_type: INTEGER is
			--  GType gnome_vfs_address_get_type (void);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_address_new_from_ipv4 (an_ipv4_address: INTEGER_64): INTEGER is
			--  GnomeVFSAddress* gnome_vfs_address_new_from_ipv4 (guint32
			--  ipv4_address);

			-- TODO: an_ipv4_address Must be a NATURAL_32
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_address_new_from_sockaddr (a_sockaddr: POINTER; a_len: INTEGER): POINTER is
			--  GnomeVFSAddress* gnome_vfs_address_new_from_sockaddr
			--  (struct sockaddr *sa, int len);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_address_new_from_string (an_address: POITER): POINTER is
			--  GnomeVFSAddress* gnome_vfs_address_new_from_string (const char *address);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_address_to_string (an_address: POINTER): POINTER is
			--  char* gnome_vfs_address_to_string (GnomeVFSAddress
			--  *address);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgnomevfs/gnome-vfs.h>"
		alias "sizeof(GnomeVFSAddress)"
		end
end -- class GNOME_VFS_ADDRESS
