note
	description: "Enum GtkCellRendererMode"
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

deferred class GTK_CELL_RENDERER_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gtk_cell_renderer_mode (a_mode :INTEGER): BOOLEAN
		do
			Result:=((a_mode = gtk_cell_renderer_mode_inert) or else
						(a_mode = gtk_cell_renderer_mode_activatable) or else
						(a_mode = gtk_cell_renderer_mode_editable))
		end

	gtk_cell_renderer_mode_inert: INTEGER
			-- The cell is just for display and cannot be interacted
			-- with. Note that this doesn't mean that eg. the row being
			-- drawn can't be selected, just that a particular element of
			-- it cannot be individually modified.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_INERT"
		end
	
	gtk_cell_renderer_mode_activatable: INTEGER
			-- 	The cell can be clicked.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_ACTIVATABLE"
		end
	
	gtk_cell_renderer_mode_editable: INTEGER
			-- 	The cell can be edited or otherwise modified.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_EDITABLE"
		end
end
