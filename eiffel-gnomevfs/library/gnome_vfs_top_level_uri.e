indexing
	description: "."
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

class GNOME_VFS_TOP_LEVEL_URI

inherit GNOME_VFS_URI

-- insert FOO_EXTERNALS

creation from_external_pointer

feature {} -- Creation
feature {} -- Unwrapped
--  --------------------------------------------------------------------------

--  GnomeVFSToplevelURI

--  typedef struct {
--  /* Base object. */
--  GnomeVFSURI uri;

--  /* Server location information. */
--  gchar *host_name;
--  guint host_port;

--  /* Authorization information. (unescaped) */
--  gchar *user_name;
--  gchar *password;

--  /* The parent URN, if it exists */
--  gchar *urn;

--  /* Reserved to avoid future breaks in ABI compatibility */
--  void *reserved1;
--  void *reserved2;
--  } GnomeVFSToplevelURI;

end -- class GNOME_VFS_TOP_LEVEL_URI
