-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMAIN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_binary_age: NATURAL is
 		-- gtk_binary_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binary_age"
		}"
		end

	address_of_gtk_binary_age: POINTER is
 		-- Address of gtk_binary_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_binary_age"
		}"
		end

	set_gtk_binary_age (a_value: NATURAL) is
		-- Set variable gtk_binary_age value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_binary_age"
		}"
		end

	-- `hidden' function _gtk_boolean_handled_accumulator skipped.
	gtk_check_version (a_required_major: NATURAL; a_required_minor: NATURAL; a_required_micro: NATURAL): POINTER is
 		-- gtk_check_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_version"
		}"
		end

	gtk_disable_setlocale is
 		-- gtk_disable_setlocale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_disable_setlocale()"
		}"
		end

	gtk_events_pending: INTEGER is
 		-- gtk_events_pending
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_events_pending()"
		}"
		end

	gtk_false: INTEGER is
 		-- gtk_false
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_false()"
		}"
		end

	gtk_get_current_event: POINTER is
 		-- gtk_get_current_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event()"
		}"
		end

	gtk_get_current_event_state (a_state: POINTER): INTEGER is
 		-- gtk_get_current_event_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_state"
		}"
		end

	gtk_get_current_event_time: NATURAL is
 		-- gtk_get_current_event_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_current_event_time()"
		}"
		end

	gtk_get_default_language: POINTER is
 		-- gtk_get_default_language
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_default_language()"
		}"
		end

	gtk_get_event_widget (an_event: POINTER): POINTER is
 		-- gtk_get_event_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_event_widget"
		}"
		end

	-- `hidden' function _gtk_get_lc_ctype skipped.
	gtk_get_option_group (an_open_default_display: INTEGER): POINTER is
 		-- gtk_get_option_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_get_option_group"
		}"
		end

	gtk_grab_add (a_widget: POINTER) is
 		-- gtk_grab_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_add"
		}"
		end

	gtk_grab_get_current: POINTER is
 		-- gtk_grab_get_current
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_get_current()"
		}"
		end

	gtk_grab_remove (a_widget: POINTER) is
 		-- gtk_grab_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_grab_remove"
		}"
		end

	gtk_init (an_argc: POINTER; an_argv: POINTER) is
 		-- gtk_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init"
		}"
		end

	gtk_init_check (an_argc: POINTER; an_argv: POINTER): INTEGER is
 		-- gtk_init_check
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_check"
		}"
		end

	gtk_init_with_args (an_argc: POINTER; an_argv: POINTER; a_parameter_string: POINTER; an_entries: POINTER; a_translation_domain: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_init_with_args
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_init_with_args"
		}"
		end

	gtk_interface_age: NATURAL is
 		-- gtk_interface_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_interface_age"
		}"
		end

	address_of_gtk_interface_age: POINTER is
 		-- Address of gtk_interface_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_interface_age"
		}"
		end

	set_gtk_interface_age (a_value: NATURAL) is
		-- Set variable gtk_interface_age value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_interface_age"
		}"
		end

	gtk_key_snooper_install (a_snooper: POINTER; a_func_data: POINTER): NATURAL is
 		-- gtk_key_snooper_install
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_install"
		}"
		end

	gtk_key_snooper_remove (a_snooper_handler_id: NATURAL) is
 		-- gtk_key_snooper_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_key_snooper_remove"
		}"
		end

	gtk_main is
 		-- gtk_main
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main()"
		}"
		end

	gtk_main_do_event (an_event: POINTER) is
 		-- gtk_main_do_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_do_event"
		}"
		end

	gtk_main_iteration: INTEGER is
 		-- gtk_main_iteration
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration()"
		}"
		end

	gtk_main_iteration_do (a_blocking: INTEGER): INTEGER is
 		-- gtk_main_iteration_do
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_iteration_do"
		}"
		end

	gtk_main_level: NATURAL is
 		-- gtk_main_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_level()"
		}"
		end

	gtk_main_quit is
 		-- gtk_main_quit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_main_quit()"
		}"
		end

	gtk_major_version: NATURAL is
 		-- gtk_major_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_major_version"
		}"
		end

	address_of_gtk_major_version: POINTER is
 		-- Address of gtk_major_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_major_version"
		}"
		end

	set_gtk_major_version (a_value: NATURAL) is
		-- Set variable gtk_major_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_major_version"
		}"
		end

	gtk_micro_version: NATURAL is
 		-- gtk_micro_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_micro_version"
		}"
		end

	address_of_gtk_micro_version: POINTER is
 		-- Address of gtk_micro_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_micro_version"
		}"
		end

	set_gtk_micro_version (a_value: NATURAL) is
		-- Set variable gtk_micro_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_micro_version"
		}"
		end

	gtk_minor_version: NATURAL is
 		-- gtk_minor_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_minor_version"
		}"
		end

	address_of_gtk_minor_version: POINTER is
 		-- Address of gtk_minor_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_minor_version"
		}"
		end

	set_gtk_minor_version (a_value: NATURAL) is
		-- Set variable gtk_minor_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_minor_version"
		}"
		end

	-- `hidden' function _gtk_module_has_mixed_deps skipped.
	gtk_parse_args (an_argc: POINTER; an_argv: POINTER): INTEGER is
 		-- gtk_parse_args
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_parse_args"
		}"
		end

	gtk_propagate_event (a_widget: POINTER; an_event: POINTER) is
 		-- gtk_propagate_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_propagate_event"
		}"
		end

	gtk_true: INTEGER is
 		-- gtk_true
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_true()"
		}"
		end


end -- class GTKMAIN_EXTERNALS
