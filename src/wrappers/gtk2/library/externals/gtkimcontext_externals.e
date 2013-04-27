-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_im_context_delete_surrounding (a_context: POINTER; an_offset: INTEGER; a_n_chars: INTEGER): INTEGER is
 		-- gtk_im_context_delete_surrounding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_delete_surrounding"
		}"
		end

	gtk_im_context_filter_keypress (a_context: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_im_context_filter_keypress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_filter_keypress"
		}"
		end

	gtk_im_context_focus_in (a_context: POINTER) is
 		-- gtk_im_context_focus_in
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_focus_in"
		}"
		end

	gtk_im_context_focus_out (a_context: POINTER) is
 		-- gtk_im_context_focus_out
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_focus_out"
		}"
		end

	gtk_im_context_get_preedit_string (a_context: POINTER; a_str: POINTER; an_attrs: POINTER; a_cursor_pos: POINTER) is
 		-- gtk_im_context_get_preedit_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_preedit_string"
		}"
		end

	gtk_im_context_get_surrounding (a_context: POINTER; a_text: POINTER; a_cursor_index: POINTER): INTEGER is
 		-- gtk_im_context_get_surrounding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_surrounding"
		}"
		end

	gtk_im_context_get_type: like long_unsigned is
 		-- gtk_im_context_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_type()"
		}"
		end

	gtk_im_context_reset (a_context: POINTER) is
 		-- gtk_im_context_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_reset"
		}"
		end

	gtk_im_context_set_client_window (a_context: POINTER; a_window: POINTER) is
 		-- gtk_im_context_set_client_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_client_window"
		}"
		end

	gtk_im_context_set_cursor_location (a_context: POINTER; an_area: POINTER) is
 		-- gtk_im_context_set_cursor_location
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_cursor_location"
		}"
		end

	gtk_im_context_set_surrounding (a_context: POINTER; a_text: POINTER; a_len: INTEGER; a_cursor_index: INTEGER) is
 		-- gtk_im_context_set_surrounding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_surrounding"
		}"
		end

	gtk_im_context_set_use_preedit (a_context: POINTER; an_use_preedit: INTEGER) is
 		-- gtk_im_context_set_use_preedit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_use_preedit"
		}"
		end


end -- class GTKIMCONTEXT_EXTERNALS
