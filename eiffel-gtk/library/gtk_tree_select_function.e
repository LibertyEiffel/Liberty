indexing
	description: "Generic callback for the destroy signal"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision "$Revision:$"
	
class GTK_TREE_SELECT_FUNCTION
inherit WRAPPER_HANDLER -- It wraps a callback function
insert
	G_OBJECT_RETRIEVER [GTK_TREE_MODEL]
	GTK_TREE_SELECTION_EXTERNALS
creation make
feature
	make (a_selection: GTK_TREE_SELECTION; a_function: FUNCTION[ANY,TUPLE[GTK_TREE_SELECTION, GTK_TREE_MODEL, GTK_TREE_PATH, BOOLEAN],BOOLEAN]) is
		local array: NATIVE_ARRAY [POINTER]; callback_ptr: POINTER
		do
	function := a_function
	gtk_tree_selection_set_select_function (a_selection.handle, 
						 $low_level_callback, -- selection function
						 callback_array ($callback), -- The selection function's data.
						 default_pointer -- destroy function for user data. May be and indeed it is NULL.
						 )
		end
	
feature {NONE} -- 
	callback_array (a_callback_pointer: POINTER): POINTER is
		-- This call is required because we need to build an array with 
		-- the address of an Eiffel feature (namely callback). `$' 
		-- operator thought can be used only in a feature call. Hence this.
		do
	Result:= {NATIVE_ARRAY[POINTER] <<a_callback_pointer ,Current.to_pointer>>}.to_external
		end
	
	low_level_callback (selection, model, path: POINTER; path_currently_selected: INTEGER; data: POINTER): INTEGER is
	-- Low level callback will be called by GTK; it will call
	-- `callback'.
		external "C use <callbacks.h>"
		alias "EiffelGtkTreeSelectionFunc"
		end 

feature
	callback (selection_ptr, model_ptr,path_ptr: POINTER; path_currently_selected: INTEGER): INTEGER is --; instance: POINTER) is
		local
	a_selection: GTK_TREE_SELECTION;
	a_model: GTK_TREE_MODEL
	a_path: GTK_TREE_PATH
	r: G_RETRIEVER [GTK_TREE_SELECTION]
		do
	debug
		 print ("Gtk tree select function callback:")
		 print (" selection=") print(selection_ptr.to_string) 
		 print (" model=") print(model_ptr.to_string) 
		 print (" path=") print(path_ptr.to_string) 
		 print (" path_currently_selected=") print(path_currently_selected.to_string) 
		 --print (" instance=") print (instance.to_string)
		 print ("%N")
	end
	if r.has_eiffel_wrapper_stored (selection_ptr) then
		a_selection := r.eiffel_wrapper_from_gobject_pointer (selection_ptr)
	else
		create a_selection.from_external_pointer (selection_ptr)
	end
	a_model := eiffel_wrapper_from_gobject_pointer (model_ptr)
	debug
		 if a_model = Void then
			 print ("Warning! In GTK_TREE_SELECT_FUNCTION.callback model_ptr does not have a stored Eiffel wrapper. We cannot recreate it, since GTK_TREE_MODEL is deferred. This can be a bug or a source of other bugs. Be warned! Paolo 2006-05-03%N")
		 end
	end
	create a_path.from_external_pointer (path_ptr)
	Result := (function.item ([a_selection,a_model,a_path,
					 path_currently_selected.to_boolean]).to_integer)
		end
	
	function: FUNCTION[ANY,TUPLE[GTK_TREE_SELECTION, GTK_TREE_MODEL, GTK_TREE_PATH, BOOLEAN],BOOLEAN]
end
