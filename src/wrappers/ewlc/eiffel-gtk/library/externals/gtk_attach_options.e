note
	description: "Enum GtkAttachOptions - Denotes the expansion properties that a widget will have when it (or its parent) is resized."
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

deferred class GTK_ATTACH_OPTIONS

inherit
	ANY undefine is_equal, copy end

feature  {} -- enum
	are_valid_attach_options (an_attach_options: INTEGER): BOOLEAN
		do	
			Result:=(an_attach_options & (gtk_expand | gtk_shrink | gtk_fill)).to_boolean
		end

	gtk_expand: INTEGER
			-- the widget should expand to take up any extra space in its container
			-- that has been allocated.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPAND"
		end
	
	gtk_shrink: INTEGER
			-- the widget should shrink as and when possible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHRINK"
		end
	
	gtk_fill: INTEGER
			-- the widget should fill the space allocated to it.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILL"
		end
end
