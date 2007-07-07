indexing
	description: "union GdkEvent"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

		-- The GdkEvent struct contains a union of all of the event
		-- structs, and allows access to the data fields in a number of
		-- ways.
		
		-- The event type is always the first field in all of the event
		-- structs, and can always be accessed with the following code, no
		-- matter what type of event it is:
		
		--  GdkEvent *event;
		--  GdkEventType type;
		--  type = event->type;
		
		-- To access other fields of the event structs, the pointer to
		-- the event can be cast to the appropriate event struct pointer,
		-- or the union member name can be used. For example if the event
		-- type is GDK_BUTTON_PRESS then the x coordinate of the button
		-- press can be accessed with:
		
		--  GdkEvent *event;
		--  gdouble x;
		--  x = ((GdkEventButton*)event)->x;
		--or:
		--  GdkEvent *event;
		--  gdouble x;
		--  x = event->button.x;

class GDK_EVENT

inherit
	SHARED_C_STRUCT
		redefine
			from_external_pointer,
			store_eiffel_wrapper, unstore_eiffel_wrapper, is_eiffel_wrapper_stored,
			dispose
		end

insert
	GDK_EVENT_EXTERNALS

creation from_external_pointer

feature -- size

	struct_size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkEvent)"
		end

feature -- Creation

	from_external_pointer (a_pointer: POINTER) is
		do
			set_shared
			Precursor (a_pointer)
		end

feature

--union GdkEvent
--{
--  GdkEventType		    type;
--  GdkEventAny		    any;
--  GdkEventExpose	    expose;
--  GdkEventNoExpose	    no_expose;
--  GdkEventVisibility	    visibility;
--  GdkEventMotion	    motion;
--  GdkEventButton	    button;
--  GdkEventScroll            scroll;
--  GdkEventKey		    key;
--  GdkEventCrossing	    crossing;
--  GdkEventFocus		    focus_change;
--  GdkEventConfigure	    configure;
--  GdkEventProperty	    property;
--  GdkEventSelection	    selection;
--  GdkEventOwnerChange  	    owner_change;
--  GdkEventProximity	    proximity;
--  GdkEventClient	    client;
--  GdkEventDND               dnd;
--  GdkEventWindowState       window_state;
--  GdkEventSetting           setting;
--  GdkEventGrabBroken        grab_broken;
--};

	event_type: INTEGER is
		do
			Result := gdk_event_type (handle)
		ensure
			is_valid_gdk_event_type (Result)
		end

	is_event_motion: BOOLEAN is
		do
			Result := event_type = gdk_event_motion_notify
		end

	is_event_button: BOOLEAN is
		do
			Result := (event_type = gdk_event_button_press) or else
					  (event_type = gdk_event_2button_press) or else
					  (event_type = gdk_event_3button_press) or else
					  (event_type = gdk_event_button_release)
		end

	is_event_key: BOOLEAN is
		do
			Result := (event_type = gdk_event_key_press) or else
					  (event_type = gdk_event_key_release)
		end

feature -- Convertion to different event types

	event_any: GDK_EVENT_ANY is
		do
			if wrappers.has (handle) then
				Result ::= wrappers.at(handle)
			else
				create Result.from_event (Current)
			end
		end

	event_motion: GDK_EVENT_MOTION is
		require
			is_event_motion
		do
			if wrappers.has (handle) then
				Result ::= wrappers.at(handle)
			else
				create Result.from_event (Current)
			end
		end

	event_button: GDK_EVENT_BUTTON is
		require
			is_event_button
		do
			if wrappers.has (handle) then
				Result ::= wrappers.at(handle)
			else
				create Result.from_event (Current)
			end
		end

	event_key: GDK_EVENT_KEY is
		require
			is_event_key
		do
			if wrappers.has (handle) then
				Result ::= wrappers.at(handle)
			else
				create Result.from_event (Current)
			end
		end

feature

	store_eiffel_wrapper is
		do
		end

	unstore_eiffel_wrapper is
		do
		end

	is_eiffel_wrapper_stored: BOOLEAN is True

feature {GDK_EVENT_ANY}

	dispose is
		do
			handle := default_pointer
			-- Nothing else to do, this is always shared and not stored
			-- in the dictionary
		end

invariant
	is_shared
end
