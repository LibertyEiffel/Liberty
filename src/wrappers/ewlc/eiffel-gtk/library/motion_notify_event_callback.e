note
	description: "Generic callback for the motion-notify-event signal"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, eiffel-libraries team,  GTK+ team and others
					
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
	revision "$Revision:$"

class MOTION_NOTIFY_EVENT_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_WIDGET]

create {ANY} make

feature {ANY}
	object: GTK_WIDGET

feature {ANY}
	callback (motion_event_ptr: POINTER; instance: POINTER): INTEGER
		local
			motion_event: GDK_EVENT_MOTION
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			-- The following is written with the implicit requirement 
			-- that the object is actually created by the Eiffel 
			object := wrapper(instance)
			create motion_event.from_external_pointer (motion_event_ptr)
			Result := function.item ([motion_event, object]).to_integer
			-- GTK is about to release this event, detach it from Eiffel
			motion_event.dispose
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_WIDGET; a_function: FUNCTION [ANY, TUPLE [GDK_EVENT_MOTION, GTK_WIDGET], BOOLEAN])
		do
			debug
				print ("MOTION_NOTIFY_EVENT_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
			
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before default handler
																)
			function:=a_function
		end

		signal_name: STRING is "motion-notify-event"

	function: FUNCTION [ANY, TUPLE [GDK_EVENT_MOTION, GTK_WIDGET], BOOLEAN]

end
