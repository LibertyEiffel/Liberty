-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_im_context_set_client_window (a_context: POINTER; a_window: POINTER) is
 		-- gtk_im_context_set_client_window (node at line 774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_client_window"
		}"
		end

	gtk_im_context_set_surrounding (a_context: POINTER; a_text: POINTER; a_len: INTEGER_32; a_cursor_index: INTEGER_32) is
 		-- gtk_im_context_set_surrounding (node at line 4192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_surrounding"
		}"
		end

	gtk_im_context_delete_surrounding (a_context: POINTER; an_offset: INTEGER_32; a_n_chars: INTEGER_32): INTEGER_32 is
 		-- gtk_im_context_delete_surrounding (node at line 4495)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_delete_surrounding"
		}"
		end

	gtk_im_context_focus_out (a_context: POINTER) is
 		-- gtk_im_context_focus_out (node at line 8873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_focus_out"
		}"
		end

	gtk_im_context_reset (a_context: POINTER) is
 		-- gtk_im_context_reset (node at line 15354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_reset"
		}"
		end

	gtk_im_context_set_cursor_location (a_context: POINTER; an_area: POINTER) is
 		-- gtk_im_context_set_cursor_location (node at line 19824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_cursor_location"
		}"
		end

	gtk_im_context_filter_keypress (a_context: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_im_context_filter_keypress (node at line 28039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_filter_keypress"
		}"
		end

	gtk_im_context_get_type: NATURAL_64 is
 		-- gtk_im_context_get_type (node at line 28116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_type()"
		}"
		end

	gtk_im_context_set_use_preedit (a_context: POINTER; an_use_preedit: INTEGER_32) is
 		-- gtk_im_context_set_use_preedit (node at line 29060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_set_use_preedit"
		}"
		end

	gtk_im_context_get_surrounding (a_context: POINTER; a_text: POINTER; a_cursor_index: POINTER): INTEGER_32 is
 		-- gtk_im_context_get_surrounding (node at line 30525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_surrounding"
		}"
		end

	gtk_im_context_get_preedit_string (a_context: POINTER; a_str: POINTER; an_attrs: POINTER; a_cursor_pos: POINTER) is
 		-- gtk_im_context_get_preedit_string (node at line 31267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_get_preedit_string"
		}"
		end

	gtk_im_context_focus_in (a_context: POINTER) is
 		-- gtk_im_context_focus_in (node at line 40977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_focus_in"
		}"
		end


end -- class GTKIMCONTEXT_EXTERNALS
