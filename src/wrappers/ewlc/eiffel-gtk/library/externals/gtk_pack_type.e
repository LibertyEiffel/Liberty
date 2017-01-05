note
	description: "Enum GtkPackType -- Represents the packing location GtkBox children. (See: GtkVBox, GtkHBox, and GtkButtonBox)."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PACK_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_pack_type (a_pack_type:INTEGER): BOOLEAN
		do
			Result := ((a_pack_type=gtk_pack_start) or else (a_pack_type=gtk_pack_end))
		end

	gtk_pack_start: INTEGER
			-- The child is packed into the start of the box
		external "C macro use <gtk/gth.h>"
		alias "GTK_PACK_START"
		end

	gtk_pack_end: INTEGER
			-- The child is packed into the end of the box
		external "C macro use <gtk/gth.h>"
		alias "GTK_PACK_END"
		end

end

