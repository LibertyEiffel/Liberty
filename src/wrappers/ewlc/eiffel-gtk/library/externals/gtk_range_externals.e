note
	description: "External calls for GTK_RANGE"
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

deferred class GTK_RANGE_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTK_UPDATE_TYPE

feature {} -- External calls

	gtk_range_get_adjustment (a_range: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_update_policy (a_range: POINTER; a_gtkupdatetype: INTEGER)
		require is_valid_gtk_update_type(a_gtkupdatetype)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_adjustment (a_range, a_gtk_adjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_get_inverted (a_range: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_inverted (a_range: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_get_update_policy (a_range: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure  is_valid_gtk_update_type(Result)
		end

	gtk_range_get_value (a_range: POINTER): REAL_64
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_increments (a_range: POINTER; a_step, a_page: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_range (a_range: POINTER; a_min,a_max: REAL_64)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_value (a_range: POINTER; value: REAL_64)
		external "C use <gtk/gtk.h>"
		end

end
