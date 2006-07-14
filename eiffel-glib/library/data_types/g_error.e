indexing
	description: "G_ERROR - information about an error that has occurred."
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

class G_ERROR -- The GError structure contains information about an error that has occurred.

inherit
	C_STRUCT
		rename
			make as c_struct_make
		redefine
			dispose, force_free_handle, free_handle
		end

insert
	G_ERROR_EXTERNALS

creation
	make, from_external_pointer

feature {NONE} -- Creation

	make (a_domain: G_QUARK; a_code: INTEGER; a_message: STRING) is
			-- Creates a new G_ERROR
		do
			from_external_pointer (g_error_new_literal (a_domain.quark, a_code, a_message.to_external))
		end

feature -- Access

	domain: G_QUARK is
		do
			Result.set_quark (g_error_get_domain (handle))
		end 

	code: INTEGER is
		do
			Result := g_error_get_code (handle)
		end

	message: STRING is
		do
			create Result.from_external_copy (g_error_get_message (handle))
		end

feature -- Comparation

	matches (a_domain: G_QUARK; a_code: INTEGER): BOOLEAN is
			-- Returns True if error matches domain and code, False otherwise.
		do
			Result := g_error_matches (handle, a_domain.quark, a_code).to_boolean
		end

feature -- Disposing

	dispose, force_free_handle is
			-- Frees a G_ERROR and associated resources.
		do
			g_error_free (handle)
			handle := default_pointer
		end

	free_handle is
		do
			g_error_free (handle)
		end

end
