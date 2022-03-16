note
	description: "External calls for GtkToggleToolButton."
	copyright: "[
					Copyright (C) 2006-2022: GTK+ team
					
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

deferred class GTK_TOGGLE_TOOL_BUTTON_EXTERNALS

inherit
	ANY undefine is_equal, copy end

feature {} -- Externals

	gtk_toggle_tool_button_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_tool_button_set_active (handle: POINTER; is_active: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_tool_button_get_active (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TOGGLE_TOOL_BUTTON_EXTERNALS
