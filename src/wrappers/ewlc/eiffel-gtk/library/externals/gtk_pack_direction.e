note
	description: "Enum GtkPackDirection"
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

deferred class GTK_PACK_DIRECTION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_pack_direction (a_direction :INTEGER): BOOLEAN
		do
			Result := ((a_direction = gtk_pack_direction_ltr) or else
						  (a_direction = gtk_pack_direction_rtl) or else
						  (a_direction = gtk_pack_direction_ttb) or else
						  (a_direction = gtk_pack_direction_btt))
		end

	gtk_pack_direction_ltr: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PACK_DIRECTION_LTR"
		end

	gtk_pack_direction_rtl: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PACK_DIRECTION_RTL"
		end

	gtk_pack_direction_ttb: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PACK_DIRECTION_TTB"
		end

	gtk_pack_direction_btt: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PACK_DIRECTION_BTT"
		end

end
