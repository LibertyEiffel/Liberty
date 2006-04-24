indexing
	description: "Generic callback for the destroy signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class GTK_TREE_SELECT_FUNCTION
inherit
	WRAPPER_HANDLER -- It wraps a callback function
insert
	G_OBJECT_RETRIEVER [GTK_TREE_MODEL]
	GTK_TREE_SELECTION_EXTERNALS
creation make
feature
	make (a_selection: GTK_TREE_SELECTION; a_function: FUNCTION[ANY,TUPLE[GTK_TREE_SELECTION, GTK_TREE_MODEL, GTK_TREE_PATH, BOOLEAN],BOOLEAN]) is
		do
			function := a_function
			gtk_tree_selection_set_select_function (a_selection.handle, 
																 $callback, -- selection function
																 a_function.to_pointer, -- The selection function's data.
																 default_pointer -- The destroy function for user data. May be and indeed it is NULL.
																 )
		end
	
feature
	callback (selection,model,path: POINTER; path_currently_selected: INTEGER) is --; instance: POINTER) is
		local
			a_selection: GTK_TREE_SELECTION;
			a_model: GTK_TREE_MODEL
			a_path: GTK_TREE_PATH
		do
			debug
				print ("Gtk tree select function callback:")
				print (" selection=") print(selection.to_string) 
				print (" model=") print(model.to_string) 
				print (" path=") print(path.to_string) 
				print (" path_currently_selected=") print(path_currently_selected.to_string) 
				--print (" instance=") print (instance.to_string)
				print ("%N")
			end
			create a_selection.from_external_pointer (selection)
			a_model := retrieve_eiffel_wrapper_from_gobject_pointer (model)
			create a_path.from_external_pointer (path)
			print ("function.call ([a_selection,a_model,a_path,path_currently_selected.to_boolean])%N")
		end

	function: FUNCTION[ANY,TUPLE[GTK_TREE_SELECTION, GTK_TREE_MODEL, GTK_TREE_PATH, BOOLEAN],BOOLEAN]
end
