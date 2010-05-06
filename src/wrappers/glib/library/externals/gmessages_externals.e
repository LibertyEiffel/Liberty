-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMESSAGES_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_log_default_handler (a_log_domain: POINTER; a_log_level: INTEGER; a_message: POINTER; an_unused_data: POINTER) is
 		-- g_log_default_handler (node at line 1341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_default_handler"
		}"
		end

	g_warn_message (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; a_warnexpr: POINTER) is
 		-- g_warn_message (node at line 1580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_warn_message"
		}"
		end

	g_printf_string_upper_bound (a_format: POINTER; an_args: POINTER): NATURAL_32 is
 		-- g_printf_string_upper_bound (node at line 1910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_printf_string_upper_bound"
		}"
		end

	g_assert_warning (a_log_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_pretty_function: POINTER; an_expression: POINTER) is
 		-- g_assert_warning (node at line 2072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_assert_warning"
		}"
		end

	g_set_printerr_handler (a_func: POINTER): POINTER is
 		-- g_set_printerr_handler (node at line 2839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_printerr_handler"
		}"
		end

	g_log_set_default_handler (a_log_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_log_set_default_handler (node at line 3700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_set_default_handler"
		}"
		end

	-- function g_print (at line 231 in file /usr/include/glib-2.0/glib/gmessages.h is not wrappable
	g_log_remove_handler (a_log_domain: POINTER; a_handler_id: NATURAL_32) is
 		-- g_log_remove_handler (node at line 4117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_remove_handler"
		}"
		end

	g_log_set_always_fatal (a_fatal_mask: INTEGER): INTEGER is
 		-- g_log_set_always_fatal (node at line 4353)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_set_always_fatal"
		}"
		end

	g_log_set_fatal_mask (a_log_domain: POINTER; a_fatal_mask: INTEGER): INTEGER is
 		-- g_log_set_fatal_mask (node at line 4423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_set_fatal_mask"
		}"
		end

	g_set_print_handler (a_func: POINTER): POINTER is
 		-- g_set_print_handler (node at line 4978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_print_handler"
		}"
		end

	g_return_if_fail_warning (a_log_domain: POINTER; a_pretty_function: POINTER; an_expression: POINTER) is
 		-- g_return_if_fail_warning (node at line 5455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_return_if_fail_warning"
		}"
		end

	-- `hidden' function _g_log_fallback_handler skipped.
	-- function g_printerr (at line 234 in file /usr/include/glib-2.0/glib/gmessages.h is not wrappable
	-- function g_log (at line 100 in file /usr/include/glib-2.0/glib/gmessages.h is not wrappable
	g_logv (a_log_domain: POINTER; a_log_level: INTEGER; a_format: POINTER; an_args: POINTER) is
 		-- g_logv (node at line 6775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_logv"
		}"
		end

	g_log_set_handler (a_log_domain: POINTER; a_log_levels: INTEGER; a_log_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_log_set_handler (node at line 6863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_log_set_handler"
		}"
		end


end -- class GMESSAGES_EXTERNALS
