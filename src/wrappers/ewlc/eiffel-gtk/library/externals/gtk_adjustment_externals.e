note
	description: "External calls for GtkAdjustment"
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

deferred class GTK_ADJUSTMENT_EXTERNALS

inherit
	ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_adjustment_new (a_value, a_lower, an_upper, a_step_increment, a_page_increment, a_page_size: REAL_64): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_get_value (an_adjustment: POINTER): REAL_64
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_set_value (an_adjustment: POINTER; a_value: REAL_64)
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_clamp_page (an_adjustment: POINTER; a_lower, an_upper: REAL_64)
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_changed (an_adjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_value_changed (an_adjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_get_lower (an_adjustment: POINTER): REAL_64
		external "C struct GtkAdjustment get lower use <gtk/gtk.h>"
		end

	gtk_adjustment_get_upper (an_adjustment: POINTER): REAL_64
		external "C struct GtkAdjustment get upper use <gtk/gtk.h>"
		end

	gtk_adjustment_get_page_increment (an_adjustment: POINTER): REAL_64
		external "C struct GtkAdjustment get page_increment use <gtk/gtk.h>"
		end

	gtk_adjustment_get_page_size (an_adjustment: POINTER): REAL_64
		external "C struct GtkAdjustment get page_size use <gtk/gtk.h>"
		end

	gtk_adjustment_get_step_increment (an_adjustment: POINTER): REAL_64
		external "C struct GtkAdjustment get step_increment use <gtk/gtk.h>"
		end

	gtk_adjustment_set_lower (an_adjustment: POINTER; a_lower: REAL_64)
		external "C struct GtkAdjustment set lower use <gtk/gtk.h>"
		end

	gtk_adjustment_set_upper (an_adjustment: POINTER; an_upper: REAL_64)
		external "C struct GtkAdjustment set upper use <gtk/gtk.h>"
		end

	gtk_adjustment_set_page_increment (an_adjustment: POINTER; a_page_increment: REAL_64)
		external "C struct GtkAdjustment set page_increment use <gtk/gtk.h>"
		end

	gtk_adjustment_set_page_size (an_adjustment: POINTER; a_page_size: REAL_64)
		external "C struct GtkAdjustment set page_size use <gtk/gtk.h>"
		end

	gtk_adjustment_set_step_increment (an_adjustment: POINTER; a_step_increment: REAL_64)
		external "C struct GtkAdjustment set step_increment use <gtk/gtk.h>"
		end

end
