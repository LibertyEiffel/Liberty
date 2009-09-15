-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREAD_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_thread_init (a_vtable: POINTER) is
 		-- g_thread_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_init"
		}"
		end

	g_static_rec_mutex_unlock (a_mutex: POINTER) is
 		-- g_static_rec_mutex_unlock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_unlock"
		}"
		end

	g_static_rw_lock_writer_lock (a_lock: POINTER) is
 		-- g_static_rw_lock_writer_lock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_writer_lock"
		}"
		end

	g_static_rec_mutex_trylock (a_mutex: POINTER): INTEGER_32 is
 		-- g_static_rec_mutex_trylock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_trylock"
		}"
		end

	g_once_init_enter_impl (a_value_location: POINTER): INTEGER_32 is
 		-- g_once_init_enter_impl
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_once_init_enter_impl"
		}"
		end

	g_thread_error_quark: NATURAL_32 is
 		-- g_thread_error_quark
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_error_quark"
		}"
		end

	g_thread_self: POINTER is
 		-- g_thread_self
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_self"
		}"
		end

	g_static_rec_mutex_init (a_mutex: POINTER) is
 		-- g_static_rec_mutex_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_init"
		}"
		end

	g_thread_set_priority (a_thread: POINTER; a_priority: INTEGER_32) is
 		-- g_thread_set_priority
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_set_priority"
		}"
		end

	g_static_rw_lock_reader_lock (a_lock: POINTER) is
 		-- g_static_rw_lock_reader_lock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_reader_lock"
		}"
		end

	g_static_rec_mutex_unlock_full (a_mutex: POINTER): NATURAL_32 is
 		-- g_static_rec_mutex_unlock_full
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_unlock_full"
		}"
		end

	g_static_mutex_init (a_mutex: POINTER) is
 		-- g_static_mutex_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_mutex_init"
		}"
		end

	g_static_private_set (a_private_key: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- g_static_private_set
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_private_set"
		}"
		end

	g_static_rec_mutex_lock (a_mutex: POINTER) is
 		-- g_static_rec_mutex_lock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_lock"
		}"
		end

	g_static_rec_mutex_free (a_mutex: POINTER) is
 		-- g_static_rec_mutex_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_free"
		}"
		end

	g_thread_exit (a_retval: POINTER) is
 		-- g_thread_exit
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_exit"
		}"
		end

	g_static_rw_lock_writer_unlock (a_lock: POINTER) is
 		-- g_static_rw_lock_writer_unlock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_writer_unlock"
		}"
		end

	g_static_mutex_get_mutex_impl (a_mutex: POINTER): POINTER is
 		-- g_static_mutex_get_mutex_impl
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_mutex_get_mutex_impl"
		}"
		end

	g_thread_join (a_thread: POINTER): POINTER is
 		-- g_thread_join
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_join"
		}"
		end

	g_once_init_leave (a_value_location: POINTER; an_initialization_value: NATURAL_32) is
 		-- g_once_init_leave
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_once_init_leave"
		}"
		end

	g_once_init_enter (a_value_location: POINTER): INTEGER_32 is
 		-- g_once_init_enter
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_once_init_enter"
		}"
		end

	g_thread_create_full (a_func: POINTER; a_data: POINTER; a_stack_size: NATURAL_32; a_joinable: INTEGER_32; a_bound: INTEGER_32; a_priority: INTEGER_32; an_error: POINTER): POINTER is
 		-- g_thread_create_full
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_create_full"
		}"
		end

	g_thread_get_initialized: INTEGER_32 is
 		-- g_thread_get_initialized
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_get_initialized"
		}"
		end

	g_static_rw_lock_init (a_lock: POINTER) is
 		-- g_static_rw_lock_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_init"
		}"
		end

	g_static_rw_lock_free (a_lock: POINTER) is
 		-- g_static_rw_lock_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_free"
		}"
		end

	g_once_impl (an_once_external: POINTER; a_func: POINTER; an_arg: POINTER): POINTER is
 		-- g_once_impl
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_once_impl"
		}"
		end

	g_thread_foreach (a_thread_func: POINTER; an_user_data: POINTER) is
 		-- g_thread_foreach
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_foreach"
		}"
		end

	g_static_private_init (a_private_key: POINTER) is
 		-- g_static_private_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_private_init"
		}"
		end

	g_static_private_free (a_private_key: POINTER) is
 		-- g_static_private_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_private_free"
		}"
		end

	glib_dummy_decl is
 		-- glib_dummy_decl
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glib_dummy_decl"
		}"
		end

	g_static_rw_lock_reader_trylock (a_lock: POINTER): INTEGER_32 is
 		-- g_static_rw_lock_reader_trylock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_reader_trylock"
		}"
		end

	g_static_rec_mutex_lock_full (a_mutex: POINTER; a_depth: NATURAL_32) is
 		-- g_static_rec_mutex_lock_full
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rec_mutex_lock_full"
		}"
		end

	g_static_mutex_free (a_mutex: POINTER) is
 		-- g_static_mutex_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_mutex_free"
		}"
		end

	g_thread_init_with_errorcheck_mutexes (a_vtable: POINTER) is
 		-- g_thread_init_with_errorcheck_mutexes
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_init_with_errorcheck_mutexes"
		}"
		end

	g_static_rw_lock_reader_unlock (a_lock: POINTER) is
 		-- g_static_rw_lock_reader_unlock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_reader_unlock"
		}"
		end

	g_static_private_get (a_private_key: POINTER): POINTER is
 		-- g_static_private_get
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_private_get"
		}"
		end

	g_static_rw_lock_writer_trylock (a_lock: POINTER): INTEGER_32 is
 		-- g_static_rw_lock_writer_trylock
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_static_rw_lock_writer_trylock"
		}"
		end

end
