-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GMAIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_child_watch_add (a_pid: INTEGER; a_function: POINTER; a_data: POINTER): NATURAL 
               -- g_child_watch_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_child_watch_add"
               }"
               end

	g_child_watch_add_full (a_priority: INTEGER; a_pid: INTEGER; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL 
               -- g_child_watch_add_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_child_watch_add_full"
               }"
               end

       -- Variable g_child_watch_funcs (at line 607 in file /usr/include/glib-2.0/glib/gmain.h does not have a wrapper type
       address_of_g_child_watch_funcs: POINTER
               -- Address of g_child_watch_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_child_watch_funcs"
               }"
               end

	g_child_watch_source_new (a_pid: INTEGER): POINTER 
               -- g_child_watch_source_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_child_watch_source_new"
               }"
               end

	g_get_current_time (a_result: POINTER) 
               -- g_get_current_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_current_time"
               }"
               end

	g_get_monotonic_time: like long 
               -- g_get_monotonic_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_monotonic_time"
               }"
               end

	g_get_real_time: like long 
               -- g_get_real_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_real_time"
               }"
               end

	g_idle_add (a_function: POINTER; a_data: POINTER): NATURAL 
               -- g_idle_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_idle_add"
               }"
               end

	g_idle_add_full (a_priority: INTEGER; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL 
               -- g_idle_add_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_idle_add_full"
               }"
               end

       -- Variable g_idle_funcs (at line 608 in file /usr/include/glib-2.0/glib/gmain.h does not have a wrapper type
       address_of_g_idle_funcs: POINTER
               -- Address of g_idle_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_idle_funcs"
               }"
               end

	g_idle_remove_by_data (a_data: POINTER): INTEGER 
               -- g_idle_remove_by_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_idle_remove_by_data"
               }"
               end

	g_idle_source_new: POINTER 
               -- g_idle_source_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_idle_source_new"
               }"
               end

	g_main_context_acquire (a_context: POINTER): INTEGER 
               -- g_main_context_acquire
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_acquire"
               }"
               end

	g_main_context_add_poll (a_context: POINTER; a_fd: POINTER; a_priority: INTEGER) 
               -- g_main_context_add_poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_add_poll"
               }"
               end

	g_main_context_check (a_context: POINTER; a_max_priority: INTEGER; a_fds: POINTER; a_n_fds: INTEGER): INTEGER 
               -- g_main_context_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_check"
               }"
               end

	g_main_context_default: POINTER 
               -- g_main_context_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_default"
               }"
               end

	g_main_context_dispatch (a_context: POINTER) 
               -- g_main_context_dispatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_dispatch"
               }"
               end

	g_main_context_find_source_by_funcs_user_data (a_context: POINTER; a_funcs: POINTER; an_user_data: POINTER): POINTER 
               -- g_main_context_find_source_by_funcs_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_find_source_by_funcs_user_data"
               }"
               end

	g_main_context_find_source_by_id (a_context: POINTER; a_source_id: NATURAL): POINTER 
               -- g_main_context_find_source_by_id
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_find_source_by_id"
               }"
               end

	g_main_context_find_source_by_user_data (a_context: POINTER; an_user_data: POINTER): POINTER 
               -- g_main_context_find_source_by_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_find_source_by_user_data"
               }"
               end

	g_main_context_get_poll_func (a_context: POINTER): POINTER 
               -- g_main_context_get_poll_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_get_poll_func"
               }"
               end

	g_main_context_get_thread_default: POINTER 
               -- g_main_context_get_thread_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_get_thread_default"
               }"
               end

	g_main_context_invoke (a_context: POINTER; a_function: POINTER; a_data: POINTER) 
               -- g_main_context_invoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_invoke"
               }"
               end

	g_main_context_invoke_full (a_context: POINTER; a_priority: INTEGER; a_function: POINTER; a_data: POINTER; a_notify: POINTER) 
               -- g_main_context_invoke_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_invoke_full"
               }"
               end

	g_main_context_is_owner (a_context: POINTER): INTEGER 
               -- g_main_context_is_owner
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_is_owner"
               }"
               end

	g_main_context_iteration (a_context: POINTER; a_may_block: INTEGER): INTEGER 
               -- g_main_context_iteration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_iteration"
               }"
               end

	g_main_context_new: POINTER 
               -- g_main_context_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_new"
               }"
               end

	g_main_context_pending (a_context: POINTER): INTEGER 
               -- g_main_context_pending
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_pending"
               }"
               end

	g_main_context_pop_thread_default (a_context: POINTER) 
               -- g_main_context_pop_thread_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_pop_thread_default"
               }"
               end

	g_main_context_prepare (a_context: POINTER; a_priority: POINTER): INTEGER 
               -- g_main_context_prepare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_prepare"
               }"
               end

	g_main_context_push_thread_default (a_context: POINTER) 
               -- g_main_context_push_thread_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_push_thread_default"
               }"
               end

	g_main_context_query (a_context: POINTER; a_max_priority: INTEGER; a_timeout: POINTER; a_fds: POINTER; a_n_fds: INTEGER): INTEGER 
               -- g_main_context_query
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_query"
               }"
               end

	g_main_context_ref (a_context: POINTER): POINTER 
               -- g_main_context_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_ref"
               }"
               end

	g_main_context_ref_thread_default: POINTER 
               -- g_main_context_ref_thread_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_ref_thread_default"
               }"
               end

	g_main_context_release (a_context: POINTER) 
               -- g_main_context_release
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_release"
               }"
               end

	g_main_context_remove_poll (a_context: POINTER; a_fd: POINTER) 
               -- g_main_context_remove_poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_remove_poll"
               }"
               end

	g_main_context_set_poll_func (a_context: POINTER; a_func: POINTER) 
               -- g_main_context_set_poll_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_set_poll_func"
               }"
               end

	g_main_context_unref (a_context: POINTER) 
               -- g_main_context_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_unref"
               }"
               end

	g_main_context_wait (a_context: POINTER; a_cond: POINTER; a_mutex: POINTER): INTEGER 
               -- g_main_context_wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_wait"
               }"
               end

	g_main_context_wakeup (a_context: POINTER) 
               -- g_main_context_wakeup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_context_wakeup"
               }"
               end

	g_main_current_source: POINTER 
               -- g_main_current_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_current_source"
               }"
               end

	g_main_depth: INTEGER 
               -- g_main_depth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_depth"
               }"
               end

	g_main_loop_get_context (a_loop_external: POINTER): POINTER 
               -- g_main_loop_get_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_get_context"
               }"
               end

	g_main_loop_is_running (a_loop_external: POINTER): INTEGER 
               -- g_main_loop_is_running
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_is_running"
               }"
               end

	g_main_loop_new (a_context: POINTER; an_is_running: INTEGER): POINTER 
               -- g_main_loop_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_new"
               }"
               end

	g_main_loop_quit (a_loop_external: POINTER) 
               -- g_main_loop_quit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_quit"
               }"
               end

	g_main_loop_ref (a_loop_external: POINTER): POINTER 
               -- g_main_loop_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_ref"
               }"
               end

	g_main_loop_run (a_loop_external: POINTER) 
               -- g_main_loop_run
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_run"
               }"
               end

	g_main_loop_unref (a_loop_external: POINTER) 
               -- g_main_loop_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_main_loop_unref"
               }"
               end

	g_source_add_child_source (a_source: POINTER; a_child_source: POINTER) 
               -- g_source_add_child_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_add_child_source"
               }"
               end

	g_source_add_poll (a_source: POINTER; a_fd: POINTER) 
               -- g_source_add_poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_add_poll"
               }"
               end

	g_source_add_unix_fd (a_source: POINTER; a_fd: INTEGER; an_events: INTEGER): POINTER 
               -- g_source_add_unix_fd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_add_unix_fd"
               }"
               end

	g_source_attach (a_source: POINTER; a_context: POINTER): NATURAL 
               -- g_source_attach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_attach"
               }"
               end

	g_source_destroy (a_source: POINTER) 
               -- g_source_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_destroy"
               }"
               end

	g_source_get_can_recurse (a_source: POINTER): INTEGER 
               -- g_source_get_can_recurse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_can_recurse"
               }"
               end

	g_source_get_context (a_source: POINTER): POINTER 
               -- g_source_get_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_context"
               }"
               end

	g_source_get_current_time (a_source: POINTER; a_timeval: POINTER) 
               -- g_source_get_current_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_current_time"
               }"
               end

	g_source_get_id (a_source: POINTER): NATURAL 
               -- g_source_get_id
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_id"
               }"
               end

	g_source_get_name (a_source: POINTER): POINTER 
               -- g_source_get_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_name"
               }"
               end

	g_source_get_priority (a_source: POINTER): INTEGER 
               -- g_source_get_priority
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_priority"
               }"
               end

	g_source_get_ready_time (a_source: POINTER): like long 
               -- g_source_get_ready_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_ready_time"
               }"
               end

	g_source_get_time (a_source: POINTER): like long 
               -- g_source_get_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_get_time"
               }"
               end

	g_source_is_destroyed (a_source: POINTER): INTEGER 
               -- g_source_is_destroyed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_is_destroyed"
               }"
               end

	g_source_modify_unix_fd (a_source: POINTER; a_tag: POINTER; a_new_events: INTEGER) 
               -- g_source_modify_unix_fd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_modify_unix_fd"
               }"
               end

	g_source_new (a_source_funcs: POINTER; a_struct_size: NATURAL): POINTER 
               -- g_source_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_new"
               }"
               end

	g_source_query_unix_fd (a_source: POINTER; a_tag: POINTER): INTEGER 
               -- g_source_query_unix_fd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_query_unix_fd"
               }"
               end

	g_source_ref (a_source: POINTER): POINTER 
               -- g_source_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_ref"
               }"
               end

	g_source_remove (a_tag: NATURAL): INTEGER 
               -- g_source_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove"
               }"
               end

	g_source_remove_by_funcs_user_data (a_funcs: POINTER; an_user_data: POINTER): INTEGER 
               -- g_source_remove_by_funcs_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove_by_funcs_user_data"
               }"
               end

	g_source_remove_by_user_data (an_user_data: POINTER): INTEGER 
               -- g_source_remove_by_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove_by_user_data"
               }"
               end

	g_source_remove_child_source (a_source: POINTER; a_child_source: POINTER) 
               -- g_source_remove_child_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove_child_source"
               }"
               end

	g_source_remove_poll (a_source: POINTER; a_fd: POINTER) 
               -- g_source_remove_poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove_poll"
               }"
               end

	g_source_remove_unix_fd (a_source: POINTER; a_tag: POINTER) 
               -- g_source_remove_unix_fd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_remove_unix_fd"
               }"
               end

	g_source_set_callback (a_source: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) 
               -- g_source_set_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_callback"
               }"
               end

	g_source_set_callback_indirect (a_source: POINTER; a_callback_data: POINTER; a_callback_funcs: POINTER) 
               -- g_source_set_callback_indirect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_callback_indirect"
               }"
               end

	g_source_set_can_recurse (a_source: POINTER; a_can_recurse: INTEGER) 
               -- g_source_set_can_recurse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_can_recurse"
               }"
               end

	g_source_set_funcs (a_source: POINTER; a_funcs: POINTER) 
               -- g_source_set_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_funcs"
               }"
               end

	g_source_set_name (a_source: POINTER; a_name: POINTER) 
               -- g_source_set_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_name"
               }"
               end

	g_source_set_name_by_id (a_tag: NATURAL; a_name: POINTER) 
               -- g_source_set_name_by_id
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_name_by_id"
               }"
               end

	g_source_set_priority (a_source: POINTER; a_priority: INTEGER) 
               -- g_source_set_priority
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_priority"
               }"
               end

	g_source_set_ready_time (a_source: POINTER; a_ready_time: like long) 
               -- g_source_set_ready_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_set_ready_time"
               }"
               end

	g_source_unref (a_source: POINTER) 
               -- g_source_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_source_unref"
               }"
               end

	g_timeout_add (an_interval: NATURAL; a_function: POINTER; a_data: POINTER): NATURAL 
               -- g_timeout_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_add"
               }"
               end

	g_timeout_add_full (a_priority: INTEGER; an_interval: NATURAL; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL 
               -- g_timeout_add_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_add_full"
               }"
               end

	g_timeout_add_seconds (an_interval: NATURAL; a_function: POINTER; a_data: POINTER): NATURAL 
               -- g_timeout_add_seconds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_add_seconds"
               }"
               end

	g_timeout_add_seconds_full (a_priority: INTEGER; an_interval: NATURAL; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL 
               -- g_timeout_add_seconds_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_add_seconds_full"
               }"
               end

       -- Variable g_timeout_funcs (at line 606 in file /usr/include/glib-2.0/glib/gmain.h does not have a wrapper type
       address_of_g_timeout_funcs: POINTER
               -- Address of g_timeout_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_timeout_funcs"
               }"
               end

	g_timeout_source_new (an_interval: NATURAL): POINTER 
               -- g_timeout_source_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_source_new"
               }"
               end

	g_timeout_source_new_seconds (an_interval: NATURAL): POINTER 
               -- g_timeout_source_new_seconds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timeout_source_new_seconds"
               }"
               end

       -- Variable g_unix_fd_source_funcs (at line 611 in file /usr/include/glib-2.0/glib/gmain.h does not have a wrapper type
       address_of_g_unix_fd_source_funcs: POINTER
               -- Address of g_unix_fd_source_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_unix_fd_source_funcs"
               }"
               end

       -- Variable g_unix_signal_funcs (at line 610 in file /usr/include/glib-2.0/glib/gmain.h does not have a wrapper type
       address_of_g_unix_signal_funcs: POINTER
               -- Address of g_unix_signal_funcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_unix_signal_funcs"
               }"
               end


end -- class GMAIN_EXTERNALS
