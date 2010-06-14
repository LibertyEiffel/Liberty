-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCLIPBOARD_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_clipboard_clear (a_clipboard: POINTER) is
 		-- gtk_clipboard_clear (node at line 2377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_clear"
		}"
		end

	gtk_clipboard_request_contents (a_clipboard: POINTER; a_target: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_contents (node at line 3246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_contents"
		}"
		end

	gtk_clipboard_wait_for_targets (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_for_targets (node at line 3290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_targets"
		}"
		end

	gtk_clipboard_store (a_clipboard: POINTER) is
 		-- gtk_clipboard_store (node at line 7346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_store"
		}"
		end

	gtk_clipboard_set_text (a_clipboard: POINTER; a_text: POINTER; a_len: INTEGER_32) is
 		-- gtk_clipboard_set_text (node at line 10741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_text"
		}"
		end

	gtk_clipboard_wait_for_image (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_image (node at line 11133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_image"
		}"
		end

	gtk_clipboard_wait_for_text (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_text (node at line 13143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_text"
		}"
		end

	gtk_clipboard_wait_is_image_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_image_available (node at line 13727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_image_available"
		}"
		end

	gtk_clipboard_request_uris (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_uris (node at line 14171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_uris"
		}"
		end

	-- `hidden' function _gtk_clipboard_store_all skipped.
	gtk_clipboard_request_targets (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_targets (node at line 17002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_targets"
		}"
		end

	-- `hidden' function _gtk_clipboard_handle_event skipped.
	gtk_clipboard_request_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_rich_text (node at line 17846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_rich_text"
		}"
		end

	gtk_clipboard_wait_for_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_format: POINTER; a_length: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_rich_text (node at line 20317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_rich_text"
		}"
		end

	gtk_clipboard_set_image (a_clipboard: POINTER; a_pixbuf: POINTER) is
 		-- gtk_clipboard_set_image (node at line 22440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_image"
		}"
		end

	gtk_clipboard_get_owner (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_owner (node at line 24633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_owner"
		}"
		end

	gtk_clipboard_wait_is_target_available (a_clipboard: POINTER; a_target: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_target_available (node at line 26394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_target_available"
		}"
		end

	gtk_clipboard_wait_is_text_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_text_available (node at line 27072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_text_available"
		}"
		end

	gtk_clipboard_wait_for_contents (a_clipboard: POINTER; a_target: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_contents (node at line 27114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_contents"
		}"
		end

	gtk_clipboard_set_with_owner (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL_32; a_get_func: POINTER; a_clear_func: POINTER; an_owner: POINTER): INTEGER_32 is
 		-- gtk_clipboard_set_with_owner (node at line 27971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_owner"
		}"
		end

	gtk_clipboard_get_for_display (a_display: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get_for_display (node at line 28821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_for_display"
		}"
		end

	gtk_clipboard_wait_for_uris (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_uris (node at line 30283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_uris"
		}"
		end

	gtk_clipboard_wait_is_rich_text_available (a_clipboard: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_rich_text_available (node at line 30414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_rich_text_available"
		}"
		end

	gtk_clipboard_wait_is_uris_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_uris_available (node at line 30717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_uris_available"
		}"
		end

	gtk_clipboard_set_can_store (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: INTEGER_32) is
 		-- gtk_clipboard_set_can_store (node at line 32761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_can_store"
		}"
		end

	gtk_clipboard_get_display (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_display (node at line 33605)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_display"
		}"
		end

	gtk_clipboard_set_with_data (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL_32; a_get_func: POINTER; a_clear_func: POINTER; an_user_data: POINTER): INTEGER_32 is
 		-- gtk_clipboard_set_with_data (node at line 34036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_data"
		}"
		end

	gtk_clipboard_get (a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get (node at line 34958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get"
		}"
		end

	gtk_clipboard_request_text (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_text (node at line 35045)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_text"
		}"
		end

	gtk_clipboard_get_type: NATURAL_32 is
 		-- gtk_clipboard_get_type (node at line 35834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_type()"
		}"
		end

	gtk_clipboard_request_image (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_image (node at line 37039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_image"
		}"
		end


end -- class GTKCLIPBOARD_EXTERNALS
