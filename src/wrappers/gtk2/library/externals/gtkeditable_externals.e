-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEDITABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_editable_delete_selection (an_editable: POINTER) is
 		-- gtk_editable_delete_selection (node at line 1238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_delete_selection"
		}"
		end

	gtk_editable_get_type: NATURAL_64 is
 		-- gtk_editable_get_type (node at line 3958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_type()"
		}"
		end

	gtk_editable_set_position (an_editable: POINTER; a_position: INTEGER_32) is
 		-- gtk_editable_set_position (node at line 15759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_set_position"
		}"
		end

	gtk_editable_get_position (an_editable: POINTER): INTEGER_32 is
 		-- gtk_editable_get_position (node at line 17020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_position"
		}"
		end

	gtk_editable_copy_clipboard (an_editable: POINTER) is
 		-- gtk_editable_copy_clipboard (node at line 21905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_copy_clipboard"
		}"
		end

	gtk_editable_get_chars (an_editable: POINTER; a_start_pos: INTEGER_32; an_end_pos: INTEGER_32): POINTER is
 		-- gtk_editable_get_chars (node at line 23343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_chars"
		}"
		end

	gtk_editable_set_editable (an_editable: POINTER; an_is_editable: INTEGER_32) is
 		-- gtk_editable_set_editable (node at line 24395)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_set_editable"
		}"
		end

	gtk_editable_cut_clipboard (an_editable: POINTER) is
 		-- gtk_editable_cut_clipboard (node at line 24573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_cut_clipboard"
		}"
		end

	gtk_editable_delete_text (an_editable: POINTER; a_start_pos: INTEGER_32; an_end_pos: INTEGER_32) is
 		-- gtk_editable_delete_text (node at line 26400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_delete_text"
		}"
		end

	gtk_editable_insert_text (an_editable: POINTER; a_new_text: POINTER; a_new_text_length: INTEGER_32; a_position: POINTER) is
 		-- gtk_editable_insert_text (node at line 26865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_insert_text"
		}"
		end

	gtk_editable_select_region (an_editable: POINTER; a_start_pos: INTEGER_32; an_end_pos: INTEGER_32) is
 		-- gtk_editable_select_region (node at line 28332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_select_region"
		}"
		end

	gtk_editable_get_editable (an_editable: POINTER): INTEGER_32 is
 		-- gtk_editable_get_editable (node at line 28610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_editable"
		}"
		end

	gtk_editable_paste_clipboard (an_editable: POINTER) is
 		-- gtk_editable_paste_clipboard (node at line 36528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_paste_clipboard"
		}"
		end

	gtk_editable_get_selection_bounds (an_editable: POINTER; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER_32 is
 		-- gtk_editable_get_selection_bounds (node at line 40334)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_selection_bounds"
		}"
		end


end -- class GTKEDITABLE_EXTERNALS
