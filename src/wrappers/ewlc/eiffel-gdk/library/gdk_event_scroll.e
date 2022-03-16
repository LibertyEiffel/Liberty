note
	description: "Used for mouse scroll events."
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

class GDK_EVENT_SCROLL

inherit GDK_EVENT

insert
	GDK_EVENT_SCROLL_EXTERNALS
	GDK_MODIFIER_TYPE
	GDK_SCROLL_DIRECTION

create {ANY} from_external_pointer

feature {ANY} -- access

	time: INTEGER
			-- the time of the event in milliseconds.
		do
			Result := gdk_event_scroll_get_time (handle)
		end

	x: REAL_64
			-- the x coordinate of the pointer relative to the window.
		do
			Result := gdk_event_scroll_get_x (handle)
		end

	y: REAL_64
			-- the y coordinate of the pointer relative to the window.
		do
			Result := gdk_event_scroll_get_y (handle)
		end

	state: INTEGER
			-- a bit-mask representing the state of the modifier keys
			-- (e.g. Control, Shift and Alt) and the pointer buttons.
			-- See GDK_MODIFIER_TYPE.
		do
			Result := gdk_event_scroll_get_state (handle)
		ensure
			is_valid_gdk_modifier_type (Result)
		end

	direction: INTEGER
			-- the scroll direction, one of GDK_SCROLL_DIRECTION constants
		do
			Result := gdk_event_scroll_get_direction (handle)
		ensure
			is_valid_gdk_scroll_direction (Result)
		end

-- Not implemented: GdkDevice *device; 	the device where the event originated.

	x_root: REAL_64
			-- the x coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_scroll_get_x_root (handle)
		end

	y_root: REAL_64
			-- the y coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_scroll_get_y_root (handle)
		end

-- feature -- size
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventScroll)"
-- 		end

invariant is_event_scroll

end -- class GDK_EVENT_SCROLL
