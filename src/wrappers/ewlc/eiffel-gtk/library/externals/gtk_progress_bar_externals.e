note
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

deferred class GTK_PROGRESS_BAR_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_progress_bar_new : POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_pulse (bar: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_text (bar: POINTER; text : POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_fraction (bar: POINTER; fraction: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_pulse_step (bar : POINTER;fraction : REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_text (bar : POINTER) : POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_fraction (bar : POINTER) : REAL
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_orientation (bar : POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_orientation (bar: POINTER; an_orientation: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_ellipsize (bar : POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_ellipsize (bar: POINTER; an_ellipsize: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	
end
