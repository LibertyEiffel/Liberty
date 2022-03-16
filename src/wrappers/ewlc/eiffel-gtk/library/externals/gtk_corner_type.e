note
	description: "Enum GtkCornerType Specifies which corner a child widget should be placed in when packed into a GtkScrolledWindow. This is effectively the opposite of where the scroll bars are placed."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_CORNER_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_corner_type (a_corner_type :INTEGER): BOOLEAN
		do	
			Result:=((a_corner_type = gtk_corner_top_left) or else
						(a_corner_type = gtk_corner_bottom_left) or else
						(a_corner_type = gtk_corner_top_right) or else
						(a_corner_type = gtk_corner_bottom_right))
		end
	
	gtk_corner_top_left: INTEGER
			-- Place the scrollbars on the right and bottom of the widget
			-- (default behaviour).
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CORNER_TOP_LEFT"
		end
	
	gtk_corner_bottom_left: INTEGER
			-- Place the scrollbars on the top and right of the widget.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CORNER_BOTTOM_LEFT"
		end
	
	gtk_corner_top_right: INTEGER
			-- Place the scrollbars on the left and bottom of the widget.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CORNER_TOP_RIGHT"
		end
	
	gtk_corner_bottom_right: INTEGER
			-- Place the scrollbars on the top and left of the widget.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CORNER_BOTTOM_RIGHT"
		end
end
