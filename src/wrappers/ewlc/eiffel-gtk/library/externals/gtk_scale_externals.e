note
	description: "External calls for GTK_RANGE"
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

deferred class GTK_SCALE_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTK_POSITION_TYPE

feature {} -- External calls

	gtk_scale_set_digits (a_scale: POINTER; some_digits: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scale_set_draw_value (a_scale: POINTER; draw_value: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scale_set_value_pos (a_scale: POINTER; a_gtk_position_type: INTEGER)
		require is_valid_gtk_position_type (a_gtk_position_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_scale_get_digits (a_scale: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_scale_get_draw_value (a_scale: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_scale_get_value_pos (a_scale: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure is_valid_gtk_position_type (Result)
		end

	gtk_scale_get_layout (a_scale: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
		

	gtk_scale_get_layout_offsets (a_scale,an_x,an_y: POINTER)
		external "C use <gtk/gtk.h>"
		end

end
