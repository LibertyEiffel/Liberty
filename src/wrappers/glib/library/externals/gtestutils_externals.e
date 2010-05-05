-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTESTUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_test_suite_add_suite (a_suite: POINTER; a_nestedsuite: POINTER) is
 		-- g_test_suite_add_suite (node at line 151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_suite_add_suite"
		}"
		end

	g_test_add_data_func (a_testpath: POINTER; a_test_data: POINTER; a_test_func: POINTER) is
 		-- g_test_add_data_func (node at line 186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_add_data_func"
		}"
		end

	g_test_rand_double: REAL_64 is
 		-- g_test_rand_double (node at line 760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_rand_double()"
		}"
		end

	g_test_bug_base (an_uri_pattern: POINTER) is
 		-- g_test_bug_base (node at line 873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_bug_base"
		}"
		end

	g_test_log_buffer_new: POINTER is
 		-- g_test_log_buffer_new (node at line 976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_buffer_new()"
		}"
		end

	g_test_get_root: POINTER is
 		-- g_test_get_root (node at line 1090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_get_root()"
		}"
		end

	g_test_add_vtable (a_testpath: POINTER; a_data_size: NATURAL_32; a_test_data: POINTER; a_data_setup: POINTER; a_data_test: POINTER; a_data_teardown: POINTER) is
 		-- g_test_add_vtable (node at line 1267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_add_vtable"
		}"
		end

	g_test_log_set_fatal_handler (a_log_func: POINTER; an_user_data: POINTER) is
 		-- g_test_log_set_fatal_handler (node at line 1610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_set_fatal_handler"
		}"
		end

	g_assertion_message_expr (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER) is
 		-- g_assertion_message_expr (node at line 1722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_assertion_message_expr"
		}"
		end

	g_test_queue_free (a_gfree_pointer: POINTER) is
 		-- g_test_queue_free (node at line 1761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_queue_free"
		}"
		end

	g_test_bug (a_bug_uri_snippet: POINTER) is
 		-- g_test_bug (node at line 1902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_bug"
		}"
		end

	g_test_timer_last: REAL_64 is
 		-- g_test_timer_last (node at line 2068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_timer_last()"
		}"
		end

	g_test_trap_has_passed: INTEGER_32 is
 		-- g_test_trap_has_passed (node at line 2379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_trap_has_passed()"
		}"
		end

	-- function g_assertion_message_cmpnum (at line 209 in file /usr/include/glib-2.0/glib/gtestutils.h is not wrappable
	-- function g_test_message (at line 121 in file /usr/include/glib-2.0/glib/gtestutils.h is not wrappable
	g_test_run: INTEGER_32 is
 		-- g_test_run (node at line 2694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_run()"
		}"
		end

	g_test_timer_start is
 		-- g_test_timer_start (node at line 3001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_timer_start()"
		}"
		end

	g_test_rand_int: INTEGER_32 is
 		-- g_test_rand_int (node at line 3098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_rand_int()"
		}"
		end

	g_test_rand_int_range (a_begin: INTEGER_32; an_end_external: INTEGER_32): INTEGER_32 is
 		-- g_test_rand_int_range (node at line 3338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_rand_int_range"
		}"
		end

	-- function g_test_maximized_result (at line 85 in file /usr/include/glib-2.0/glib/gtestutils.h is not wrappable
	g_test_suite_add (a_suite: POINTER; a_test_case: POINTER) is
 		-- g_test_suite_add (node at line 3708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_suite_add"
		}"
		end

	g_test_add_func (a_testpath: POINTER; a_test_func: POINTER) is
 		-- g_test_add_func (node at line 4012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_add_func"
		}"
		end

	-- function g_test_init (at line 90 in file /usr/include/glib-2.0/glib/gtestutils.h is not wrappable
	g_assertion_message_error (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER; an_error: POINTER; an_error_domain: NATURAL_32; an_error_code: INTEGER_32) is
 		-- g_assertion_message_error (node at line 4191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_assertion_message_error"
		}"
		end

	g_test_run_suite (a_suite: POINTER): INTEGER_32 is
 		-- g_test_run_suite (node at line 4911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_run_suite"
		}"
		end

	g_assertion_message_cmpstr (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_expr: POINTER; an_arg1: POINTER; a_cmp: POINTER; an_arg2: POINTER) is
 		-- g_assertion_message_cmpstr (node at line 4937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_assertion_message_cmpstr"
		}"
		end

	g_test_trap_reached_timeout: INTEGER_32 is
 		-- g_test_trap_reached_timeout (node at line 4965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_trap_reached_timeout()"
		}"
		end

	g_test_log_buffer_pop (a_tbuffer: POINTER): POINTER is
 		-- g_test_log_buffer_pop (node at line 4981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_buffer_pop"
		}"
		end

	-- function g_test_minimized_result (at line 82 in file /usr/include/glib-2.0/glib/gtestutils.h is not wrappable
	g_test_create_suite (a_suite_name: POINTER): POINTER is
 		-- g_test_create_suite (node at line 5527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_create_suite"
		}"
		end

	g_test_trap_assertions (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; an_assertion_flags: NATURAL_64; a_pattern: POINTER) is
 		-- g_test_trap_assertions (node at line 5665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_trap_assertions"
		}"
		end

	g_test_queue_destroy (a_destroy_func: POINTER; a_destroy_data: POINTER) is
 		-- g_test_queue_destroy (node at line 5681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_queue_destroy"
		}"
		end

	g_test_rand_double_range (a_range_start: REAL_64; a_range_end: REAL_64): REAL_64 is
 		-- g_test_rand_double_range (node at line 5860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_rand_double_range"
		}"
		end

	g_test_log_buffer_push (a_tbuffer: POINTER; a_n_bytes: NATURAL_32; a_bytes: POINTER) is
 		-- g_test_log_buffer_push (node at line 6248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_buffer_push"
		}"
		end

	g_assertion_message (a_domain: POINTER; a_file: POINTER; a_line: INTEGER_32; a_func: POINTER; a_message: POINTER) is
 		-- g_assertion_message (node at line 6555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_assertion_message"
		}"
		end

	g_strcmp0 (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- g_strcmp0 (node at line 6609)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcmp0"
		}"
		end

	g_test_log_msg_free (a_tmsg: POINTER) is
 		-- g_test_log_msg_free (node at line 6701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_msg_free"
		}"
		end

	g_test_log_type_name (a_log_type: INTEGER): POINTER is
 		-- g_test_log_type_name (node at line 6719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_type_name"
		}"
		end

	g_test_create_case (a_test_name: POINTER; a_data_size: NATURAL_32; a_test_data: POINTER; a_data_setup: POINTER; a_data_test: POINTER; a_data_teardown: POINTER): POINTER is
 		-- g_test_create_case (node at line 6806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_create_case"
		}"
		end

	g_test_log_buffer_free (a_tbuffer: POINTER) is
 		-- g_test_log_buffer_free (node at line 6901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_log_buffer_free"
		}"
		end

	g_test_timer_elapsed: REAL_64 is
 		-- g_test_timer_elapsed (node at line 6939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_timer_elapsed()"
		}"
		end

	g_test_trap_fork (an_usec_timeout: NATURAL_64; a_test_trap_flags: INTEGER): INTEGER_32 is
 		-- g_test_trap_fork (node at line 6940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_test_trap_fork"
		}"
		end


end -- class GTESTUTILS_EXTERNALS
