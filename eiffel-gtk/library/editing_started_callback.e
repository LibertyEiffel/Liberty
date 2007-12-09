indexing
	description: "Generic callback for the editing-started signal"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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

class EDITING_STARTED_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_RETRIEVER [GTK_CELL_RENDERER]

creation make

feature
	object: GTK_CELL_RENDERER

feature
	callback (editable, path, instance: POINTER) is
		local
			r: G_RETRIEVER [GTK_CELL_EDITABLE]
			editable_obj: GTK_CELL_EDITABLE
			path_obj: GTK_TREE_PATH
		do
			debug print ("Callback: instance=") print (instance.to_string) print ("%N") end
			check
				eiffel_created_the_widget: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			
			if r.has_eiffel_wrapper_stored (editable) then
				editable_obj := r.retrieve_eiffel_wrapper_from_gobject_pointer (editable)
			else
				-- FIXME: remove this quick and nasty ungly hack, we don't like to hard code
				-- a class name
				if r.type_name_from_gobject_pointer (editable).is_equal (once "GtkEntry") then
					create {GTK_ENTRY}editable_obj.from_external_pointer (editable)
				end
			end
			
			if not path.is_null then
				-- path is a const gchar *
				create path_obj.from_string (create {STRING}.from_external_copy (path))
			end
			procedure.call ([editable_obj, path_obj, object])
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_CELL_RENDERER; a_procedure: PROCEDURE [ANY, TUPLE[GTK_CELL_EDITABLE,
	                                                                          GTK_TREE_PATH, GTK_CELL_RENDERER]]) is
		do
			debug
				print ("EDITING_STARTED_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
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
			procedure:=a_procedure
		end

	signal_name: STRING is "editing-started"

	procedure: PROCEDURE [ANY, TUPLE[GTK_CELL_EDITABLE, GTK_TREE_PATH, GTK_CELL_RENDERER]]
end
