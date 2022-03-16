note
	description: "Enum GtkJustification Used for justifying the text inside a GtkLabel widget. (See also GtkAlignment)."
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_JUSTIFICATION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_justification (a_justification :INTEGER): BOOLEAN
		do	
			Result:=((a_justification= gtk_justify_left) or else
						(a_justification= gtk_justify_right) or else
						(a_justification= gtk_justify_center) or else
						(a_justification= gtk_justify_fill))
		end

	gtk_justify_left: INTEGER
			-- 	The text is placed at the left edge of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_LEFT"
		end
	
	gtk_justify_right: INTEGER
			-- 	The text is placed at the right edge of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_RIGHT"
		end
	
	gtk_justify_center: INTEGER
			-- 	The text is placed in the center of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_CENTER"
		end
	
	gtk_justify_fill: INTEGER
			-- 	The text is distributed across the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_FILL"
		end
	
end
