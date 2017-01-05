note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "Unknown"

class CH01

inherit
	(SHARED_?)C_STRUCT

insert
	CH01_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: GConf Reference Manual (parent)
	--   Link: GConf Reference Manual (previous)
	--   Link: GConfClient (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev   Home                  GConf Reference Manual                   Next
	--
	--Using the GConf library
	--
	--   GConfClient -- GObject-based convenience wrapper
	--
	--   gconf-backend
	--
	--   GConfEngine -- a GConf "database"
	--
	--   GError -- error reporting.
	--
	--   gconf-internals
	--
	--   gconf-listeners
	--
	--   GConfSchema -- A GConfSchema describes a GConfEntry
	--
	--   gconf-sources
	--
	--   GConfValue, GConfEntry, GConfMetaInfo -- A GConfValue stores a
	--   dynamically-typed value. A GConfEntry stores a key-value pair. A
	--   GConfMetaInfo stores metainformation about a key.
	--
	--   GConf Core Interfaces -- Basic functions to initialize GConf and get/set
	--   values
	--
	--   gconf-locale
	--
	--   GConfChangeSet -- a set of configuration changes to be made.

end -- class CH01
