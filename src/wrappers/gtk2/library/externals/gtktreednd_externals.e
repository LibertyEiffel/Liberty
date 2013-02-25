-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEDND_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_drag_dest_drag_data_received (a_drag_dest: POINTER; a_dest: POINTER; a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_tree_drag_dest_drag_data_received (node at line 16333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_dest_drag_data_received"
		}"
		end

	gtk_tree_drag_source_get_type: NATURAL_64 is
 		-- gtk_tree_drag_source_get_type (node at line 20264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_get_type()"
		}"
		end

	gtk_tree_drag_source_drag_data_get (a_drag_source: POINTER; a_path: POINTER; a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_tree_drag_source_drag_data_get (node at line 20737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_drag_data_get"
		}"
		end

	gtk_tree_drag_dest_get_type: NATURAL_64 is
 		-- gtk_tree_drag_dest_get_type (node at line 20847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_dest_get_type()"
		}"
		end

	gtk_tree_drag_source_row_draggable (a_drag_source: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_drag_source_row_draggable (node at line 21746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_row_draggable"
		}"
		end

	gtk_tree_drag_source_drag_data_delete (a_drag_source: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_drag_source_drag_data_delete (node at line 30501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_drag_data_delete"
		}"
		end

	gtk_tree_set_row_drag_data (a_selection_data: POINTER; a_tree_model: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_set_row_drag_data (node at line 31625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_set_row_drag_data"
		}"
		end

	gtk_tree_drag_dest_row_drop_possible (a_drag_dest: POINTER; a_dest_path: POINTER; a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_tree_drag_dest_row_drop_possible (node at line 34188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_dest_row_drop_possible"
		}"
		end

	gtk_tree_get_row_drag_data (a_selection_data: POINTER; a_tree_model: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_get_row_drag_data (node at line 39549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_get_row_drag_data"
		}"
		end


end -- class GTKTREEDND_EXTERNALS
