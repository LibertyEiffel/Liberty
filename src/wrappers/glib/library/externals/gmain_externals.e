-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMAIN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_main_context_check (a_context: POINTER; a_max_priority: INTEGER_32; a_fds: POINTER; a_n_fds: INTEGER_32): INTEGER_32 is
 		-- g_main_context_check (node at line 22)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_check"
		}"
		end

	g_source_remove_poll (a_source: POINTER; a_fd: POINTER) is
 		-- g_source_remove_poll (node at line 127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_remove_poll"
		}"
		end

	g_main_context_push_thread_default (a_context: POINTER) is
 		-- g_main_context_push_thread_default (node at line 218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_push_thread_default"
		}"
		end

	g_timeout_add_seconds_full (a_priority: INTEGER_32; an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_timeout_add_seconds_full (node at line 248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_add_seconds_full"
		}"
		end

	g_main_loop_quit (a_loop_external: POINTER) is
 		-- g_main_loop_quit (node at line 340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_quit"
		}"
		end

	g_get_current_time (a_result: POINTER) is
 		-- g_get_current_time (node at line 456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_current_time"
		}"
		end

	g_source_unref (a_source: POINTER) is
 		-- g_source_unref (node at line 509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_unref"
		}"
		end

	g_main_loop_run (a_loop_external: POINTER) is
 		-- g_main_loop_run (node at line 518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_run"
		}"
		end

	g_main_depth: INTEGER_32 is
 		-- g_main_depth (node at line 525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_depth()"
		}"
		end

	g_source_ref (a_source: POINTER): POINTER is
 		-- g_source_ref (node at line 592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_ref"
		}"
		end

	g_main_context_iteration (a_context: POINTER; a_may_block: INTEGER_32): INTEGER_32 is
 		-- g_main_context_iteration (node at line 929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_iteration"
		}"
		end

	g_main_context_dispatch (a_context: POINTER) is
 		-- g_main_context_dispatch (node at line 1046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_dispatch"
		}"
		end

	g_main_context_get_poll_func (a_context: POINTER): POINTER is
 		-- g_main_context_get_poll_func (node at line 1081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_get_poll_func"
		}"
		end

	g_source_get_can_recurse (a_source: POINTER): INTEGER_32 is
 		-- g_source_get_can_recurse (node at line 1126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_get_can_recurse"
		}"
		end

	g_source_set_callback (a_source: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- g_source_set_callback (node at line 1252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_callback"
		}"
		end

	g_main_context_wait (a_context: POINTER; a_cond: POINTER; a_mutex: POINTER): INTEGER_32 is
 		-- g_main_context_wait (node at line 1602)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_wait"
		}"
		end

	g_source_destroy (a_source: POINTER) is
 		-- g_source_destroy (node at line 1614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_destroy"
		}"
		end

	g_main_loop_unref (a_loop_external: POINTER) is
 		-- g_main_loop_unref (node at line 1693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_unref"
		}"
		end

	g_main_context_remove_poll (a_context: POINTER; a_fd: POINTER) is
 		-- g_main_context_remove_poll (node at line 2089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_remove_poll"
		}"
		end

	g_main_context_default: POINTER is
 		-- g_main_context_default (node at line 2208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_default()"
		}"
		end

	g_child_watch_source_new (a_pid: INTEGER_32): POINTER is
 		-- g_child_watch_source_new (node at line 2223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_child_watch_source_new"
		}"
		end

	g_main_context_new: POINTER is
 		-- g_main_context_new (node at line 2567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_new()"
		}"
		end

	g_source_remove_by_user_data (an_user_data: POINTER): INTEGER_32 is
 		-- g_source_remove_by_user_data (node at line 2583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_remove_by_user_data"
		}"
		end

	g_main_context_unref (a_context: POINTER) is
 		-- g_main_context_unref (node at line 2691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_unref"
		}"
		end

	g_source_get_id (a_source: POINTER): NATURAL_32 is
 		-- g_source_get_id (node at line 2935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_get_id"
		}"
		end

	g_source_remove (a_tag: NATURAL_32): INTEGER_32 is
 		-- g_source_remove (node at line 2963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_remove"
		}"
		end

	g_main_context_pending (a_context: POINTER): INTEGER_32 is
 		-- g_main_context_pending (node at line 2974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_pending"
		}"
		end

	g_main_context_find_source_by_user_data (a_context: POINTER; an_user_data: POINTER): POINTER is
 		-- g_main_context_find_source_by_user_data (node at line 3151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_find_source_by_user_data"
		}"
		end

	g_main_context_prepare (a_context: POINTER; a_priority: POINTER): INTEGER_32 is
 		-- g_main_context_prepare (node at line 3166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_prepare"
		}"
		end

	g_main_context_ref (a_context: POINTER): POINTER is
 		-- g_main_context_ref (node at line 3228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_ref"
		}"
		end

	g_main_context_wakeup (a_context: POINTER) is
 		-- g_main_context_wakeup (node at line 3325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_wakeup"
		}"
		end

	g_main_loop_get_context (a_loop_external: POINTER): POINTER is
 		-- g_main_loop_get_context (node at line 3477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_get_context"
		}"
		end

	g_source_add_poll (a_source: POINTER; a_fd: POINTER) is
 		-- g_source_add_poll (node at line 3628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_add_poll"
		}"
		end

	g_source_get_context (a_source: POINTER): POINTER is
 		-- g_source_get_context (node at line 3678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_get_context"
		}"
		end

	g_idle_add_full (a_priority: INTEGER_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_idle_add_full (node at line 3852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_idle_add_full"
		}"
		end

	g_source_get_current_time (a_source: POINTER; a_timeval: POINTER) is
 		-- g_source_get_current_time (node at line 3892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_get_current_time"
		}"
		end

	g_main_context_pop_thread_default (a_context: POINTER) is
 		-- g_main_context_pop_thread_default (node at line 4004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_pop_thread_default"
		}"
		end

	g_main_current_source: POINTER is
 		-- g_main_current_source (node at line 4016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_current_source()"
		}"
		end

	g_child_watch_add_full (a_priority: INTEGER_32; a_pid: INTEGER_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_child_watch_add_full (node at line 4079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_child_watch_add_full"
		}"
		end

	g_main_context_set_poll_func (a_context: POINTER; a_func: POINTER) is
 		-- g_main_context_set_poll_func (node at line 4109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_set_poll_func"
		}"
		end

	g_source_set_priority (a_source: POINTER; a_priority: INTEGER_32) is
 		-- g_source_set_priority (node at line 4227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_priority"
		}"
		end

	g_idle_add (a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_idle_add (node at line 4261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_idle_add"
		}"
		end

	g_main_context_add_poll (a_context: POINTER; a_fd: POINTER; a_priority: INTEGER_32) is
 		-- g_main_context_add_poll (node at line 4295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_add_poll"
		}"
		end

	g_idle_source_new: POINTER is
 		-- g_idle_source_new (node at line 4588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_idle_source_new()"
		}"
		end

	g_timeout_source_new (an_interval: NATURAL_32): POINTER is
 		-- g_timeout_source_new (node at line 4590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_source_new"
		}"
		end

	g_main_context_query (a_context: POINTER; a_max_priority: INTEGER_32; a_timeout: POINTER; a_fds: POINTER; a_n_fds: INTEGER_32): INTEGER_32 is
 		-- g_main_context_query (node at line 4679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_query"
		}"
		end

	g_source_is_destroyed (a_source: POINTER): INTEGER_32 is
 		-- g_source_is_destroyed (node at line 4743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_is_destroyed"
		}"
		end

	g_main_context_get_thread_default: POINTER is
 		-- g_main_context_get_thread_default (node at line 4876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_get_thread_default()"
		}"
		end

	g_idle_remove_by_data (a_data: POINTER): INTEGER_32 is
 		-- g_idle_remove_by_data (node at line 4878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_idle_remove_by_data"
		}"
		end

	g_source_get_priority (a_source: POINTER): INTEGER_32 is
 		-- g_source_get_priority (node at line 4908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_get_priority"
		}"
		end

	g_main_loop_new (a_context: POINTER; an_is_running: INTEGER_32): POINTER is
 		-- g_main_loop_new (node at line 4974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_new"
		}"
		end

	g_timeout_add_full (a_priority: INTEGER_32; an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_timeout_add_full (node at line 4984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_add_full"
		}"
		end

	g_source_new (a_source_funcs: POINTER; a_struct_size: NATURAL_32): POINTER is
 		-- g_source_new (node at line 5101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_new"
		}"
		end

	g_main_context_release (a_context: POINTER) is
 		-- g_main_context_release (node at line 5113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_release"
		}"
		end

	g_main_context_find_source_by_funcs_user_data (a_context: POINTER; a_funcs: POINTER; an_user_data: POINTER): POINTER is
 		-- g_main_context_find_source_by_funcs_user_data (node at line 5116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_find_source_by_funcs_user_data"
		}"
		end

	g_main_context_find_source_by_id (a_context: POINTER; a_source_id: NATURAL_32): POINTER is
 		-- g_main_context_find_source_by_id (node at line 5175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_find_source_by_id"
		}"
		end

	g_main_context_acquire (a_context: POINTER): INTEGER_32 is
 		-- g_main_context_acquire (node at line 5202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_acquire"
		}"
		end

	g_source_set_can_recurse (a_source: POINTER; a_can_recurse: INTEGER_32) is
 		-- g_source_set_can_recurse (node at line 5413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_can_recurse"
		}"
		end

	g_source_set_funcs (a_source: POINTER; a_funcs: POINTER) is
 		-- g_source_set_funcs (node at line 5471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_funcs"
		}"
		end

	g_source_set_callback_indirect (a_source: POINTER; a_callback_data: POINTER; a_callback_funcs: POINTER) is
 		-- g_source_set_callback_indirect (node at line 5516)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_callback_indirect"
		}"
		end

	g_main_loop_ref (a_loop_external: POINTER): POINTER is
 		-- g_main_loop_ref (node at line 5650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_ref"
		}"
		end

	g_timeout_source_new_seconds (an_interval: NATURAL_32): POINTER is
 		-- g_timeout_source_new_seconds (node at line 5793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_source_new_seconds"
		}"
		end

	g_timeout_add_seconds (an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_timeout_add_seconds (node at line 5936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_add_seconds"
		}"
		end

	g_source_remove_by_funcs_user_data (a_funcs: POINTER; an_user_data: POINTER): INTEGER_32 is
 		-- g_source_remove_by_funcs_user_data (node at line 6194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_remove_by_funcs_user_data"
		}"
		end

	g_child_watch_add (a_pid: INTEGER_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_child_watch_add (node at line 6331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_child_watch_add"
		}"
		end

	g_main_loop_is_running (a_loop_external: POINTER): INTEGER_32 is
 		-- g_main_loop_is_running (node at line 6357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_loop_is_running"
		}"
		end

	g_main_context_is_owner (a_context: POINTER): INTEGER_32 is
 		-- g_main_context_is_owner (node at line 6680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_main_context_is_owner"
		}"
		end

	g_timeout_add (an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_timeout_add (node at line 6683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timeout_add"
		}"
		end

	g_source_attach (a_source: POINTER; a_context: POINTER): NATURAL_32 is
 		-- g_source_attach (node at line 6766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_attach"
		}"
		end


end -- class GMAIN_EXTERNALS
