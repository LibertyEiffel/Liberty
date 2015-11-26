-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTHREAD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_cond_broadcast (a_cond: POINTER) 
               -- g_cond_broadcast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_broadcast"
               }"
               end

	g_cond_clear (a_cond: POINTER) 
               -- g_cond_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_clear"
               }"
               end

	g_cond_init (a_cond: POINTER) 
               -- g_cond_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_init"
               }"
               end

	g_cond_signal (a_cond: POINTER) 
               -- g_cond_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_signal"
               }"
               end

	g_cond_wait (a_cond: POINTER; a_mutex: POINTER) 
               -- g_cond_wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_wait"
               }"
               end

	g_cond_wait_until (a_cond: POINTER; a_mutex: POINTER; an_end_time: like long): INTEGER 
               -- g_cond_wait_until
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cond_wait_until"
               }"
               end

	g_get_num_processors: NATURAL 
               -- g_get_num_processors
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_num_processors"
               }"
               end

	g_mutex_clear (a_mutex: POINTER) 
               -- g_mutex_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_clear"
               }"
               end

	g_mutex_init (a_mutex: POINTER) 
               -- g_mutex_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_init"
               }"
               end

	g_mutex_lock (a_mutex: POINTER) 
               -- g_mutex_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_lock"
               }"
               end

	g_mutex_locker_free (a_locker: POINTER) 
               -- g_mutex_locker_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_locker_free"
               }"
               end

	g_mutex_locker_new (a_mutex: POINTER): POINTER 
               -- g_mutex_locker_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_locker_new"
               }"
               end

	g_mutex_trylock (a_mutex: POINTER): INTEGER 
               -- g_mutex_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_trylock"
               }"
               end

	g_mutex_unlock (a_mutex: POINTER) 
               -- g_mutex_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mutex_unlock"
               }"
               end

	g_once_impl (an_once_external: POINTER; a_func: POINTER; an_arg: POINTER): POINTER 
               -- g_once_impl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_once_impl"
               }"
               end

	g_once_init_enter (a_location: POINTER): INTEGER 
               -- g_once_init_enter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_once_init_enter"
               }"
               end

	g_once_init_leave (a_location: POINTER; a_result: like long_unsigned) 
               -- g_once_init_leave
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_once_init_leave"
               }"
               end

	g_private_get (a_key: POINTER): POINTER 
               -- g_private_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_private_get"
               }"
               end

	g_private_replace (a_key: POINTER; a_value: POINTER) 
               -- g_private_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_private_replace"
               }"
               end

	g_private_set (a_key: POINTER; a_value: POINTER) 
               -- g_private_set
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_private_set"
               }"
               end

	g_rec_mutex_clear (a_rec_mutex: POINTER) 
               -- g_rec_mutex_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rec_mutex_clear"
               }"
               end

	g_rec_mutex_init (a_rec_mutex: POINTER) 
               -- g_rec_mutex_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rec_mutex_init"
               }"
               end

	g_rec_mutex_lock (a_rec_mutex: POINTER) 
               -- g_rec_mutex_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rec_mutex_lock"
               }"
               end

	g_rec_mutex_trylock (a_rec_mutex: POINTER): INTEGER 
               -- g_rec_mutex_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rec_mutex_trylock"
               }"
               end

	g_rec_mutex_unlock (a_rec_mutex: POINTER) 
               -- g_rec_mutex_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rec_mutex_unlock"
               }"
               end

	g_rw_lock_clear (a_rw_lock: POINTER) 
               -- g_rw_lock_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_clear"
               }"
               end

	g_rw_lock_init (a_rw_lock: POINTER) 
               -- g_rw_lock_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_init"
               }"
               end

	g_rw_lock_reader_lock (a_rw_lock: POINTER) 
               -- g_rw_lock_reader_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_reader_lock"
               }"
               end

	g_rw_lock_reader_trylock (a_rw_lock: POINTER): INTEGER 
               -- g_rw_lock_reader_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_reader_trylock"
               }"
               end

	g_rw_lock_reader_unlock (a_rw_lock: POINTER) 
               -- g_rw_lock_reader_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_reader_unlock"
               }"
               end

	g_rw_lock_writer_lock (a_rw_lock: POINTER) 
               -- g_rw_lock_writer_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_writer_lock"
               }"
               end

	g_rw_lock_writer_trylock (a_rw_lock: POINTER): INTEGER 
               -- g_rw_lock_writer_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_writer_trylock"
               }"
               end

	g_rw_lock_writer_unlock (a_rw_lock: POINTER) 
               -- g_rw_lock_writer_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_rw_lock_writer_unlock"
               }"
               end

	g_thread_error_quark: NATURAL 
               -- g_thread_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_error_quark"
               }"
               end

	g_thread_exit (a_retval: POINTER) 
               -- g_thread_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_exit"
               }"
               end

	g_thread_join (a_thread: POINTER): POINTER 
               -- g_thread_join
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_join"
               }"
               end

	g_thread_new (a_name: POINTER; a_func: POINTER; a_data: POINTER): POINTER 
               -- g_thread_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_new"
               }"
               end

	g_thread_ref (a_thread: POINTER): POINTER 
               -- g_thread_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_ref"
               }"
               end

	g_thread_self: POINTER 
               -- g_thread_self
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_self"
               }"
               end

	g_thread_try_new (a_name: POINTER; a_func: POINTER; a_data: POINTER; an_error: POINTER): POINTER 
               -- g_thread_try_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_try_new"
               }"
               end

	g_thread_unref (a_thread: POINTER) 
               -- g_thread_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_unref"
               }"
               end

	g_thread_yield 
               -- g_thread_yield
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_thread_yield"
               }"
               end


end -- class GTHREAD_EXTERNALS
