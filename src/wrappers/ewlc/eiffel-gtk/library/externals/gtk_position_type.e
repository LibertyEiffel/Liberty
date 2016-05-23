note
	description: "enum GtkPositionType Describes which edge of a widget a certain feature is positioned at, e.g. the tabs of a GtkNotebook, the handle of a GtkHandleBox or the label of a GtkScale."
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

deferred class GTK_POSITION_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_position_type (a_position: INTEGER): BOOLEAN is
		do
			Result := ((a_position=gtk_pos_left) or else
			           (a_position=gtk_pos_right) or else
			           (a_position=gtk_pos_top) or else
			           (a_position=gtk_pos_bottom))
		end

	gtk_pos_left: INTEGER is
			-- 	The feature is at the left edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_LEFT"
		end

	gtk_pos_right: INTEGER is
			-- 	The feature is at the right edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_RIGHT"
		end

	gtk_pos_top: INTEGER is
			-- 	The feature is at the top edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_TOP"
		end

	gtk_pos_bottom: INTEGER is
			-- 	The feature is at the bottom edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_BOTTOM"
		end

end
