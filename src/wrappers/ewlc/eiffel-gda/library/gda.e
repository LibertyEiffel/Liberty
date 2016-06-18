note
	description: "GDA - Gnome Data Access"
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

	wrapped_version: "3.0.2"

	license: "LGPL v2 or later"

deferred class GDA

insert 
	WRAPPER_HANDLER
	LIBGDA_EXTERNALS
	ARGUMENTS

feature {ANY}-- Initialization

	initialization (application_id, version: STRING)
		--   Initializes the GDA library.
	do
		gda_init 
	end
	
	--  gda_get_default_dict ()
	--
	-- GdaDict*            gda_get_default_dict                (void);
	--
	--   Get the default dictionary.
	--
	--   Returns : a not NULL pointer to the default GdaDict dictionary
	--
	
end -- class GDA
