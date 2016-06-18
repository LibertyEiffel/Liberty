note
	description: "enum GtkCellRendererAccelMode"
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

deferred class GTK_CELL_RENDERER_ACCEL_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gtk_accel_mode (a_mode: INTEGER): BOOLEAN
		do	
			Result:=((a_mode = gtk_cell_renderer_accel_mode_gtk) or else
						(a_mode = gtk_cell_renderer_accel_mode_other))
		end

   gtk_cell_renderer_accel_mode_gtk: INTEGER
			-- GTK_CELL_RENDERER_ACCEL_MODE_GTK
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_ACCEL_MODE_GTK"
		end

	gtk_cell_renderer_accel_mode_other: INTEGER
			-- GTK_CELL_RENDERER_ACCEL_MODE_OTHER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_ACCEL_MODE_OTHER"
		end
end
