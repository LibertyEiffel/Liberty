note
	description: "Generic callback for the format-value signal"
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, eiffel-libraries team,  GTK+ team and others
					
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

class FORMAT_VALUE_CALLBACK

inherit CALLBACK redefine object end

insert
	G_OBJECT_FACTORY[GTK_SCALE]
	GLIB_STRING_UTILITY_FUNCTIONS

create {ANY} make

feature {ANY}
	object: GTK_SCALE

feature {ANY}
	callback (value: REAL; instance: POINTER): POINTER
		require
			instance_not_null: instance.is_not_null
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
				print ("is_object: "+g_is_object (instance).out+"%N")
				print ("type: "+g_object_type (instance).out+"%N")
			end
			object := wrapper(instance)
			Result := g_strdup (function.item ([value, object]).to_external)
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_SCALE; a_function: FUNCTION[ANY, TUPLE [REAL, GTK_SCALE], STRING])
		do
			debug
				print ("FORMAT_VALUE_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
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

	signal_name: STRING is "format-value"

	function: FUNCTION[ANY, TUPLE [REAL, GTK_SCALE], STRING]

end
