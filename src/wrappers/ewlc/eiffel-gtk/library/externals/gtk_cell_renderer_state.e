note
	description: "Enum GtkCellRendererState"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_STATE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gtk_cell_renderer_state (a_state :INTEGER): BOOLEAN is
		do
			Result:=((a_state = gtk_cell_renderer_selected) or else
						(a_state = gtk_cell_renderer_prelit) or else
						(a_state = gtk_cell_renderer_insensitive) or else
						-- this flag means the cell is in the sort
						-- column/row
						(a_state = gtk_cell_renderer_sorted) or else
						(a_state = gtk_cell_renderer_focused))
		end

	gtk_cell_renderer_selected: INTEGER is
			-- 	The cell is currently selected, and probably has a selection colored background to render to.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_SELECTED"
		end
	
	gtk_cell_renderer_prelit: INTEGER is
			-- 	The mouse is hovering over the cell.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_PRELIT"
		end
	
	gtk_cell_renderer_insensitive: INTEGER is
			-- 	The cell is drawn in an insensitive manner
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_INSENSITIVE"
		end
	
	gtk_cell_renderer_sorted: INTEGER is
			-- 	The cell is in a sorted row
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_SORTED"
		end

	gtk_cell_renderer_focused: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_FOCUSED"
		end
end

