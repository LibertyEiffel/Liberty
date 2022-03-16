note
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

deferred class GTK_ADJUSTMENT_STRUCT

inherit
	ANY undefine is_equal, copy end

feature {} -- struct access
	get_lower (an_adjustment: POINTER): REAL
			-- 	the minimum value.
		external "C struct GtkAdjustment get lower use <gtk/gtk.h>"
		end

	get_upper (an_adjustment: POINTER): REAL
			-- 	the maximum value.
		external "C struct GtkAdjustment get upper use <gtk/gtk.h>"
		end

	get_value (an_adjustment: POINTER): REAL
			-- 	the current value.
		external "C struct GtkAdjustment get value use <gtk/gtk.h>"
		end

	get_step_increment (an_adjustment: POINTER): REAL
			-- the increment to use to make minor changes to the
			-- value. In a GtkScrollbar this increment is used when the
			-- mouse is clicked on the arrows at the top and bottom of
			-- the scrollbar, to scroll by a small amount.
		external "C struct GtkAdjustment get step_increment use <gtk/gtk.h>"
		end

	get_page_increment (an_adjustment: POINTER): REAL
			-- the increment to use to make major changes to the
			-- value. In a GtkScrollbar this increment is used when the
			-- mouse is clicked in the trough, to scroll by a large
			-- amount.
		external "C struct GtkAdjustment get page_increment use <gtk/gtk.h>"
		end

	get_page_size (an_adjustment: POINTER): REAL
			-- the page size. In a GtkScrollbar this is the size of the
			-- area which is currently visible.
		external "C struct GtkAdjustment get page_size use <gtk/gtk.h>"
		end

end
