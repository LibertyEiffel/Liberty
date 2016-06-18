note
	description: "Used for key press and key release events."
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, GTK+ team
					
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

class GDK_EVENT_KEY

inherit GDK_EVENT

insert
	GDK_EVENT_KEY_EXTERNALS
	GDK_MODIFIER_TYPE

create {ANY} from_external_pointer

feature {ANY} -- access

	time: INTEGER
			-- the time of the event in milliseconds.
		do
			Result := gdk_event_key_get_time (handle)
		end

	state: INTEGER
			-- a bit-mask representing the state of the modifier keys
			-- (e.g. Control, Shift and Alt) and the pointer buttons.
			-- See GDK_MODIFIER_TYPE.
		do
			Result := gdk_event_key_get_state (handle)
		ensure
			is_valid_gdk_modifier_type (Result)
		end

	key_value: INTEGER
			-- the key that was pressed or released. See the 
			-- <gdk/gdkkeysyms.h> header file for a complete list of GDK
			-- key codes.
		do
			Result := gdk_event_key_get_keyval (handle)
		end

-- feature -- size
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventKey)"
-- 		end

end -- class GDK_EVENT_KEY
