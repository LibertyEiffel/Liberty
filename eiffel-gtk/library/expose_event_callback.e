indexing
	description: "Generic callback for the expose-event signal"
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


class EXPOSE_EVENT_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_WIDGET] undefine copy, is_equal end

creation dummy, make

feature
	object: GTK_WIDGET
	expose_event: GDK_EVENT_EXPOSE
	
feature
	callback (a_widget_ptr, an_expose_event_ptr, instance: POINTER): INTEGER is
		do
			debug
				print("callback(a_widget=") print(a_widget_ptr.to_string)
				print(", an_expose_event") print(an_expose_event_ptr.to_string)
				print(", instance=") print(instance.to_string) print (")%N")
			end
			check
				widget_not_null: a_widget_ptr.is_not_null
				expose_event_not_null: an_expose_eventptr.is_not_null
			end
			object := wrapper(instance)
			create expose_event.from_external_pointer(an_expose_event_ptr)
			
			Result:= (function.item([object,expose_event])).to_integer
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_WIDGET; a_function: FUNCTION[ANY, TUPLE [GTK_WIDGET, GDK_EVENT_EXPOSE], BOOLEAN]) is
		do
			debug
				print ("EXPOSE_EVENT_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
			
			handler_id := g_signal_connect_closure (an_object.handle,signal_name.to_external,handle,0)
			-- 0 i.e. call it before default handler
			function:=a_function
		end

		signal_name: STRING is "expose-event"

		function: FUNCTION[ANY, TUPLE [GTK_WIDGET, GDK_EVENT_EXPOSE], BOOLEAN]
end
