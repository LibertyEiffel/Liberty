-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKASSISTANT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_assistant_add_action_widget (an_assistant: POINTER; a_child: POINTER) is
 		-- gtk_assistant_add_action_widget (node at line 1908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_add_action_widget"
		}"
		end

	gtk_assistant_set_page_complete (an_assistant: POINTER; a_page: POINTER; a_complete: INTEGER_32) is
 		-- gtk_assistant_set_page_complete (node at line 4205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_complete"
		}"
		end

	gtk_assistant_remove_action_widget (an_assistant: POINTER; a_child: POINTER) is
 		-- gtk_assistant_remove_action_widget (node at line 4403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_remove_action_widget"
		}"
		end

	gtk_assistant_set_page_title (an_assistant: POINTER; a_page: POINTER; a_title: POINTER) is
 		-- gtk_assistant_set_page_title (node at line 6748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_title"
		}"
		end

	gtk_assistant_get_page_side_image (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_side_image (node at line 6944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_side_image"
		}"
		end

	gtk_assistant_insert_page (an_assistant: POINTER; a_page: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_assistant_insert_page (node at line 10924)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_insert_page"
		}"
		end

	gtk_assistant_get_type: NATURAL_32 is
 		-- gtk_assistant_get_type (node at line 12331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_type()"
		}"
		end

	gtk_assistant_new: POINTER is
 		-- gtk_assistant_new (node at line 14790)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_new()"
		}"
		end

	gtk_assistant_get_page_type (an_assistant: POINTER; a_page: POINTER): INTEGER is
 		-- gtk_assistant_get_page_type (node at line 18039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_type"
		}"
		end

	gtk_assistant_get_page_header_image (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_header_image (node at line 20837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_header_image"
		}"
		end

	gtk_assistant_set_page_type (an_assistant: POINTER; a_page: POINTER; a_type: INTEGER) is
 		-- gtk_assistant_set_page_type (node at line 21947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_type"
		}"
		end

	gtk_assistant_append_page (an_assistant: POINTER; a_page: POINTER): INTEGER_32 is
 		-- gtk_assistant_append_page (node at line 22257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_append_page"
		}"
		end

	gtk_assistant_get_nth_page (an_assistant: POINTER; a_page_num: INTEGER_32): POINTER is
 		-- gtk_assistant_get_nth_page (node at line 23318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_nth_page"
		}"
		end

	gtk_assistant_set_page_header_image (an_assistant: POINTER; a_page: POINTER; a_pixbuf: POINTER) is
 		-- gtk_assistant_set_page_header_image (node at line 24938)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_header_image"
		}"
		end

	gtk_assistant_get_n_pages (an_assistant: POINTER): INTEGER_32 is
 		-- gtk_assistant_get_n_pages (node at line 26541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_n_pages"
		}"
		end

	gtk_assistant_set_forward_page_func (an_assistant: POINTER; a_page_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_assistant_set_forward_page_func (node at line 28239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_forward_page_func"
		}"
		end

	gtk_assistant_set_current_page (an_assistant: POINTER; a_page_num: INTEGER_32) is
 		-- gtk_assistant_set_current_page (node at line 30956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_current_page"
		}"
		end

	gtk_assistant_set_page_side_image (an_assistant: POINTER; a_page: POINTER; a_pixbuf: POINTER) is
 		-- gtk_assistant_set_page_side_image (node at line 32892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_side_image"
		}"
		end

	gtk_assistant_update_buttons_state (an_assistant: POINTER) is
 		-- gtk_assistant_update_buttons_state (node at line 34538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_update_buttons_state"
		}"
		end

	gtk_assistant_get_current_page (an_assistant: POINTER): INTEGER_32 is
 		-- gtk_assistant_get_current_page (node at line 34838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_current_page"
		}"
		end

	gtk_assistant_prepend_page (an_assistant: POINTER; a_page: POINTER): INTEGER_32 is
 		-- gtk_assistant_prepend_page (node at line 35411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_prepend_page"
		}"
		end

	gtk_assistant_get_page_title (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_title (node at line 35546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_title"
		}"
		end

	gtk_assistant_get_page_complete (an_assistant: POINTER; a_page: POINTER): INTEGER_32 is
 		-- gtk_assistant_get_page_complete (node at line 35691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_complete"
		}"
		end


end -- class GTKASSISTANT_EXTERNALS
