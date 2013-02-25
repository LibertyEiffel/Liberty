-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCLIPBOARD_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_clipboard_wait_is_image_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_image_available (node at line 1634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_image_available"
		}"
		end

	gtk_clipboard_request_contents (a_clipboard: POINTER; a_target: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_contents (node at line 3335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_contents"
		}"
		end

	gtk_clipboard_wait_for_targets (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_for_targets (node at line 3386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_targets"
		}"
		end

	gtk_clipboard_set_with_data (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL_32; a_get_func: POINTER; a_clear_func: POINTER; an_user_data: POINTER): INTEGER_32 is
 		-- gtk_clipboard_set_with_data (node at line 4153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_data"
		}"
		end

	gtk_clipboard_get_type: NATURAL_64 is
 		-- gtk_clipboard_get_type (node at line 7810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_type()"
		}"
		end

	gtk_clipboard_store (a_clipboard: POINTER) is
 		-- gtk_clipboard_store (node at line 8038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_store"
		}"
		end

	gtk_clipboard_set_text (a_clipboard: POINTER; a_text: POINTER; a_len: INTEGER_32) is
 		-- gtk_clipboard_set_text (node at line 11686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_text"
		}"
		end

	gtk_clipboard_wait_for_image (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_image (node at line 12095)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_image"
		}"
		end

	gtk_clipboard_wait_for_text (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_text (node at line 14259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_text"
		}"
		end

	gtk_clipboard_get (a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get (node at line 14577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get"
		}"
		end

	gtk_clipboard_request_uris (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_uris (node at line 15300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_uris"
		}"
		end

	-- `hidden' function _gtk_clipboard_store_all skipped.
	gtk_clipboard_request_targets (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_targets (node at line 18547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_targets"
		}"
		end

	-- `hidden' function _gtk_clipboard_handle_event skipped.
	gtk_clipboard_request_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_rich_text (node at line 19536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_rich_text"
		}"
		end

	gtk_clipboard_wait_for_rich_text (a_clipboard: POINTER; a_buffer: POINTER; a_format: POINTER; a_length: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_rich_text (node at line 22416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_rich_text"
		}"
		end

	gtk_clipboard_set_image (a_clipboard: POINTER; a_pixbuf: POINTER) is
 		-- gtk_clipboard_set_image (node at line 24723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_image"
		}"
		end

	gtk_clipboard_get_owner (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_owner (node at line 27192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_owner"
		}"
		end

	gtk_clipboard_wait_is_text_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_text_available (node at line 28804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_text_available"
		}"
		end

	gtk_clipboard_wait_is_target_available (a_clipboard: POINTER; a_target: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_target_available (node at line 29147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_target_available"
		}"
		end

	gtk_clipboard_wait_for_contents (a_clipboard: POINTER; a_target: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_contents (node at line 29915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_contents"
		}"
		end

	gtk_clipboard_set_with_owner (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: NATURAL_32; a_get_func: POINTER; a_clear_func: POINTER; an_owner: POINTER): INTEGER_32 is
 		-- gtk_clipboard_set_with_owner (node at line 30932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_with_owner"
		}"
		end

	gtk_clipboard_get_for_display (a_display: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_clipboard_get_for_display (node at line 31800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_for_display"
		}"
		end

	gtk_clipboard_wait_for_uris (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_wait_for_uris (node at line 33435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_for_uris"
		}"
		end

	gtk_clipboard_wait_is_rich_text_available (a_clipboard: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_rich_text_available (node at line 33595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_rich_text_available"
		}"
		end

	gtk_clipboard_wait_is_uris_available (a_clipboard: POINTER): INTEGER_32 is
 		-- gtk_clipboard_wait_is_uris_available (node at line 33940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_wait_is_uris_available"
		}"
		end

	gtk_clipboard_set_can_store (a_clipboard: POINTER; a_targets: POINTER; a_n_targets: INTEGER_32) is
 		-- gtk_clipboard_set_can_store (node at line 36145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_set_can_store"
		}"
		end

	gtk_clipboard_get_display (a_clipboard: POINTER): POINTER is
 		-- gtk_clipboard_get_display (node at line 37081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_get_display"
		}"
		end

	gtk_clipboard_request_text (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_text (node at line 38645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_text"
		}"
		end

	gtk_clipboard_clear (a_clipboard: POINTER) is
 		-- gtk_clipboard_clear (node at line 39765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_clear"
		}"
		end

	gtk_clipboard_request_image (a_clipboard: POINTER; a_callback: POINTER; an_user_data: POINTER) is
 		-- gtk_clipboard_request_image (node at line 41354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clipboard_request_image"
		}"
		end


end -- class GTKCLIPBOARD_EXTERNALS
