-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREAD_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_thread_init (a_vtable: POINTER) is
 		-- g_thread_init (node at line 48)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_init"
		}"
		end

	g_static_rec_mutex_unlock (a_mutex: POINTER) is
 		-- g_static_rec_mutex_unlock (node at line 78)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_unlock"
		}"
		end

	g_static_rw_lock_writer_lock (a_lock: POINTER) is
 		-- g_static_rw_lock_writer_lock (node at line 191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_writer_lock"
		}"
		end

	g_static_rec_mutex_trylock (a_mutex: POINTER): INTEGER_32 is
 		-- g_static_rec_mutex_trylock (node at line 608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_trylock"
		}"
		end

	g_once_init_enter_impl (a_value_location: POINTER): INTEGER_32 is
 		-- g_once_init_enter_impl (node at line 743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_once_init_enter_impl"
		}"
		end

	g_thread_error_quark: NATURAL_32 is
 		-- g_thread_error_quark (node at line 808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_error_quark()"
		}"
		end

	g_thread_self: POINTER is
 		-- g_thread_self (node at line 883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_self()"
		}"
		end

	g_static_rec_mutex_init (a_mutex: POINTER) is
 		-- g_static_rec_mutex_init (node at line 1163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_init"
		}"
		end

	g_thread_set_priority (a_thread: POINTER; a_priority: INTEGER) is
 		-- g_thread_set_priority (node at line 1300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_set_priority"
		}"
		end

	g_static_rw_lock_reader_lock (a_lock: POINTER) is
 		-- g_static_rw_lock_reader_lock (node at line 1324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_reader_lock"
		}"
		end

	g_static_rec_mutex_unlock_full (a_mutex: POINTER): NATURAL_32 is
 		-- g_static_rec_mutex_unlock_full (node at line 1607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_unlock_full"
		}"
		end

	g_static_mutex_init (a_mutex: POINTER) is
 		-- g_static_mutex_init (node at line 1814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_mutex_init"
		}"
		end

	g_static_private_set (a_private_key: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- g_static_private_set (node at line 1833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_private_set"
		}"
		end

	g_static_rec_mutex_lock (a_mutex: POINTER) is
 		-- g_static_rec_mutex_lock (node at line 1879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_lock"
		}"
		end

	g_static_rec_mutex_free (a_mutex: POINTER) is
 		-- g_static_rec_mutex_free (node at line 2103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_free"
		}"
		end

	g_thread_exit (a_retval: POINTER) is
 		-- g_thread_exit (node at line 2170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_exit"
		}"
		end

	g_static_rw_lock_writer_unlock (a_lock: POINTER) is
 		-- g_static_rw_lock_writer_unlock (node at line 2247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_writer_unlock"
		}"
		end

	g_static_mutex_get_mutex_impl (a_mutex: POINTER): POINTER is
 		-- g_static_mutex_get_mutex_impl (node at line 2836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_mutex_get_mutex_impl"
		}"
		end

	g_thread_join (a_thread: POINTER): POINTER is
 		-- g_thread_join (node at line 3293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_join"
		}"
		end

	g_once_init_leave (a_value_location: POINTER; an_initialization_value: NATURAL_32) is
 		-- g_once_init_leave (node at line 3552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_once_init_leave"
		}"
		end

	g_once_init_enter (a_value_location: POINTER): INTEGER_32 is
 		-- g_once_init_enter (node at line 3908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_once_init_enter"
		}"
		end

	g_thread_create_full (a_func: POINTER; a_data: POINTER; a_stack_size: NATURAL_32; a_joinable: INTEGER_32; a_bound: INTEGER_32; a_priority: INTEGER; an_error: POINTER): POINTER is
 		-- g_thread_create_full (node at line 4391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_create_full"
		}"
		end

	g_thread_get_initialized: INTEGER_32 is
 		-- g_thread_get_initialized (node at line 4417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_get_initialized()"
		}"
		end

	g_static_rw_lock_init (a_lock: POINTER) is
 		-- g_static_rw_lock_init (node at line 4463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_init"
		}"
		end

	g_static_rw_lock_free (a_lock: POINTER) is
 		-- g_static_rw_lock_free (node at line 4529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_free"
		}"
		end

	g_once_impl (an_once_external: POINTER; a_func: POINTER; an_arg: POINTER): POINTER is
 		-- g_once_impl (node at line 4670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_once_impl"
		}"
		end

	g_thread_foreach (a_thread_func: POINTER; an_user_data: POINTER) is
 		-- g_thread_foreach (node at line 5025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_foreach"
		}"
		end

	g_static_private_init (a_private_key: POINTER) is
 		-- g_static_private_init (node at line 5125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_private_init"
		}"
		end

	g_static_private_free (a_private_key: POINTER) is
 		-- g_static_private_free (node at line 5164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_private_free"
		}"
		end

	glib_dummy_decl is
 		-- glib_dummy_decl (node at line 5272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_dummy_decl()"
		}"
		end

	g_static_rw_lock_reader_trylock (a_lock: POINTER): INTEGER_32 is
 		-- g_static_rw_lock_reader_trylock (node at line 5691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_reader_trylock"
		}"
		end

	g_static_rec_mutex_lock_full (a_mutex: POINTER; a_depth: NATURAL_32) is
 		-- g_static_rec_mutex_lock_full (node at line 5709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rec_mutex_lock_full"
		}"
		end

	g_static_mutex_free (a_mutex: POINTER) is
 		-- g_static_mutex_free (node at line 6125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_mutex_free"
		}"
		end

	g_thread_init_with_errorcheck_mutexes (a_vtable: POINTER) is
 		-- g_thread_init_with_errorcheck_mutexes (node at line 6191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_init_with_errorcheck_mutexes"
		}"
		end

	g_static_rw_lock_reader_unlock (a_lock: POINTER) is
 		-- g_static_rw_lock_reader_unlock (node at line 6661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_reader_unlock"
		}"
		end

	g_static_private_get (a_private_key: POINTER): POINTER is
 		-- g_static_private_get (node at line 6823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_private_get"
		}"
		end

	g_static_rw_lock_writer_trylock (a_lock: POINTER): INTEGER_32 is
 		-- g_static_rw_lock_writer_trylock (node at line 6846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_static_rw_lock_writer_trylock"
		}"
		end


end -- class GTHREAD_EXTERNALS
