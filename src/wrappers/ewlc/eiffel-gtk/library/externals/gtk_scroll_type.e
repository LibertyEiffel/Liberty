note
	description: "enum GtkScrollType"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_SCROLL_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gtk_scroll_none: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_NONE"
		end

	gtk_scroll_jump: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_JUMP"
		end

	gtk_scroll_step_backward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_BACKWARD"
		end

	gtk_scroll_step_forward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_FORWARD"
		end

	gtk_scroll_page_backward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_BACKWARD"
		end

	gtk_scroll_page_forward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_FORWARD"
		end

	gtk_scroll_step_up: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_UP"
		end

	gtk_scroll_step_down: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_DOWN"
		end

	gtk_scroll_page_up: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_UP"
		end

	gtk_scroll_page_down: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_DOWN"
		end

	gtk_scroll_step_left: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_LEFT"
		end

	gtk_scroll_step_right: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEP_RIGHT"
		end

	gtk_scroll_page_left: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_LEFT"
		end

	gtk_scroll_page_right: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGE_RIGHT"
		end

	gtk_scroll_start: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_START"
		end

	gtk_scroll_end: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_END"
		end

end
