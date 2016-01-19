-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCLIPBOARD_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_clipboard_clear (a_clipboard: POINTER) is
 		-- gtk_clipboard_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_clear"
		}"
		end

	gtk_clipboard_get (a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get"
		}"
		end

	gtk_clipboard_get_display (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_display"
		}"
		end

	gtk_clipboard_get_for_display (a_display: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_for_display"
		}"
		end

	gtk_clipboard_get_owner (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_owner
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_owner"
		}"
		end

	gtk_clipboard_get_type: like long_unsigned is
 		-- gtk_clipboard_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_type()"
		}"
		end

	-- `hidden' function _gtk_clipboard_handle_event skipped.
	gtk_clipboard_request_contents (a_clipboard: POINTER; a_target: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_contents
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_contents"
		}"
		end

	gtk_clipboard_request_image (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_image"
		}"
		end

	gtk_clipboard_request_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_rich_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_rich_text"
		}"
		end

	gtk_clipboard_request_targets (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_targets"
		}"
		end

	gtk_clipboard_request_text (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_text"
		}"
		end

	gtk_clipboard_request_uris (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_uris"
		}"
		end

	gtk_clipboard_set_can_store (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: INTEGER) is
 		-- gtk_clipboard_set_can_store
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_can_store"
		}"
		end

	gtk_clipboard_set_image (a_clipboard: POINTER; a_pixbuf: POINTER) is
 		-- gtk_clipboard_set_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_image"
		}"
		end

	gtk_clipboard_set_text (a_clipboard: POINTER; a_text: POINTER; a_len: INTEGER) is
 		-- gtk_clipboard_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_text"
		}"
		end

	gtk_clipboard_set_with_data (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL; a_get_func: POINTER; a_clear_func: POINTER; an_user_data: POINTER): INTEGER is
 		-- gtk_clipboard_set_with_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_data"
		}"
		end

	gtk_clipboard_set_with_owner (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL; a_get_func: POINTER; a_clear_func: POINTER; an_owner: POINTER): INTEGER is
 		-- gtk_clipboard_set_with_owner
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_owner"
		}"
		end

	gtk_clipboard_store (a_clipboard: POINTER) is
 		-- gtk_clipboard_store
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_store"
		}"
		end

	-- `hidden' function _gtk_clipboard_store_all skipped.
	gtk_clipboard_wait_for_contents (a_clipboard: POINTER; a_target: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_contents
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_contents"
		}"
		end

	gtk_clipboard_wait_for_image (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_image"
		}"
		end

	gtk_clipboard_wait_for_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_format: POINTER; a_length: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_rich_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_rich_text"
		}"
		end

	gtk_clipboard_wait_for_targets (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: POINTER): INTEGER is
 		-- gtk_clipboard_wait_for_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_targets"
		}"
		end

	gtk_clipboard_wait_for_text (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_text"
		}"
		end

	gtk_clipboard_wait_for_uris (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_uris"
		}"
		end

	gtk_clipboard_wait_is_image_available (a_clipboard: POINTER): INTEGER is
 		-- gtk_clipboard_wait_is_image_available
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_image_available"
		}"
		end

	gtk_clipboard_wait_is_rich_text_available (a_clipboard: POINTER; a_buffer: POINTER): INTEGER is
 		-- gtk_clipboard_wait_is_rich_text_available
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_rich_text_available"
		}"
		end

	gtk_clipboard_wait_is_target_available (a_clipboard: POINTER; a_target: POINTER): INTEGER is
 		-- gtk_clipboard_wait_is_target_available
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_target_available"
		}"
		end

	gtk_clipboard_wait_is_text_available (a_clipboard: POINTER): INTEGER is
 		-- gtk_clipboard_wait_is_text_available
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_text_available"
		}"
		end

	gtk_clipboard_wait_is_uris_available (a_clipboard: POINTER): INTEGER is
 		-- gtk_clipboard_wait_is_uris_available
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_uris_available"
		}"
		end


end -- class GTKCLIPBOARD_EXTERNALS
