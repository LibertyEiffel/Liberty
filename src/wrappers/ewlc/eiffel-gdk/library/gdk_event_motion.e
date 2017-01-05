note
	description: "Event generated when the pointer moves."
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

class GDK_EVENT_MOTION

inherit GDK_EVENT

insert
	GDK_EVENT_MOTION_EXTERNALS
	GDK_MODIFIER_TYPE

create {ANY} from_external_pointer

feature {ANY} -- access

	time: INTEGER
			-- the time of the event in milliseconds.
		do
			Result := gdk_event_motion_get_time (handle)
		end

	x: REAL_64
			-- the x coordinate of the pointer relative to the window.
		do
			Result := gdk_event_motion_get_x (handle)
		end

	y: REAL_64
			-- the y coordinate of the pointer relative to the window.
		do
			Result := gdk_event_motion_get_y (handle)
		end

	axes: TUPLE [REAL_64, REAL_64]
			-- x, y translated to the axes of device, or Void if device is the mouse.
		local
			device_axes: NATIVE_ARRAY [REAL_64]
		do
			device_axes := device_axes.from_pointer (gdk_event_motion_get_axes (handle))
			if device_axes.is_not_null then
				Result := [device_axes.item (0), device_axes.item (1)]
			end
		end

	state: INTEGER
			-- a bit-mask representing the state of the modifier keys
			-- (e.g. Control, Shift and Alt) and the pointer buttons.
			-- See GDK_MODIFIER_TYPE.
		do
			Result := gdk_event_motion_get_state (handle)
		ensure
			is_valid_gdk_modifier_type (Result)
		end

	is_hint: BOOLEAN
			-- Returns True if this event is just a hint, see the
			-- gdk_pointer_motion_hint_mask value in GDK_EVENT_MASK.
		do
			Result := gdk_event_motion_get_is_hint (handle) = 1
		end

-- Not implemented: GdkDevice *device; 	the device where the event originated.

	x_root: REAL_64
			-- the x coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_motion_get_x_root (handle)
		end

	y_root: REAL_64
			-- the y coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_motion_get_y_root (handle)
		end

-- feature -- size
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventMotion)"
-- 		end

invariant is_event_motion

end -- class GDK_EVENT_MOTION
