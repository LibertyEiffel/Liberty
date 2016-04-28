note
	description: "Used for button press and button release events."
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

class GDK_EVENT_BUTTON

inherit 
	GDK_EVENT

insert
	GDK_EVENT_BUTTON_EXTERNALS
	GDK_MODIFIER_TYPE

create {ANY} from_external_pointer

feature {ANY} -- access

	time: INTEGER is
			-- the time of the event in milliseconds.
		do
			Result := gdk_event_button_get_time (handle)
		end

	x: REAL_64 is
			-- the x coordinate of the pointer relative to the window.
		do
			Result := gdk_event_button_get_x (handle)
		end

	y: REAL_64 is
			-- the y coordinate of the pointer relative to the window.
		do
			Result := gdk_event_button_get_y (handle)
		end

	axes: TUPLE [REAL_64, REAL_64] is
			-- x, y translated to the axes of device, or Void if device is the mouse.
		local
			device_axes: NATIVE_ARRAY [REAL_64]
		do
			device_axes := device_axes.from_pointer (gdk_event_button_get_axes (handle))
			if device_axes.is_not_null then
				Result := [device_axes.item (0), device_axes.item (1)]
			end
		end

	state: INTEGER is
			-- a bit-mask representing the state of the modifier keys
			-- (e.g. Control, Shift and Alt) and the pointer buttons.
			-- See GDK_MODIFIER_TYPE.
		do
			Result := gdk_event_button_get_state (handle)
		ensure
			is_valid_gdk_modifier_type (Result)
		end

	button: INTEGER is
			-- the button which was pressed or released, numbered from 1 to 5.
			-- Normally button 1 is the left mouse button, 2 is the middle
			-- button, and 3 is the right button. On 2-button mice, the middle
			-- button can often be simulated by pressing both mouse buttons
			-- together.
		do
			Result := gdk_event_button_get_button (handle)
		ensure
			Result.in_range (1, 5)
		end

-- Not implemented: GdkDevice *device; 	the device where the event originated.

	x_root: REAL_64 is
			-- the x coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_button_get_x_root (handle)
		end

	y_root: REAL_64 is
			-- the y coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_button_get_y_root (handle)
		end

-- feature -- size
-- 
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventButton)"
-- 		end

invariant is_event_button

end -- class GDK_EVENT_BUTTON
