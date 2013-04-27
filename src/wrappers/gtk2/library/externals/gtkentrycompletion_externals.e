-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRYCOMPLETION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_completion_complete (a_completion: POINTER) is
 		-- gtk_entry_completion_complete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_complete"
		}"
		end

	gtk_entry_completion_delete_action (a_completion: POINTER; an_index: INTEGER) is
 		-- gtk_entry_completion_delete_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_delete_action"
		}"
		end

	gtk_entry_completion_get_completion_prefix (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_completion_prefix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_completion_prefix"
		}"
		end

	gtk_entry_completion_get_entry (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_entry"
		}"
		end

	gtk_entry_completion_get_inline_completion (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_inline_completion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_completion"
		}"
		end

	gtk_entry_completion_get_inline_selection (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_inline_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_inline_selection"
		}"
		end

	gtk_entry_completion_get_minimum_key_length (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_minimum_key_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_minimum_key_length"
		}"
		end

	gtk_entry_completion_get_model (a_completion: POINTER): POINTER is
 		-- gtk_entry_completion_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_model"
		}"
		end

	gtk_entry_completion_get_popup_completion (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_popup_completion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_completion"
		}"
		end

	gtk_entry_completion_get_popup_set_width (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_popup_set_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_set_width"
		}"
		end

	gtk_entry_completion_get_popup_single_match (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_popup_single_match
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_popup_single_match"
		}"
		end

	gtk_entry_completion_get_text_column (a_completion: POINTER): INTEGER is
 		-- gtk_entry_completion_get_text_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_text_column"
		}"
		end

	gtk_entry_completion_get_type: like long_unsigned is
 		-- gtk_entry_completion_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_get_type()"
		}"
		end

	gtk_entry_completion_insert_action_markup (a_completion: POINTER; an_index: INTEGER; a_markup: POINTER) is
 		-- gtk_entry_completion_insert_action_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_markup"
		}"
		end

	gtk_entry_completion_insert_action_text (a_completion: POINTER; an_index: INTEGER; a_text: POINTER) is
 		-- gtk_entry_completion_insert_action_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_action_text"
		}"
		end

	gtk_entry_completion_insert_prefix (a_completion: POINTER) is
 		-- gtk_entry_completion_insert_prefix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_insert_prefix"
		}"
		end

	gtk_entry_completion_new: POINTER is
 		-- gtk_entry_completion_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_new()"
		}"
		end

	gtk_entry_completion_set_inline_completion (a_completion: POINTER; an_inline_completion: INTEGER) is
 		-- gtk_entry_completion_set_inline_completion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_completion"
		}"
		end

	gtk_entry_completion_set_inline_selection (a_completion: POINTER; an_inline_selection: INTEGER) is
 		-- gtk_entry_completion_set_inline_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_inline_selection"
		}"
		end

	gtk_entry_completion_set_match_func (a_completion: POINTER; a_func: POINTER; a_func_data: POINTER; a_func_notify: POINTER) is
 		-- gtk_entry_completion_set_match_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_match_func"
		}"
		end

	gtk_entry_completion_set_minimum_key_length (a_completion: POINTER; a_length: INTEGER) is
 		-- gtk_entry_completion_set_minimum_key_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_minimum_key_length"
		}"
		end

	gtk_entry_completion_set_model (a_completion: POINTER; a_model: POINTER) is
 		-- gtk_entry_completion_set_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_model"
		}"
		end

	gtk_entry_completion_set_popup_completion (a_completion: POINTER; a_popup_completion: INTEGER) is
 		-- gtk_entry_completion_set_popup_completion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_completion"
		}"
		end

	gtk_entry_completion_set_popup_set_width (a_completion: POINTER; a_popup_set_width: INTEGER) is
 		-- gtk_entry_completion_set_popup_set_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_set_width"
		}"
		end

	gtk_entry_completion_set_popup_single_match (a_completion: POINTER; a_popup_single_match: INTEGER) is
 		-- gtk_entry_completion_set_popup_single_match
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_popup_single_match"
		}"
		end

	gtk_entry_completion_set_text_column (a_completion: POINTER; a_column: INTEGER) is
 		-- gtk_entry_completion_set_text_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_set_text_column"
		}"
		end


end -- class GTKENTRYCOMPLETION_EXTERNALS
