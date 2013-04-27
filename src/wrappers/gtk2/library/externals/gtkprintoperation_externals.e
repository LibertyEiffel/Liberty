-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTOPERATION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_error_quark: NATURAL is
 		-- gtk_print_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_error_quark()"
		}"
		end

	gtk_print_operation_cancel (an_op: POINTER) is
 		-- gtk_print_operation_cancel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_cancel"
		}"
		end

	gtk_print_operation_draw_page_finish (an_op: POINTER) is
 		-- gtk_print_operation_draw_page_finish
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_draw_page_finish"
		}"
		end

	gtk_print_operation_get_default_page_setup (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_default_page_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_default_page_setup"
		}"
		end

	gtk_print_operation_get_embed_page_setup (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_embed_page_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_embed_page_setup"
		}"
		end

	gtk_print_operation_get_error (an_op: POINTER; an_error: POINTER) is
 		-- gtk_print_operation_get_error
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_error"
		}"
		end

	gtk_print_operation_get_has_selection (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_has_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_has_selection"
		}"
		end

	gtk_print_operation_get_n_pages_to_print (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_n_pages_to_print
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_n_pages_to_print"
		}"
		end

	gtk_print_operation_get_print_settings (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_print_settings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_print_settings"
		}"
		end

	gtk_print_operation_get_status (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_status
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_status"
		}"
		end

	gtk_print_operation_get_status_string (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_status_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_status_string"
		}"
		end

	gtk_print_operation_get_support_selection (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_support_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_support_selection"
		}"
		end

	gtk_print_operation_get_type: like long_unsigned is
 		-- gtk_print_operation_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_type()"
		}"
		end

	gtk_print_operation_is_finished (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_is_finished
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_is_finished"
		}"
		end

	gtk_print_operation_new: POINTER is
 		-- gtk_print_operation_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_new()"
		}"
		end

	gtk_print_operation_run (an_op: POINTER; an_action: INTEGER; a_parent: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_print_operation_run
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_run"
		}"
		end

	gtk_print_operation_set_allow_async (an_op: POINTER; an_allow_async: INTEGER) is
 		-- gtk_print_operation_set_allow_async
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_allow_async"
		}"
		end

	gtk_print_operation_set_current_page (an_op: POINTER; a_current_page: INTEGER) is
 		-- gtk_print_operation_set_current_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_current_page"
		}"
		end

	gtk_print_operation_set_custom_tab_label (an_op: POINTER; a_label: POINTER) is
 		-- gtk_print_operation_set_custom_tab_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_custom_tab_label"
		}"
		end

	gtk_print_operation_set_default_page_setup (an_op: POINTER; a_default_page_setup: POINTER) is
 		-- gtk_print_operation_set_default_page_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_default_page_setup"
		}"
		end

	gtk_print_operation_set_defer_drawing (an_op: POINTER) is
 		-- gtk_print_operation_set_defer_drawing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_defer_drawing"
		}"
		end

	gtk_print_operation_set_embed_page_setup (an_op: POINTER; an_embed: INTEGER) is
 		-- gtk_print_operation_set_embed_page_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_embed_page_setup"
		}"
		end

	gtk_print_operation_set_export_filename (an_op: POINTER; a_filename: POINTER) is
 		-- gtk_print_operation_set_export_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_export_filename"
		}"
		end

	gtk_print_operation_set_has_selection (an_op: POINTER; a_has_selection: INTEGER) is
 		-- gtk_print_operation_set_has_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_has_selection"
		}"
		end

	gtk_print_operation_set_job_name (an_op: POINTER; a_job_name: POINTER) is
 		-- gtk_print_operation_set_job_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_job_name"
		}"
		end

	gtk_print_operation_set_n_pages (an_op: POINTER; a_n_pages: INTEGER) is
 		-- gtk_print_operation_set_n_pages
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_n_pages"
		}"
		end

	gtk_print_operation_set_print_settings (an_op: POINTER; a_print_settings: POINTER) is
 		-- gtk_print_operation_set_print_settings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_print_settings"
		}"
		end

	gtk_print_operation_set_show_progress (an_op: POINTER; a_show_progress: INTEGER) is
 		-- gtk_print_operation_set_show_progress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_show_progress"
		}"
		end

	gtk_print_operation_set_support_selection (an_op: POINTER; a_support_selection: INTEGER) is
 		-- gtk_print_operation_set_support_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_support_selection"
		}"
		end

	gtk_print_operation_set_track_print_status (an_op: POINTER; a_track_status: INTEGER) is
 		-- gtk_print_operation_set_track_print_status
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_track_print_status"
		}"
		end

	gtk_print_operation_set_unit (an_op: POINTER; an_unit: INTEGER) is
 		-- gtk_print_operation_set_unit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_unit"
		}"
		end

	gtk_print_operation_set_use_full_page (an_op: POINTER; a_full_page: INTEGER) is
 		-- gtk_print_operation_set_use_full_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_use_full_page"
		}"
		end

	gtk_print_run_page_setup_dialog (a_parent: POINTER; a_page_setup: POINTER; a_settings: POINTER): POINTER is
 		-- gtk_print_run_page_setup_dialog
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_run_page_setup_dialog"
		}"
		end

	gtk_print_run_page_setup_dialog_async (a_parent: POINTER; a_page_setup: POINTER; a_settings: POINTER; a_done_cb: POINTER; a_data: POINTER) is
 		-- gtk_print_run_page_setup_dialog_async
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_run_page_setup_dialog_async"
		}"
		end


end -- class GTKPRINTOPERATION_EXTERNALS
