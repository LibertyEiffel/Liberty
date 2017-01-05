note
	description: "External calls for GDK_EVENT_KEY"
	copyright: "[
					Copyright (C) 2007-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GDK_EVENT_KEY_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gdk_event_key_get_time (ptr: POINTER): INTEGER
		external "C struct GdkEventKey get time use <gdk/gdk.h>"
		end

	gdk_event_key_get_state (ptr: POINTER): INTEGER
		external "C struct GdkEventKey get state use <gdk/gdk.h>"
		end

	gdk_event_key_get_keyval (ptr: POINTER): INTEGER
		external "C struct GdkEventKey get keyval use <gdk/gdk.h>"
		end

end -- class GDK_EVENT_KEY_EXTERNALS
