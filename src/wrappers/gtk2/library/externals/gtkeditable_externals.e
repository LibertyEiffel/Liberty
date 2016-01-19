-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEDITABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_editable_copy_clipboard (an_editable: POINTER) is
 		-- gtk_editable_copy_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_copy_clipboard"
		}"
		end

	gtk_editable_cut_clipboard (an_editable: POINTER) is
 		-- gtk_editable_cut_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_cut_clipboard"
		}"
		end

	gtk_editable_delete_selection (an_editable: POINTER) is
 		-- gtk_editable_delete_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_delete_selection"
		}"
		end

	gtk_editable_delete_text (an_editable: POINTER; a_start_pos: INTEGER; an_end_pos: INTEGER) is
 		-- gtk_editable_delete_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_delete_text"
		}"
		end

	gtk_editable_get_chars (an_editable: POINTER; a_start_pos: INTEGER; an_end_pos: INTEGER): POINTER is
 		-- gtk_editable_get_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_chars"
		}"
		end

	gtk_editable_get_editable (an_editable: POINTER): INTEGER is
 		-- gtk_editable_get_editable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_editable"
		}"
		end

	gtk_editable_get_position (an_editable: POINTER): INTEGER is
 		-- gtk_editable_get_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_position"
		}"
		end

	gtk_editable_get_selection_bounds (an_editable: POINTER; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER is
 		-- gtk_editable_get_selection_bounds
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_selection_bounds"
		}"
		end

	gtk_editable_get_type: like long_unsigned is
 		-- gtk_editable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_get_type()"
		}"
		end

	gtk_editable_insert_text (an_editable: POINTER; a_new_text: POINTER; a_new_text_length: INTEGER; a_position: POINTER) is
 		-- gtk_editable_insert_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_insert_text"
		}"
		end

	gtk_editable_paste_clipboard (an_editable: POINTER) is
 		-- gtk_editable_paste_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_paste_clipboard"
		}"
		end

	gtk_editable_select_region (an_editable: POINTER; a_start_pos: INTEGER; an_end_pos: INTEGER) is
 		-- gtk_editable_select_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_select_region"
		}"
		end

	gtk_editable_set_editable (an_editable: POINTER; an_is_editable: INTEGER) is
 		-- gtk_editable_set_editable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_set_editable"
		}"
		end

	gtk_editable_set_position (an_editable: POINTER; a_position: INTEGER) is
 		-- gtk_editable_set_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_editable_set_position"
		}"
		end


end -- class GTKEDITABLE_EXTERNALS
