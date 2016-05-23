note
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

class GDK_EVENT

inherit 
	C_STRUCT 
		redefine from_external_pointer end

insert
	GDK_EVENT_EXTERNALS
	GDK_EVENT_ANY_EXTERNALS
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

create {WRAPPER_HANDLER} from_external_pointer

feature {ANY} 
	from_external_pointer (a_pointer: POINTER) is
		do
			Precursor(a_pointer)
			debug
				std_error.put_string("GDK_EVENT.from_external_pointer: creating a generic GDK_EVENT of type "+type.out)
				if     is_event_motion then std_error.put_string(" motion ") 
				elseif is_event_button then std_error.put_string(" button ") 
				elseif is_event_scroll then std_error.put_string(" scroll ") 
				elseif is_event_key then std_error.put_string(" key ") 
				elseif is_event_focus then std_error.put_string(" focus ") 
				elseif is_event_crossing then std_error.put_string(" crossing ") 
				elseif is_event_expose then std_error.put_string(" expose ") 
				end
				std_error.put_line("from pointer "+a_pointer.out)
			end
		end
feature {ANY}
	
	type, event_type: INTEGER is
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

	is_event_scroll: BOOLEAN is
		do
			Result := event_type = gdk_event_scroll
		end

	is_event_key: BOOLEAN is
		do
			Result := (event_type = gdk_event_key_press) or else
						 (event_type = gdk_event_key_release)
		end

	is_event_focus: BOOLEAN is
		do
			Result := (event_type = gdk_event_focus_change)
		end

	is_event_crossing: BOOLEAN is
		do
			Result := (event_type = gdk_event_enter_notify) or else
						 (event_type = gdk_event_leave_notify)
		end

	is_event_expose: BOOLEAN is
		do
			Result := (event_type = gdk_event_expose)
		end

feature {ANY} -- Common fields 
	window: GDK_WINDOW is
			-- the window which received the event.
		local
			 factory: G_OBJECT_EXPANDED_FACTORY[GDK_WINDOW]
		do
			if internal_window=Void then
				internal_window := factory.existant_wrapper (gdk_event_any_get_window (handle))
			end
			Result:=internal_window
		end

	send_event: BOOLEAN is
			-- 	TRUE if the event was sent explicitly (e.g. using XSendEvent).
		do
			Result := gdk_event_any_get_send_event (handle).to_boolean
		end

feature {ANY} -- Memory handling

	dispose is
		do
			-- TODO: See if this class could be an EIFFEL_OWNED heir.

			-- Note that dispose is public for this class. This is
			-- because it can be called when knowing that the event will
			-- no longer be valid (i.e, deallocated by C)
			if handle.is_not_null then
				gdk_event_free (handle)
				handle:= default_pointer
			end
		end

	struct_size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkEvent)"
		end

	internal_window: GDK_WINDOW

	invariant handle_is_not_null: is_not_null
end -- class GDK_EVENT
