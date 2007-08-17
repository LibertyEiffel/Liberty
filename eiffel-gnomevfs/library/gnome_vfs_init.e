indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GnomeVFS team
					
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

deferred class GNOME_VFS_INIT
	-- Starting GnomeVFS up and shutting it down. Usually when using
	-- the whole GNOME framework this library is initialized and
	-- shutdown automatically when calling gnome_init.

	
feature -- Gnome VFS initializing and shutting down
	init is
			-- Initialize Gnome-VFS, if it is not already
			-- initialized.. This feature must be called prior to
			-- performing any other gnome-vfs operations, and may be
			-- called multiple times without error.

			-- Note: the original C call returned a boolean to see if it
			-- is successfully initialized, but this breaks the
			-- command-quer-sparation principle so it hasn't been
			-- mimicked. See `is_initialized'.
		local bool: INTEGER
		do
			bool:=gnome_vfs_init
		end

	is_initialized: BOOLEAN is
			-- Has gnome-vfs already been initialized? Gnome-vfs must be
			-- initialized prior to using any methods or operations).
		do
			Result := gnome_vfs_initialized.to_boolean
		end

	shutdown is
			-- Cease all active gnome-vfs operations and unload the MIME
			-- database from memory.
		do
			gnome_vfs_shutdown
		end

feature -- SSL support 
	is_ssl_enabled: BOOLEAN is
			-- Was gnome-vfs compiled with SSL support?				 
		do
			Result := gnome_vfs_ssl_enabled.to_boolean
		end

feature {} -- External calls
	gnome_vfs_init: INTEGER is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_initialized: INTEGER is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_shutdown is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_ssl_enabled: INTEGER is
			-- gboolean gnome_vfs_ssl_enabled (void);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

end -- class GNOME_VFS
