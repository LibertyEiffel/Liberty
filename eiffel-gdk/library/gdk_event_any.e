indexing
	description: "Contains the fields which are common to all events"
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

class GDK_EVENT_ANY

inherit
	SHARED_C_STRUCT
		redefine
			dispose
		end
insert
	G_OBJECT_FACTORY [GDK_WINDOW]
	GDK_EVENT_ANY_EXTERNALS
	GDK_EVENT_TYPE

creation  from_event, from_external_pointer

feature {} -- Creation

	from_event (a_event: GDK_EVENT) is
		obsolete "GDK_EVENT_ANY.from_event should not be necessary with the new memory handling design"
		require
			a_event /= Void
		do
			event := a_event
			set_shared
			from_external_pointer (event.handle)
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkEventAny)"
		end

feature -- access

	type: INTEGER is
			-- the type of the event.  See GDK_EVENT_TYPE for possible values
		do
			Result := event.event_type
		ensure
			is_valid_gdk_event_type (Result)
		end

	window: GDK_WINDOW is
			-- the window which received the event.
		do
			Result := wrapper(gdk_event_any_get_window(handle))
		end

	send_event: BOOLEAN is
			-- 	TRUE if the event was sent explicitly (e.g. using XSendEvent).
		do
			Result := gdk_event_any_get_send_event (handle).to_boolean
		end

feature -- Operations

	dispose is
		do
			-- Note that dispose is public for this class. This is because
			-- it can be called when knowing that the event will no longer
			-- be valid (i.e, deallocated by C)
			if handle.is_not_null then
				if not is_shared then
					gdk_event_free (handle)
				end
				handle:= default_pointer
				event.dispose -- instead of event := Void
			end
		end


feature {WRAPPER} -- Representation

	event: GDK_EVENT
		-- This feature is needed to ensure correct garbage collection.
		-- As this class (and all GDK_EVENT_* classes) are SHARED_C_STRUCTs,
		-- we shouldn't release the GDK_EVENT until all GDK_EVENT_*s are
		-- disposed.

invariant

	event /= Void

end -- class GDK_EVENT_ANY
