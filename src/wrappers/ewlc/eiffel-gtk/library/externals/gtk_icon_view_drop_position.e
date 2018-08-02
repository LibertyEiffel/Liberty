note
	description: "Enum GtkIconViewDropPosition An enum for determining where a dropped row goes. "
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_ICON_VIEW_DROP_POSITION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_icon_view_drop_position (a_position: INTEGER): BOOLEAN
		do
			Result:=((a_position = gtk_icon_view_no_drop) or else
						(a_position = gtk_icon_view_drop_into) or else
						(a_position = gtk_icon_view_drop_left) or else
						(a_position = gtk_icon_view_drop_right) or else
						(a_position = gtk_icon_view_drop_above) or else
						(a_position = gtk_icon_view_drop_below))
		end

	gtk_icon_view_no_drop: INTEGER
			-- no drop possible
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_NO_DROP"
		end

	gtk_icon_view_drop_into: INTEGER
			-- dropped item replaces the item
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_DROP_INTO"
		end

	gtk_icon_view_drop_left: INTEGER
			-- droppped item is inserted to the left
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_DROP_LEFT"
		end

	gtk_icon_view_drop_right: INTEGER
			-- dropped item is inserted to the right
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_DROP_RIGHT"
		end

	gtk_icon_view_drop_above: INTEGER
			-- dropped item is inserted above
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_DROP_ABOVE"
		end

	gtk_icon_view_drop_below: INTEGER
			-- dropped item is inserted below
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_VIEW_DROP_BELOW"
		end

end -- class GTK_ICON_VIEW_DROP_POSITION
