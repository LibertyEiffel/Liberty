indexing
	description: "External calls for GtkAdjustment"
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

deferred class GTK_ADJUSTMENT_EXTERNALS

inherit
	ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_adjustment_new (a_value, a_lower, an_upper, a_step_increment, a_page_increment, a_page_size: REAL): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_get_value (an_adjustment: POINTER): REAL is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_set_value (an_adjustment: POINTER; a_value: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_clamp_page (an_adjustment: POINTER; a_lower, an_upper: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_changed (an_adjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_value_changed (an_adjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end

end
