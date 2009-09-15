-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GMESSAGES_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_log_default_handler (a_log_domain: POINTER; a_log_level: INTEGER_32; a_message: POINTER; an_unused_data: POINTER) is
 		-- g_log_default_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_default_handler"
		}"
		end

	g_warn_message (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; a_warnexpr: POINTER) is
 		-- g_warn_message
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_warn_message"
		}"
		end

	g_printf_string_upper_bound (a_format: POINTER; an_args: POINTER): NATURAL_32 is
 		-- g_printf_string_upper_bound
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_printf_string_upper_bound"
		}"
		end

	g_assert_warning (a_log_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_pretty_function: POINTER; an_expression: POINTER) is
 		-- g_assert_warning
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assert_warning"
		}"
		end

	g_set_printerr_handler (a_func: POINTER): POINTER is
 		-- g_set_printerr_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_printerr_handler"
		}"
		end

	g_log_set_default_handler (a_log_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_log_set_default_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_set_default_handler"
		}"
		end

	g_print (a_format: POINTER; ) is
 		-- g_print			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_print"
		}"
		end

	g_log_remove_handler (a_log_domain: POINTER; a_handler_id: NATURAL_32) is
 		-- g_log_remove_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_remove_handler"
		}"
		end

	g_log_set_always_fatal (a_fatal_mask: INTEGER_32): INTEGER_32 is
 		-- g_log_set_always_fatal
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_set_always_fatal"
		}"
		end

	g_log_set_fatal_mask (a_log_domain: POINTER; a_fatal_mask: INTEGER_32): INTEGER_32 is
 		-- g_log_set_fatal_mask
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_set_fatal_mask"
		}"
		end

	g_set_print_handler (a_func: POINTER): POINTER is
 		-- g_set_print_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_print_handler"
		}"
		end

	g_return_if_fail_warning (a_log_domain: POINTER; a_pretty_function: POINTER; an_expression: POINTER) is
 		-- g_return_if_fail_warning
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_return_if_fail_warning"
		}"
		end

	g_printerr (a_format: POINTER; ) is
 		-- g_printerr			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_printerr"
		}"
		end

	g_log (a_log_domain: POINTER; a_log_level: INTEGER_32; a_format: POINTER; ) is
 		-- g_log			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log"
		}"
		end

	g_logv (a_log_domain: POINTER; a_log_level: INTEGER_32; a_format: POINTER; an_args: POINTER) is
 		-- g_logv
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_logv"
		}"
		end

	g_log_set_handler (a_log_domain: POINTER; a_log_levels: INTEGER_32; a_log_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_log_set_handler
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_log_set_handler"
		}"
		end

end
