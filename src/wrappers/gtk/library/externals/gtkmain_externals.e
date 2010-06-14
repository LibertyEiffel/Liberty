-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMAIN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_set_locale: POINTER is
 		-- gtk_set_locale (node at line 653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_set_locale()"
		}"
		end

	gtk_main_iteration_do (a_blocking: INTEGER_32): INTEGER_32 is
 		-- gtk_main_iteration_do (node at line 2761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration_do"
		}"
		end

	gtk_key_snooper_remove (a_snooper_handler_id: NATURAL_32) is
 		-- gtk_key_snooper_remove (node at line 4308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_remove"
		}"
		end

	gtk_true: INTEGER_32 is
 		-- gtk_true (node at line 4315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_true()"
		}"
		end

	gtk_get_current_event_state (a_state: POINTER): INTEGER_32 is
 		-- gtk_get_current_event_state (node at line 4445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_state"
		}"
		end

	-- `hidden' function _gtk_get_lc_ctype skipped.
	gtk_main_iteration: INTEGER_32 is
 		-- gtk_main_iteration (node at line 4914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration()"
		}"
		end

	gtk_get_option_group (an_open_default_display: INTEGER_32): POINTER is
 		-- gtk_get_option_group (node at line 5274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_option_group"
		}"
		end

	gtk_grab_remove (a_widget: POINTER) is
 		-- gtk_grab_remove (node at line 6337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_remove"
		}"
		end

	gtk_idle_remove (an_idle_handler_id: NATURAL_32) is
 		-- gtk_idle_remove (node at line 6496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_idle_remove"
		}"
		end

	gtk_events_pending: INTEGER_32 is
 		-- gtk_events_pending (node at line 7462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_events_pending()"
		}"
		end

	gtk_key_snooper_install (a_snooper: POINTER; a_func_data: POINTER): NATURAL_32 is
 		-- gtk_key_snooper_install (node at line 9559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_install"
		}"
		end

	gtk_get_current_event_time: NATURAL_32 is
 		-- gtk_get_current_event_time (node at line 10328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_time()"
		}"
		end

	gtk_false: INTEGER_32 is
 		-- gtk_false (node at line 10940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_false()"
		}"
		end

	gtk_init_check (an_argc: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- gtk_init_check (node at line 12661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_check"
		}"
		end

	gtk_timeout_add_full (an_interval: NATURAL_32; a_function: POINTER; a_marshal: POINTER; a_data: POINTER; a_destroy: POINTER): NATURAL_32 is
 		-- gtk_timeout_add_full (node at line 12952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_timeout_add_full"
		}"
		end

	gtk_check_version (a_required_major: NATURAL_32; a_required_minor: NATURAL_32; a_required_micro: NATURAL_32): POINTER is
 		-- gtk_check_version (node at line 13148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_version"
		}"
		end

	gtk_init_add (a_function: POINTER; a_data: POINTER) is
 		-- gtk_init_add (node at line 13322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_add"
		}"
		end

	gtk_init (an_argc: POINTER; an_argv: POINTER) is
 		-- gtk_init (node at line 13535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init"
		}"
		end

	gtk_disable_setlocale is
 		-- gtk_disable_setlocale (node at line 14383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_disable_setlocale()"
		}"
		end

	gtk_quit_add (a_main_level: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gtk_quit_add (node at line 14799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_quit_add"
		}"
		end

	gtk_quit_add_full (a_main_level: NATURAL_32; a_function: POINTER; a_marshal: POINTER; a_data: POINTER; a_destroy: POINTER): NATURAL_32 is
 		-- gtk_quit_add_full (node at line 16878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_quit_add_full"
		}"
		end

	gtk_idle_add_full (a_priority: INTEGER_32; a_function: POINTER; a_marshal: POINTER; a_data: POINTER; a_destroy: POINTER): NATURAL_32 is
 		-- gtk_idle_add_full (node at line 17982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_idle_add_full"
		}"
		end

	gtk_timeout_remove (a_timeout_handler_id: NATURAL_32) is
 		-- gtk_timeout_remove (node at line 18696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_timeout_remove"
		}"
		end

	gtk_quit_remove_by_data (a_data: POINTER) is
 		-- gtk_quit_remove_by_data (node at line 18871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_quit_remove_by_data"
		}"
		end

	gtk_main_level: NATURAL_32 is
 		-- gtk_main_level (node at line 19843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_level()"
		}"
		end

	gtk_main_quit is
 		-- gtk_main_quit (node at line 22021)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_quit()"
		}"
		end

	gtk_input_remove (an_input_handler_id: NATURAL_32) is
 		-- gtk_input_remove (node at line 23868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_remove"
		}"
		end

	gtk_main_do_event (an_event: POINTER) is
 		-- gtk_main_do_event (node at line 23976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_do_event"
		}"
		end

	gtk_exit (an_error_code: INTEGER_32) is
 		-- gtk_exit (node at line 25338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_exit"
		}"
		end

	gtk_timeout_add (an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gtk_timeout_add (node at line 26455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_timeout_add"
		}"
		end

	gtk_grab_get_current: POINTER is
 		-- gtk_grab_get_current (node at line 27629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_get_current()"
		}"
		end

	gtk_get_current_event: POINTER is
 		-- gtk_get_current_event (node at line 29982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event()"
		}"
		end

	gtk_main is
 		-- gtk_main (node at line 30707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main()"
		}"
		end

	gtk_quit_remove (a_quit_handler_id: NATURAL_32) is
 		-- gtk_quit_remove (node at line 31729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_quit_remove"
		}"
		end

	gtk_init_with_args (an_argc: POINTER; an_argv: POINTER; a_parameter_string: POINTER; an_entries: POINTER; a_translation_domain: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_init_with_args (node at line 32006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_with_args"
		}"
		end

	gtk_grab_add (a_widget: POINTER) is
 		-- gtk_grab_add (node at line 32265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_add"
		}"
		end

	gtk_parse_args (an_argc: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- gtk_parse_args (node at line 32628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_parse_args"
		}"
		end

	gtk_input_add_full (a_source: INTEGER_32; a_condition: INTEGER; a_function: POINTER; a_marshal: POINTER; a_data: POINTER; a_destroy: POINTER): NATURAL_32 is
 		-- gtk_input_add_full (node at line 33460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_add_full"
		}"
		end

	gtk_idle_add_priority (a_priority: INTEGER_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gtk_idle_add_priority (node at line 33611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_idle_add_priority"
		}"
		end

	gtk_get_default_language: POINTER is
 		-- gtk_get_default_language (node at line 33716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_default_language()"
		}"
		end

	gtk_propagate_event (a_widget: POINTER; an_event: POINTER) is
 		-- gtk_propagate_event (node at line 33732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_propagate_event"
		}"
		end

	gtk_idle_remove_by_data (a_data: POINTER) is
 		-- gtk_idle_remove_by_data (node at line 33838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_idle_remove_by_data"
		}"
		end

	gtk_get_event_widget (an_event: POINTER): POINTER is
 		-- gtk_get_event_widget (node at line 34890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_event_widget"
		}"
		end

	gtk_quit_add_destroy (a_main_level: NATURAL_32; an_object: POINTER) is
 		-- gtk_quit_add_destroy (node at line 36481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_quit_add_destroy"
		}"
		end

	-- `hidden' function _gtk_boolean_handled_accumulator skipped.
	gtk_idle_add (a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gtk_idle_add (node at line 37565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_idle_add"
		}"
		end

feature {} -- Variables
	gtk_major_version: NATURAL_32 is
 		-- gtk_major_version (node at line 78)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_major_version"
		}"
		end

	gtk_binary_age: NATURAL_32 is
 		-- gtk_binary_age (node at line 81)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binary_age"
		}"
		end

	gtk_minor_version: NATURAL_32 is
 		-- gtk_minor_version (node at line 79)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_minor_version"
		}"
		end

	gtk_interface_age: NATURAL_32 is
 		-- gtk_interface_age (node at line 82)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_interface_age"
		}"
		end

	gtk_micro_version: NATURAL_32 is
 		-- gtk_micro_version (node at line 80)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_micro_version"
		}"
		end


end -- class GTKMAIN_EXTERNALS
