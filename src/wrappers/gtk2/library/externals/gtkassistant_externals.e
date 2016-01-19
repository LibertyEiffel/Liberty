-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKASSISTANT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_assistant_add_action_widget (an_assistant: POINTER; a_child: POINTER) is
 		-- gtk_assistant_add_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_add_action_widget"
		}"
		end

	gtk_assistant_append_page (an_assistant: POINTER; a_page: POINTER): INTEGER is
 		-- gtk_assistant_append_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_append_page"
		}"
		end

	gtk_assistant_commit (an_assistant: POINTER) is
 		-- gtk_assistant_commit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_commit"
		}"
		end

	gtk_assistant_get_current_page (an_assistant: POINTER): INTEGER is
 		-- gtk_assistant_get_current_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_current_page"
		}"
		end

	gtk_assistant_get_n_pages (an_assistant: POINTER): INTEGER is
 		-- gtk_assistant_get_n_pages
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_n_pages"
		}"
		end

	gtk_assistant_get_nth_page (an_assistant: POINTER; a_page_num: INTEGER): POINTER is
 		-- gtk_assistant_get_nth_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_nth_page"
		}"
		end

	gtk_assistant_get_page_complete (an_assistant: POINTER; a_page: POINTER): INTEGER is
 		-- gtk_assistant_get_page_complete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_complete"
		}"
		end

	gtk_assistant_get_page_header_image (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_header_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_header_image"
		}"
		end

	gtk_assistant_get_page_side_image (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_side_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_side_image"
		}"
		end

	gtk_assistant_get_page_title (an_assistant: POINTER; a_page: POINTER): POINTER is
 		-- gtk_assistant_get_page_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_title"
		}"
		end

	gtk_assistant_get_page_type (an_assistant: POINTER; a_page: POINTER): INTEGER is
 		-- gtk_assistant_get_page_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_page_type"
		}"
		end

	gtk_assistant_get_type: like long_unsigned is
 		-- gtk_assistant_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_get_type()"
		}"
		end

	gtk_assistant_insert_page (an_assistant: POINTER; a_page: POINTER; a_position: INTEGER): INTEGER is
 		-- gtk_assistant_insert_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_insert_page"
		}"
		end

	gtk_assistant_new: POINTER is
 		-- gtk_assistant_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_new()"
		}"
		end

	gtk_assistant_prepend_page (an_assistant: POINTER; a_page: POINTER): INTEGER is
 		-- gtk_assistant_prepend_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_prepend_page"
		}"
		end

	gtk_assistant_remove_action_widget (an_assistant: POINTER; a_child: POINTER) is
 		-- gtk_assistant_remove_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_remove_action_widget"
		}"
		end

	gtk_assistant_set_current_page (an_assistant: POINTER; a_page_num: INTEGER) is
 		-- gtk_assistant_set_current_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_current_page"
		}"
		end

	gtk_assistant_set_forward_page_func (an_assistant: POINTER; a_page_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_assistant_set_forward_page_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_forward_page_func"
		}"
		end

	gtk_assistant_set_page_complete (an_assistant: POINTER; a_page: POINTER; a_complete: INTEGER) is
 		-- gtk_assistant_set_page_complete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_complete"
		}"
		end

	gtk_assistant_set_page_header_image (an_assistant: POINTER; a_page: POINTER; a_pixbuf: POINTER) is
 		-- gtk_assistant_set_page_header_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_header_image"
		}"
		end

	gtk_assistant_set_page_side_image (an_assistant: POINTER; a_page: POINTER; a_pixbuf: POINTER) is
 		-- gtk_assistant_set_page_side_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_side_image"
		}"
		end

	gtk_assistant_set_page_title (an_assistant: POINTER; a_page: POINTER; a_title: POINTER) is
 		-- gtk_assistant_set_page_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_title"
		}"
		end

	gtk_assistant_set_page_type (an_assistant: POINTER; a_page: POINTER; a_type: INTEGER) is
 		-- gtk_assistant_set_page_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_set_page_type"
		}"
		end

	gtk_assistant_update_buttons_state (an_assistant: POINTER) is
 		-- gtk_assistant_update_buttons_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_update_buttons_state"
		}"
		end


end -- class GTKASSISTANT_EXTERNALS
