note
	description: "Resource Files -- Routines for handling resource files"
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

class GTK_RC_STYLE

inherit
	G_OBJECT redefine copy end

insert
	GTK_RC_EXTERNALS

create {ANY} from_external_pointer, make, copy

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkRcStyle)"
		end

feature {} -- Creation

	make is
		do
			from_external_pointer (gtk_rc_style_new)
		end

feature {ANY} -- Operations

	copy (other: like Current) is
		do
			from_external_pointer (gtk_rc_style_copy (other.handle))
		end

	parse (a_filename: STRING) is
		require
			a_filename /= Void
		do
			gtk_rc_parse (a_filename.to_external)
		end

end -- class GTK_RC_STYLE
