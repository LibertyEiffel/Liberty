indexing
	description: "Generic callback for the button-release-event and button-pressed-event signals"
	copyright: "[
					Copyright (C) 2006 Paolo redaelli, eiffel-libraries team,  GTK+ team and others
					
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

deferred class BUTTON_EVENT_CALLBACK
	-- You want to use one of BUTTON_EVENT_RELEASE_CALLBACK or BUTTON_EVENT_PRESS_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_RETRIEVER [GTK_WIDGET]

feature
	object: GTK_WIDGET

feature
	callback (event_button: POINTER; instance: POINTER): INTEGER is
		local
			event_obj: GDK_EVENT
			r: BOOLEAN
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			check
				eiffel_created_the_widget: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			create event_obj.from_external_pointer (event_button)
			check
				is_a_button_event: event_obj.is_event_button
			end
			r := function.item ([event_obj.event_button, object])
			if r then Result := 1 end
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_WIDGET; a_function: FUNCTION [ANY, TUPLE [GDK_EVENT_BUTTON, GTK_WIDGET], BOOLEAN]) is
		do
			handler_id := g_signal_connect_closure (an_object.handle,
			                                        signal_name.to_external,
			                                        handle,
			                                        0 -- i.e. call it before default handler
			                                       )
			function := a_function
		end

	function: FUNCTION [ANY, TUPLE [GDK_EVENT_BUTTON, GTK_WIDGET], BOOLEAN]

end -- class BUTTON_EVENT_CALLBACK
