-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GTESTUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_test_suite_add_suite (a_suite: POINTER; a_nestedsuite: POINTER) is
 		-- g_test_suite_add_suite
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_suite_add_suite"
		}"
		end

	g_test_add_data_func (a_testpath: POINTER; a_test_data: POINTER; a_test_func: POINTER) is
 		-- g_test_add_data_func
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_add_data_func"
		}"
		end

	g_test_rand_double: REAL_64 is
 		-- g_test_rand_double
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_rand_double"
		}"
		end

	g_test_bug_base (an_uri_pattern: POINTER) is
 		-- g_test_bug_base
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_bug_base"
		}"
		end

	g_test_log_buffer_new: POINTER is
 		-- g_test_log_buffer_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_buffer_new"
		}"
		end

	g_test_get_root: POINTER is
 		-- g_test_get_root
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_get_root"
		}"
		end

	g_test_add_vtable (a_testpath: POINTER; a_data_size: NATURAL_32; a_test_data: POINTER; a_data_setup: POINTER; a_data_test: POINTER; a_data_teardown: POINTER) is
 		-- g_test_add_vtable
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_add_vtable"
		}"
		end

	g_assertion_message_expr (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER) is
 		-- g_assertion_message_expr
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assertion_message_expr"
		}"
		end

	g_test_queue_free (a_gfree_pointer: POINTER) is
 		-- g_test_queue_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_queue_free"
		}"
		end

	g_test_bug (a_bug_uri_snippet: POINTER) is
 		-- g_test_bug
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_bug"
		}"
		end

	g_test_timer_last: REAL_64 is
 		-- g_test_timer_last
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_timer_last"
		}"
		end

	g_test_trap_has_passed: INTEGER_32 is
 		-- g_test_trap_has_passed
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_trap_has_passed"
		}"
		end

	g_assertion_message_cmpnum (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER; 
			-- argument an_arg1 unwrappable: Unhandled double type
) is
 		-- g_assertion_message_cmpnum
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assertion_message_cmpnum"
		}"
		end

	g_test_message (a_format: POINTER; ) is
 		-- g_test_message			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_message"
		}"
		end

	g_test_run: INTEGER_32 is
 		-- g_test_run			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_run"
		}"
		end

	g_test_timer_start is
 		-- g_test_timer_start			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_timer_start"
		}"
		end

	g_test_rand_int: INTEGER_32 is
 		-- g_test_rand_int			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_rand_int"
		}"
		end

	g_test_rand_int_range (a_begin: INTEGER_32; an_end_external: INTEGER_32): INTEGER_32 is
 		-- g_test_rand_int_range
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_rand_int_range"
		}"
		end

	g_test_maximized_result (a_maximized_quantity: REAL_64; a_format: POINTER; ) is
 		-- g_test_maximized_result			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_maximized_result"
		}"
		end

	g_test_suite_add (a_suite: POINTER; a_test_case: POINTER) is
 		-- g_test_suite_add
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_suite_add"
		}"
		end

	g_test_add_func (a_testpath: POINTER; a_test_func: POINTER) is
 		-- g_test_add_func
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_add_func"
		}"
		end

	g_test_init (an_argc: POINTER; an_argv: POINTER; ) is
 		-- g_test_init			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_init"
		}"
		end

	g_assertion_message_error (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER; an_error: POINTER; an_error_domain: NATURAL_32; an_error_code: INTEGER_32) is
 		-- g_assertion_message_error
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assertion_message_error"
		}"
		end

	g_test_run_suite (a_suite: POINTER): INTEGER_32 is
 		-- g_test_run_suite
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_run_suite"
		}"
		end

	g_assertion_message_cmpstr (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER; an_arg1: POINTER; a_cmp: POINTER; an_arg2: POINTER) is
 		-- g_assertion_message_cmpstr
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assertion_message_cmpstr"
		}"
		end

	g_test_trap_reached_timeout: INTEGER_32 is
 		-- g_test_trap_reached_timeout
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_trap_reached_timeout"
		}"
		end

	g_test_log_buffer_pop (a_tbuffer: POINTER): POINTER is
 		-- g_test_log_buffer_pop
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_buffer_pop"
		}"
		end

	g_test_minimized_result (a_minimized_quantity: REAL_64; a_format: POINTER; ) is
 		-- g_test_minimized_result			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_minimized_result"
		}"
		end

	g_test_create_suite (a_suite_name: POINTER): POINTER is
 		-- g_test_create_suite
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_create_suite"
		}"
		end

	g_test_trap_assertions (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_assertion_flags: NATURAL_64; a_pattern: POINTER) is
 		-- g_test_trap_assertions
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_trap_assertions"
		}"
		end

	g_test_queue_destroy (a_destroy_func: POINTER; a_destroy_data: POINTER) is
 		-- g_test_queue_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_queue_destroy"
		}"
		end

	g_test_rand_double_range (a_range_start: REAL_64; a_range_end: REAL_64): REAL_64 is
 		-- g_test_rand_double_range
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_rand_double_range"
		}"
		end

	g_test_log_buffer_push (a_tbuffer: POINTER; a_n_bytes: NATURAL_32; a_bytes: POINTER) is
 		-- g_test_log_buffer_push
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_buffer_push"
		}"
		end

	g_assertion_message (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; a_message: POINTER) is
 		-- g_assertion_message
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_assertion_message"
		}"
		end

	g_strcmp0 (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- g_strcmp0
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_strcmp0"
		}"
		end

	g_test_log_msg_free (a_tmsg: POINTER) is
 		-- g_test_log_msg_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_msg_free"
		}"
		end

	g_test_log_type_name (a_log_type: INTEGER_32): POINTER is
 		-- g_test_log_type_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_type_name"
		}"
		end

	g_test_create_case (a_test_name: POINTER; a_data_size: NATURAL_32; a_test_data: POINTER; a_data_setup: POINTER; a_data_test: POINTER; a_data_teardown: POINTER): POINTER is
 		-- g_test_create_case
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_create_case"
		}"
		end

	g_test_log_buffer_free (a_tbuffer: POINTER) is
 		-- g_test_log_buffer_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_log_buffer_free"
		}"
		end

	g_test_timer_elapsed: REAL_64 is
 		-- g_test_timer_elapsed
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_timer_elapsed"
		}"
		end

	g_test_trap_fork (an_usec_timeout: NATURAL_64; a_test_trap_flags: INTEGER_32): INTEGER_32 is
 		-- g_test_trap_fork
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_test_trap_fork"
		}"
		end

end
