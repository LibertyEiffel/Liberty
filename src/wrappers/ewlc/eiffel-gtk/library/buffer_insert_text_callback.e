note
	description: "Generic callback for the insert-text signal"
	copyright: "[
					Copyright (C) 2007-2017: eiffel-libraries team,  GTK+ team and others
					
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

class BUFFER_INSERT_TEXT_CALLBACK

inherit CALLBACK
	redefine
		object
	end

insert G_OBJECT_FACTORY [GTK_TEXT_BUFFER]

create {ANY} make

feature {ANY}
	object: GTK_TEXT_BUFFER

feature {ANY}

	callback (iter, string: POINTER; len: INTEGER; instance: POINTER)
		local
			iter_obj: GTK_TEXT_ITER
			input: STRING
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			-- The following is written with the implicit requirement 
			-- that object actually has an Eiffel wrapper
			object := wrapper(instance)

			create iter_obj.from_external_copy (iter)
			create input.from_external_copy (string)
			procedure.call ([iter_obj, input, object])
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_TEXT_BUFFER; a_procedure: PROCEDURE [ANY, TUPLE[GTK_TEXT_ITER, STRING, GTK_TEXT_BUFFER]])
		do
			handler_id := g_signal_connect_closure (an_object.handle,
													 signal_name.to_external,
													 handle,
													 1 -- i.e. call it before default handler
													 )
			procedure := a_procedure
		end

	signal_name: STRING is "insert-text"

	procedure: PROCEDURE [ANY, TUPLE[GTK_TEXT_ITER, STRING, GTK_TEXT_BUFFER]]

end -- class BUFFER_INSERT_TEXT_CALLBACK
