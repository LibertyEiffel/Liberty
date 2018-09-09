note
	description: "Callback for the color-set signal"
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, Anthony Lenton, eiffel-libraries team,  GTK+ team and others
					
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

class COLOR_SET_CALLBACK

inherit
	CALLBACK
		redefine
			object
		end

insert G_OBJECT_FACTORY [GTK_COLOR_BUTTON]

create {ANY} make

feature {ANY}
	object: GTK_COLOR_BUTTON

feature {ANY}

	callback (instance: POINTER)
		do
			-- The following is written with the implicit requirement 
			-- that object actually has an Eiffel wrapper.
			object := wrapper(instance)
			procedure.call ([object])
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_COLOR_BUTTON; a_procedure: like procedure)
		do
			handler_id := g_signal_connect_closure (an_object.handle,
													 signal_name.to_external,
													 handle,
													 0 -- i.e. call it before default handler
													 )
			procedure := a_procedure
		end

	signal_name: STRING is "color-set"

	procedure: PROCEDURE [ANY, TUPLE[GTK_COLOR_BUTTON]]

end
