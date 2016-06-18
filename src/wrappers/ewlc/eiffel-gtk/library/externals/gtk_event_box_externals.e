note
	description: "External calls for GTK_EVENT_BOX"
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

deferred class GTK_EVENT_BOX_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_event_box_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_event_box_set_above_child(a_event_box: POINTER; above: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_event_box_get_above_child(a_event_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_event_box_set_visible_window(a_event_box: POINTER; visible_window: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_event_box_get_visible_window(a_event_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

end

