note
	description: "Event generated when the pointer enters or leaves a window."
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

class GDK_EVENT_CROSSING

inherit
	GDK_EVENT

insert
	GDK_EVENT_CROSSING_EXTERNALS
	GDK_MODIFIER_TYPE
	GDK_CROSSING_MODE
	GDK_NOTIFY_TYPE

create {ANY} from_external_pointer

feature {ANY} -- access

	subwindow: GDK_WINDOW
			-- the window that was entered or left.
		local
			window_ptr: POINTER; factory: G_OBJECT_FACTORY[GDK_WINDOW]
		do
			window_ptr := gdk_event_crossing_get_subwindow (handle)
			Result := factory.existant_wrapper (window_ptr)
			if Result=Void then
				create Result.from_external_pointer (window_ptr)
			end
		end

	time: INTEGER
			-- the time of the event in milliseconds.
		do
			Result := gdk_event_crossing_get_time (handle)
		end

	x: REAL_64
			-- the x coordinate of the pointer relative to the window.
		do
			Result := gdk_event_crossing_get_x (handle)
		end

	y: REAL_64
			-- the y coordinate of the pointer relative to the window.
		do
			Result := gdk_event_crossing_get_y (handle)
		end

	x_root: REAL_64
			-- the x coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_crossing_get_x_root (handle)
		end

	y_root: REAL_64
			-- the y coordinate of the pointer relative to the root of the screen.
		do
			Result := gdk_event_crossing_get_y_root (handle)
		end

	mode: INTEGER
		do
			Result := gdk_event_crossing_get_mode (handle)
		ensure
			is_valid_gdk_crossing_mode (Result)
		end

	detail: INTEGER
		do
			Result := gdk_event_crossing_get_detail (handle)
		ensure
			is_valid_gdk_notify_type (Result)
		end

	focus: BOOLEAN
		do
			Result := gdk_event_crossing_get_focus (handle).to_boolean
		end

	state: INTEGER
			-- a bit-mask representing the state of the modifier keys
			-- (e.g. Control, Shift and Alt) and the pointer buttons.
			-- See GDK_MODIFIER_TYPE.
		do
			Result := gdk_event_crossing_get_state (handle)
		ensure
			is_valid_gdk_modifier_type (Result)
		end

-- feature -- size
-- 
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventCrossing)"
-- 		end
-- 
end -- class GDK_EVENT_CROSSING
 
