note
	description: "Generic callback for the select-all signal"
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

class SELECT_ALL_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_TEXT_VIEW]

create {ANY} make

feature {ANY}

	object: GTK_TEXT_VIEW

feature {ANY}

	callback (select_all: INTEGER; instance: POINTER) is
		require
			instance_not_null: instance.is_not_null
		do
			object := wrapper(instance)
			procedure.call ([object, select_all.to_boolean])
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: like object; a_procedure: like procedure) is
		require
			an_object /= Void
			a_procedure /= Void
		do
			handler_id := g_signal_connect_closure (an_object.handle, signal_name.to_external,
																 handle, 0) -- i.e. call it before default handler
			procedure := a_procedure
		end

	signal_name: STRING is "select-all"

	procedure: PROCEDURE [ANY, TUPLE [like object, BOOLEAN]]

end -- class SELECT_ALL_CALLBACK
