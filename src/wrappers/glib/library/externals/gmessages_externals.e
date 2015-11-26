-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GMESSAGES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_assert_warning (a_log_domain: POINTER; a_file: POINTER; a_line: INTEGER; a_pretty_function: POINTER; an_expression: POINTER) 
               -- g_assert_warning
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_assert_warning"
               }"
               end

	g_log (a_log_domain: POINTER; a_log_level: INTEGER; a_format: POINTER) 
               -- g_log (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log"
               }"
               end

	g_log_default_handler (a_log_domain: POINTER; a_log_level: INTEGER; a_message: POINTER; an_unused_data: POINTER) 
               -- g_log_default_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_default_handler"
               }"
               end

	-- `hidden' function _g_log_fallback_handler skipped.
	g_log_remove_handler (a_log_domain: POINTER; a_handler_id: NATURAL) 
               -- g_log_remove_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_remove_handler"
               }"
               end

	g_log_set_always_fatal (a_fatal_mask: INTEGER): INTEGER 
               -- g_log_set_always_fatal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_set_always_fatal"
               }"
               end

	g_log_set_default_handler (a_log_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_log_set_default_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_set_default_handler"
               }"
               end

	g_log_set_fatal_mask (a_log_domain: POINTER; a_fatal_mask: INTEGER): INTEGER 
               -- g_log_set_fatal_mask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_set_fatal_mask"
               }"
               end

	g_log_set_handler (a_log_domain: POINTER; a_log_levels: INTEGER; a_log_func: POINTER; an_user_data: POINTER): NATURAL 
               -- g_log_set_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_set_handler"
               }"
               end

	g_log_set_handler_full (a_log_domain: POINTER; a_log_levels: INTEGER; a_log_func: POINTER; an_user_data: POINTER; a_destroy: POINTER): NATURAL 
               -- g_log_set_handler_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_log_set_handler_full"
               }"
               end

	g_logv (a_log_domain: POINTER; a_log_level: INTEGER; a_format: POINTER; an_args: POINTER) 
               -- g_logv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_logv"
               }"
               end

	g_print (a_format: POINTER) 
               -- g_print (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_print"
               }"
               end

	g_printerr (a_format: POINTER) 
               -- g_printerr (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_printerr"
               }"
               end

	g_printf_string_upper_bound (a_format: POINTER; an_args: POINTER): like long_unsigned 
               -- g_printf_string_upper_bound
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_printf_string_upper_bound"
               }"
               end

	g_return_if_fail_warning (a_log_domain: POINTER; a_pretty_function: POINTER; an_expression: POINTER) 
               -- g_return_if_fail_warning
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_return_if_fail_warning"
               }"
               end

	g_set_print_handler (a_func: POINTER): POINTER 
               -- g_set_print_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_print_handler"
               }"
               end

	g_set_printerr_handler (a_func: POINTER): POINTER 
               -- g_set_printerr_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_printerr_handler"
               }"
               end

	g_warn_message (a_domain: POINTER; a_file: POINTER; a_line: INTEGER; a_func: POINTER; a_warnexpr: POINTER) 
               -- g_warn_message
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_warn_message"
               }"
               end


end -- class GMESSAGES_EXTERNALS
