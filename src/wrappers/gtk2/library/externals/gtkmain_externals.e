-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMAIN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_major_version: NATURAL_32 is
 		-- gtk_major_version (node at line 78)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_major_version"
		}"
		end

	address_of_gtk_major_version: POINTER is
 		-- Address of gtk_major_version (node at line 78)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_major_version"
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

	address_of_gtk_interface_age: POINTER is
 		-- Address of gtk_interface_age (node at line 82)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_interface_age"
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

	address_of_gtk_binary_age: POINTER is
 		-- Address of gtk_binary_age (node at line 81)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_binary_age"
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

	address_of_gtk_minor_version: POINTER is
 		-- Address of gtk_minor_version (node at line 79)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_minor_version"
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

	address_of_gtk_micro_version: POINTER is
 		-- Address of gtk_micro_version (node at line 80)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_micro_version"
		}"
		end

	gtk_main_iteration_do (a_blocking: INTEGER_32): INTEGER_32 is
 		-- gtk_main_iteration_do (node at line 2711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration_do"
		}"
		end

	gtk_main_iteration: INTEGER_32 is
 		-- gtk_main_iteration (node at line 3712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration()"
		}"
		end

	gtk_init (an_argc: POINTER; an_argv: POINTER) is
 		-- gtk_init (node at line 4000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init"
		}"
		end

	gtk_events_pending: INTEGER_32 is
 		-- gtk_events_pending (node at line 4138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_events_pending()"
		}"
		end

	gtk_key_snooper_remove (a_snooper_handler_id: NATURAL_32) is
 		-- gtk_key_snooper_remove (node at line 4487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_remove"
		}"
		end

	gtk_true: INTEGER_32 is
 		-- gtk_true (node at line 4494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_true()"
		}"
		end

	gtk_get_current_event_state (a_state: POINTER): INTEGER_32 is
 		-- gtk_get_current_event_state (node at line 4668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_state"
		}"
		end

	-- `hidden' function _gtk_get_lc_ctype skipped.
	gtk_get_option_group (an_open_default_display: INTEGER_32): POINTER is
 		-- gtk_get_option_group (node at line 5541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_option_group"
		}"
		end

	gtk_grab_remove (a_widget: POINTER) is
 		-- gtk_grab_remove (node at line 6913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_remove"
		}"
		end

	gtk_false: INTEGER_32 is
 		-- gtk_false (node at line 11861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_false()"
		}"
		end

	-- `hidden' function _gtk_module_has_mixed_deps skipped.
	gtk_init_check (an_argc: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- gtk_init_check (node at line 13779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_check"
		}"
		end

	gtk_disable_setlocale is
 		-- gtk_disable_setlocale (node at line 15543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_disable_setlocale()"
		}"
		end

	gtk_key_snooper_install (a_snooper: POINTER; a_func_data: POINTER): NATURAL_32 is
 		-- gtk_key_snooper_install (node at line 19104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_install"
		}"
		end

	gtk_main_quit is
 		-- gtk_main_quit (node at line 24789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_quit()"
		}"
		end

	gtk_main_do_event (an_event: POINTER) is
 		-- gtk_main_do_event (node at line 26471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_do_event"
		}"
		end

	gtk_get_current_event: POINTER is
 		-- gtk_get_current_event (node at line 33051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event()"
		}"
		end

	gtk_main is
 		-- gtk_main (node at line 33935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main()"
		}"
		end

	gtk_check_version (a_required_major: NATURAL_32; a_required_minor: NATURAL_32; a_required_micro: NATURAL_32): POINTER is
 		-- gtk_check_version (node at line 34724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_version"
		}"
		end

	gtk_init_with_args (an_argc: POINTER; an_argv: POINTER; a_parameter_string: POINTER; an_entries: POINTER; a_translation_domain: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_init_with_args (node at line 35354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_with_args"
		}"
		end

	gtk_get_current_event_time: NATURAL_32 is
 		-- gtk_get_current_event_time (node at line 35593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_time()"
		}"
		end

	gtk_grab_add (a_widget: POINTER) is
 		-- gtk_grab_add (node at line 35626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_add"
		}"
		end

	gtk_parse_args (an_argc: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- gtk_parse_args (node at line 36004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_parse_args"
		}"
		end

	gtk_grab_get_current: POINTER is
 		-- gtk_grab_get_current (node at line 36190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_get_current()"
		}"
		end

	gtk_get_default_language: POINTER is
 		-- gtk_get_default_language (node at line 37233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_default_language()"
		}"
		end

	gtk_propagate_event (a_widget: POINTER; an_event: POINTER) is
 		-- gtk_propagate_event (node at line 37250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_propagate_event"
		}"
		end

	gtk_get_event_widget (an_event: POINTER): POINTER is
 		-- gtk_get_event_widget (node at line 38479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_event_widget"
		}"
		end

	-- `hidden' function _gtk_boolean_handled_accumulator skipped.
	gtk_main_level: NATURAL_32 is
 		-- gtk_main_level (node at line 41292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_level()"
		}"
		end


end -- class GTKMAIN_EXTERNALS
