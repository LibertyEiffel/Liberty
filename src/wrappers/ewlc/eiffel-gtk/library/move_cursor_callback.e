note
	description: "Generic callback for the move-cursor signal"
	copyright: "[
					Copyright (C) 2007-2018: eiffel-libraries team,  GTK+ team and others
					
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

class MOVE_CURSOR_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_TEXT_VIEW]

create {ANY} make

feature {ANY}
	object: GTK_TEXT_VIEW

feature {ANY}
	callback (step, count, extend_selection: INTEGER; instance: POINTER)
		do
			-- The following is written with the implicit requirement 
			-- that the object is actually created by the Eiffel 
			object := wrapper(instance)

			procedure.call ([step, count, extend_selection.to_boolean, object])
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_TEXT_VIEW; a_procedure: PROCEDURE [ANY, TUPLE[INTEGER, INTEGER, BOOLEAN, GTK_TEXT_VIEW]])
		do
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle,
																 1 -- i.e. call it after default handler
																)
			procedure := a_procedure
		end

		signal_name: STRING is "move-cursor"

	procedure: PROCEDURE [ANY, TUPLE[INTEGER, INTEGER, BOOLEAN, GTK_TEXT_VIEW]]

end -- class MOVE_CURSOR_CALLBACK
