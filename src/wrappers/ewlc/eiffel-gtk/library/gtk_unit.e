note
	description: "enum GtkUnit"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

deferred class GTK_UNIT

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_unit (a_unit: INTEGER): BOOLEAN
		do	
			Result:=((a_unit = gtk_unit_pixel) or else
						(a_unit = gtk_unit_points) or else
						(a_unit = gtk_unit_inch) or else
						(a_unit = gtk_unit_mm))
		end

	gtk_unit_pixel: INTEGER
			-- GTK_UNIT_PIXEL
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UNIT_PIXEL"
		end

	gtk_unit_points: INTEGER
			-- GTK_UNIT_POINTS
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UNIT_POINTS"
		end

	gtk_unit_inch: INTEGER
			-- GTK_UNIT_INCH
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UNIT_INCH"
		end

	gtk_unit_mm: INTEGER
			-- GTK_UNIT_MM
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UNIT_MM"
		end
end
