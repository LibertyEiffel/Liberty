-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTOPERATION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_operation_set_use_full_page (an_op: POINTER; a_full_page: INTEGER_32) is
 		-- gtk_print_operation_set_use_full_page (node at line 2384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_use_full_page"
		}"
		end

	gtk_print_operation_set_print_settings (an_op: POINTER; a_print_settings: POINTER) is
 		-- gtk_print_operation_set_print_settings (node at line 8270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_print_settings"
		}"
		end

	gtk_print_operation_set_defer_drawing (an_op: POINTER) is
 		-- gtk_print_operation_set_defer_drawing (node at line 8417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_defer_drawing"
		}"
		end

	gtk_print_operation_set_default_page_setup (an_op: POINTER; a_default_page_setup: POINTER) is
 		-- gtk_print_operation_set_default_page_setup (node at line 8715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_default_page_setup"
		}"
		end

	gtk_print_operation_get_status_string (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_status_string (node at line 10126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_status_string"
		}"
		end

	gtk_print_operation_get_embed_page_setup (an_op: POINTER): INTEGER_32 is
 		-- gtk_print_operation_get_embed_page_setup (node at line 11554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_embed_page_setup"
		}"
		end

	gtk_print_operation_get_support_selection (an_op: POINTER): INTEGER_32 is
 		-- gtk_print_operation_get_support_selection (node at line 11878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_support_selection"
		}"
		end

	gtk_print_operation_get_status (an_op: POINTER): INTEGER is
 		-- gtk_print_operation_get_status (node at line 12754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_status"
		}"
		end

	gtk_print_operation_is_finished (an_op: POINTER): INTEGER_32 is
 		-- gtk_print_operation_is_finished (node at line 14892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_is_finished"
		}"
		end

	gtk_print_run_page_setup_dialog_async (a_parent: POINTER; a_page_setup: POINTER; a_settings: POINTER; a_done_cb: POINTER; a_data: POINTER) is
 		-- gtk_print_run_page_setup_dialog_async (node at line 15466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_run_page_setup_dialog_async"
		}"
		end

	gtk_print_operation_get_default_page_setup (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_default_page_setup (node at line 15740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_default_page_setup"
		}"
		end

	gtk_print_operation_set_n_pages (an_op: POINTER; a_n_pages: INTEGER_32) is
 		-- gtk_print_operation_set_n_pages (node at line 16390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_n_pages"
		}"
		end

	gtk_print_operation_set_support_selection (an_op: POINTER; a_support_selection: INTEGER_32) is
 		-- gtk_print_operation_set_support_selection (node at line 16431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_support_selection"
		}"
		end

	gtk_print_operation_set_job_name (an_op: POINTER; a_job_name: POINTER) is
 		-- gtk_print_operation_set_job_name (node at line 16675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_job_name"
		}"
		end

	gtk_print_run_page_setup_dialog (a_parent: POINTER; a_page_setup: POINTER; a_settings: POINTER): POINTER is
 		-- gtk_print_run_page_setup_dialog (node at line 18741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_run_page_setup_dialog"
		}"
		end

	gtk_print_operation_get_has_selection (an_op: POINTER): INTEGER_32 is
 		-- gtk_print_operation_get_has_selection (node at line 20034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_has_selection"
		}"
		end

	gtk_print_operation_set_show_progress (an_op: POINTER; a_show_progress: INTEGER_32) is
 		-- gtk_print_operation_set_show_progress (node at line 22849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_show_progress"
		}"
		end

	gtk_print_operation_new: POINTER is
 		-- gtk_print_operation_new (node at line 25264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_new()"
		}"
		end

	gtk_print_operation_set_has_selection (an_op: POINTER; a_has_selection: INTEGER_32) is
 		-- gtk_print_operation_set_has_selection (node at line 25350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_has_selection"
		}"
		end

	gtk_print_operation_set_export_filename (an_op: POINTER; a_filename: POINTER) is
 		-- gtk_print_operation_set_export_filename (node at line 27433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_export_filename"
		}"
		end

	gtk_print_operation_set_embed_page_setup (an_op: POINTER; an_embed: INTEGER_32) is
 		-- gtk_print_operation_set_embed_page_setup (node at line 27664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_embed_page_setup"
		}"
		end

	gtk_print_operation_get_type: NATURAL_32 is
 		-- gtk_print_operation_get_type (node at line 28275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_type()"
		}"
		end

	gtk_print_operation_get_n_pages_to_print (an_op: POINTER): INTEGER_32 is
 		-- gtk_print_operation_get_n_pages_to_print (node at line 31798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_n_pages_to_print"
		}"
		end

	gtk_print_error_quark: NATURAL_32 is
 		-- gtk_print_error_quark (node at line 31838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_error_quark()"
		}"
		end

	gtk_print_operation_cancel (an_op: POINTER) is
 		-- gtk_print_operation_cancel (node at line 32865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_cancel"
		}"
		end

	gtk_print_operation_set_custom_tab_label (an_op: POINTER; a_label: POINTER) is
 		-- gtk_print_operation_set_custom_tab_label (node at line 34002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_custom_tab_label"
		}"
		end

	gtk_print_operation_set_allow_async (an_op: POINTER; an_allow_async: INTEGER_32) is
 		-- gtk_print_operation_set_allow_async (node at line 34604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_allow_async"
		}"
		end

	gtk_print_operation_draw_page_finish (an_op: POINTER) is
 		-- gtk_print_operation_draw_page_finish (node at line 34682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_draw_page_finish"
		}"
		end

	gtk_print_operation_run (an_op: POINTER; an_action: INTEGER; a_parent: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_print_operation_run (node at line 35835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_run"
		}"
		end

	gtk_print_operation_set_track_print_status (an_op: POINTER; a_track_status: INTEGER_32) is
 		-- gtk_print_operation_set_track_print_status (node at line 36377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_track_print_status"
		}"
		end

	gtk_print_operation_get_print_settings (an_op: POINTER): POINTER is
 		-- gtk_print_operation_get_print_settings (node at line 37054)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_print_settings"
		}"
		end

	gtk_print_operation_set_current_page (an_op: POINTER; a_current_page: INTEGER_32) is
 		-- gtk_print_operation_set_current_page (node at line 37093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_current_page"
		}"
		end

	gtk_print_operation_set_unit (an_op: POINTER; an_unit: INTEGER) is
 		-- gtk_print_operation_set_unit (node at line 37264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_set_unit"
		}"
		end

	gtk_print_operation_get_error (an_op: POINTER; an_error: POINTER) is
 		-- gtk_print_operation_get_error (node at line 37423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_get_error"
		}"
		end


end -- class GTKPRINTOPERATION_EXTERNALS
