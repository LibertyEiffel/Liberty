note
	description: "Generic callback for the insert-at-cursor signal"
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team,  GTK+ team and others
					
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

class INSERT_AT_CURSOR_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_TEXT_VIEW]

create {ANY} make

feature {ANY}
	object: GTK_TEXT_VIEW

feature {ANY}

	callback (an_arg, instance: POINTER)
		local
			input: STRING
		do
			object := wrapper(instance)
			create input.from_external (an_arg) 
			-- We might have to do an from_external_copy here
			-- instead. The GTK documentation does not say it is const,
			-- so we should handle its memory, AFAIK. Paolo 2008-04-07
			procedure.call ([input, object])
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_TEXT_VIEW; a_procedure: PROCEDURE [ANY, TUPLE[STRING, GTK_TEXT_VIEW]])
		do
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before the default handler
																)
			procedure := a_procedure
		end

		signal_name: STRING is "insert-at-cursor"

	procedure: PROCEDURE [ANY, TUPLE[STRING, GTK_TEXT_VIEW]]

end -- class INSERT_AT_CURSOR_CALLBACK
