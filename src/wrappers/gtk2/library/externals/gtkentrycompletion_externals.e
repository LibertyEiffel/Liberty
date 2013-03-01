-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRYCOMPLETION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_completion_delete_action (a_completion: POINTER; an_index: INTEGER_32) is
 		-- gtk_entry_completion_delete_action (node at line 2322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_delete_action"
		}"
		end

	gtk_entry_completion_insert_action_text (a_completion: POINTER; an_index: INTEGER_32; a_text: POINTER) is
 		-- gtk_entry_completion_insert_action_text (node at line 8857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_text"
		}"
		end

	gtk_entry_completion_get_popup_completion (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_completion (node at line 9100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_completion"
		}"
		end

	gtk_entry_completion_get_minimum_key_length (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_minimum_key_length (node at line 11468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_minimum_key_length"
		}"
		end

	gtk_entry_completion_set_minimum_key_length (a_completion: POINTER; a_length: INTEGER_32) is
 		-- gtk_entry_completion_set_minimum_key_length (node at line 13994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_minimum_key_length"
		}"
		end

	gtk_entry_completion_get_entry (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_entry (node at line 14167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_entry"
		}"
		end

	gtk_entry_completion_set_inline_completion (a_completion: POINTER; an_inline_completion: INTEGER_32) is
 		-- gtk_entry_completion_set_inline_completion (node at line 15261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_completion"
		}"
		end

	gtk_entry_completion_set_text_column (a_completion: POINTER; a_column: INTEGER_32) is
 		-- gtk_entry_completion_set_text_column (node at line 20659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_text_column"
		}"
		end

	gtk_entry_completion_set_popup_set_width (a_completion: POINTER; a_popup_set_width: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_set_width (node at line 21030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_set_width"
		}"
		end

	gtk_entry_completion_get_inline_selection (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_inline_selection (node at line 21289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_selection"
		}"
		end

	gtk_entry_completion_set_inline_selection (a_completion: POINTER; an_inline_selection: INTEGER_32) is
 		-- gtk_entry_completion_set_inline_selection (node at line 26846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_selection"
		}"
		end

	gtk_entry_completion_set_popup_completion (a_completion: POINTER; a_popup_completion: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_completion (node at line 27283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_completion"
		}"
		end

	gtk_entry_completion_get_model (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_model (node at line 27853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_model"
		}"
		end

	gtk_entry_completion_new: POINTER is
 		-- gtk_entry_completion_new (node at line 29799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_new()"
		}"
		end

	gtk_entry_completion_insert_prefix (a_completion: POINTER) is
 		-- gtk_entry_completion_insert_prefix (node at line 31955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_prefix"
		}"
		end

	gtk_entry_completion_complete (a_completion: POINTER) is
 		-- gtk_entry_completion_complete (node at line 32059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_complete"
		}"
		end

	gtk_entry_completion_get_type: NATURAL_64 is
 		-- gtk_entry_completion_get_type (node at line 32401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_type()"
		}"
		end

	gtk_entry_completion_get_popup_set_width (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_set_width (node at line 33617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_set_width"
		}"
		end

	gtk_entry_completion_get_text_column (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_text_column (node at line 34905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_text_column"
		}"
		end

	gtk_entry_completion_get_completion_prefix (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_completion_prefix (node at line 37150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_completion_prefix"
		}"
		end

	gtk_entry_completion_set_model (a_completion: POINTER; a_model: POINTER) is
 		-- gtk_entry_completion_set_model (node at line 37246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_model"
		}"
		end

	gtk_entry_completion_insert_action_markup (a_completion: POINTER; an_index: INTEGER_32; a_markup: POINTER) is
 		-- gtk_entry_completion_insert_action_markup (node at line 37312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_markup"
		}"
		end

	gtk_entry_completion_get_popup_single_match (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_single_match (node at line 38280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_single_match"
		}"
		end

	gtk_entry_completion_get_inline_completion (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_inline_completion (node at line 38929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_completion"
		}"
		end

	gtk_entry_completion_set_popup_single_match (a_completion: POINTER; a_popup_single_match: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_single_match (node at line 40520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_single_match"
		}"
		end

	gtk_entry_completion_set_match_func (a_completion: POINTER; a_func: POINTER; a_func_data: POINTER; a_func_notify: POINTER) is
 		-- gtk_entry_completion_set_match_func (node at line 41341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_match_func"
		}"
		end


end -- class GTKENTRYCOMPLETION_EXTERNALS
