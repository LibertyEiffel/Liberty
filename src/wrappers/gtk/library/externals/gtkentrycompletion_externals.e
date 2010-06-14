-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRYCOMPLETION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_completion_delete_action (a_completion: POINTER; an_index: INTEGER_32) is
 		-- gtk_entry_completion_delete_action (node at line 2448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_delete_action"
		}"
		end

	gtk_entry_completion_insert_action_text (a_completion: POINTER; an_index: INTEGER_32; a_text: POINTER) is
 		-- gtk_entry_completion_insert_action_text (node at line 8189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_text"
		}"
		end

	gtk_entry_completion_get_popup_completion (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_completion (node at line 8420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_completion"
		}"
		end

	gtk_entry_completion_get_inline_completion (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_inline_completion (node at line 9501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_completion"
		}"
		end

	gtk_entry_completion_get_minimum_key_length (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_minimum_key_length (node at line 10535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_minimum_key_length"
		}"
		end

	gtk_entry_completion_set_minimum_key_length (a_completion: POINTER; a_length: INTEGER_32) is
 		-- gtk_entry_completion_set_minimum_key_length (node at line 12880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_minimum_key_length"
		}"
		end

	gtk_entry_completion_get_entry (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_entry (node at line 13053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_entry"
		}"
		end

	gtk_entry_completion_insert_prefix (a_completion: POINTER) is
 		-- gtk_entry_completion_insert_prefix (node at line 13990)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_prefix"
		}"
		end

	gtk_entry_completion_set_inline_completion (a_completion: POINTER; an_inline_completion: INTEGER_32) is
 		-- gtk_entry_completion_set_inline_completion (node at line 14132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_completion"
		}"
		end

	gtk_entry_completion_set_text_column (a_completion: POINTER; a_column: INTEGER_32) is
 		-- gtk_entry_completion_set_text_column (node at line 18913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_text_column"
		}"
		end

	gtk_entry_completion_set_popup_set_width (a_completion: POINTER; a_popup_set_width: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_set_width (node at line 19203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_set_width"
		}"
		end

	gtk_entry_completion_get_inline_selection (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_inline_selection (node at line 19399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_selection"
		}"
		end

	gtk_entry_completion_get_completion_prefix (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_completion_prefix (node at line 23472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_completion_prefix"
		}"
		end

	gtk_entry_completion_set_inline_selection (a_completion: POINTER; an_inline_selection: INTEGER_32) is
 		-- gtk_entry_completion_set_inline_selection (node at line 24307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_selection"
		}"
		end

	gtk_entry_completion_set_popup_completion (a_completion: POINTER; a_popup_completion: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_completion (node at line 24728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_completion"
		}"
		end

	gtk_entry_completion_get_model (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_model (node at line 25127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_model"
		}"
		end

	gtk_entry_completion_new: POINTER is
 		-- gtk_entry_completion_new (node at line 26995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_new()"
		}"
		end

	gtk_entry_completion_complete (a_completion: POINTER) is
 		-- gtk_entry_completion_complete (node at line 29052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_complete"
		}"
		end

	gtk_entry_completion_get_type: NATURAL_32 is
 		-- gtk_entry_completion_get_type (node at line 29356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_type()"
		}"
		end

	gtk_entry_completion_get_popup_set_width (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_set_width (node at line 30447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_set_width"
		}"
		end

	gtk_entry_completion_get_text_column (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_text_column (node at line 31550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_text_column"
		}"
		end

	gtk_entry_completion_set_model (a_completion: POINTER; a_model: POINTER) is
 		-- gtk_entry_completion_set_model (node at line 33728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_model"
		}"
		end

	gtk_entry_completion_insert_action_markup (a_completion: POINTER; an_index: INTEGER_32; a_markup: POINTER) is
 		-- gtk_entry_completion_insert_action_markup (node at line 33800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_markup"
		}"
		end

	gtk_entry_completion_get_popup_single_match (a_completion: POINTER): INTEGER_32 is
 		-- gtk_entry_completion_get_popup_single_match (node at line 34753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_single_match"
		}"
		end

	gtk_entry_completion_set_popup_single_match (a_completion: POINTER; a_popup_single_match: INTEGER_32) is
 		-- gtk_entry_completion_set_popup_single_match (node at line 36834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_single_match"
		}"
		end

	gtk_entry_completion_set_match_func (a_completion: POINTER; a_func: POINTER; a_func_data: POINTER; a_func_notify: POINTER) is
 		-- gtk_entry_completion_set_match_func (node at line 37631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_match_func"
		}"
		end


end -- class GTKENTRYCOMPLETION_EXTERNALS
