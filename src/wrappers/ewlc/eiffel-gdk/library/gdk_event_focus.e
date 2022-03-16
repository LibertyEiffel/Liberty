note
	description: "Describes a change of keyboard focus."
	copyright: "[
					Copyright (C) 2007-2022: eiffel-libraries team, GTK+ team
					
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

class GDK_EVENT_FOCUS

inherit GDK_EVENT

insert
	GDK_EVENT_FOCUS_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} -- access

	in: BOOLEAN
			-- True if the window has gained the keyboard focus,
			-- False if it has lost the focus.
		do
			Result := gdk_event_focus_get_in (handle).to_boolean
		end

-- feature -- size
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventFocus)"
-- 		end

invariant is_event_focus

end -- class GDK_EVENT_FOCUS
