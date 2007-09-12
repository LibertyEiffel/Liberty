indexing
	description: "Generic callback for the drag-drop signal"
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

class DRAG_DROP_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_RETRIEVER [GTK_WIDGET]

creation dummy, make

feature
	object: GTK_WIDGET

feature
	callback (drag_context: POINTER; x, y, time: INTEGER; instance: POINTER): INTEGER is
		require
			--time >= 0
		local
			r_drag_context: G_RETRIEVER [GDK_DRAG_CONTEXT]
			drag_context_obj: GDK_DRAG_CONTEXT
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			check
				eiffel_created_the_widget: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			
			if r_drag_context.has_eiffel_wrapper_stored (drag_context) then
				drag_context_obj := r_drag_context.retrieve_eiffel_wrapper_from_gobject_pointer (drag_context)
			else
				create drag_context_obj.from_external_pointer (drag_context)
			end
			
			Result := function.item ([drag_context_obj, x, y, time, object]).to_integer
		ensure
			--time >= 0
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_WIDGET; a_function: FUNCTION [ANY, TUPLE [GDK_DRAG_CONTEXT, INTEGER, INTEGER,
																							INTEGER, GTK_WIDGET], BOOLEAN]) is
		do
			debug
				print ("DRAG_DROP_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
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

		signal_name: STRING is "drag-drop"

	function: FUNCTION [ANY, TUPLE [GDK_DRAG_CONTEXT, INTEGER, INTEGER, INTEGER, GTK_WIDGET], BOOLEAN]

end
