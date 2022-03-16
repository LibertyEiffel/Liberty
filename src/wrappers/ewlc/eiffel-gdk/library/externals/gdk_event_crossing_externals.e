note
	description: "External calls for GDK_EVENT_CROSSING"
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

deferred class GDK_EVENT_CROSSING_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gdk_event_crossing_get_subwindow (ptr: POINTER): POINTER
		external "C struct GdkEventCrossing get subwindow use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_time (ptr: POINTER): INTEGER
		external "C struct GdkEventCrossing get time use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_x (ptr: POINTER): REAL_64
		external "C struct GdkEventCrossing get x use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_y (ptr: POINTER): REAL_64
		external "C struct GdkEventCrossing get y use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_x_root (ptr: POINTER): REAL_64
		external "C struct GdkEventCrossing get x_root use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_y_root (ptr: POINTER): REAL_64
		external "C struct GdkEventCrossing get y_root use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_mode (ptr: POINTER): INTEGER
		external "C struct GdkEventCrossing get mode use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_focus (ptr: POINTER): INTEGER
		external "C struct GdkEventCrossing get focus use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_detail (ptr: POINTER): INTEGER
		external "C struct GdkEventCrossing get detail use <gdk/gdk.h>"
		end

	gdk_event_crossing_get_state (ptr: POINTER): INTEGER
		external "C struct GdkEventCrossing get state use <gdk/gdk.h>"
		end

end -- class GDK_EVENT_CROSSING_EXTERNALS
