-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREADPOOL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_thread_pool_free (a_pool: POINTER; an_immediate: INTEGER; a_wait: INTEGER) is
 		-- g_thread_pool_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_free"
		}"
		end

	g_thread_pool_get_max_idle_time: NATURAL is
 		-- g_thread_pool_get_max_idle_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_get_max_idle_time()"
		}"
		end

	g_thread_pool_get_max_threads (a_pool: POINTER): INTEGER is
 		-- g_thread_pool_get_max_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_get_max_threads"
		}"
		end

	g_thread_pool_get_max_unused_threads: INTEGER is
 		-- g_thread_pool_get_max_unused_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_get_max_unused_threads()"
		}"
		end

	g_thread_pool_get_num_threads (a_pool: POINTER): NATURAL is
 		-- g_thread_pool_get_num_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_get_num_threads"
		}"
		end

	g_thread_pool_get_num_unused_threads: NATURAL is
 		-- g_thread_pool_get_num_unused_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_get_num_unused_threads()"
		}"
		end

	g_thread_pool_new (a_func: POINTER; an_user_data: POINTER; a_max_threads: INTEGER; an_exclusive: INTEGER; an_error: POINTER): POINTER is
 		-- g_thread_pool_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_new"
		}"
		end

	g_thread_pool_push (a_pool: POINTER; a_data: POINTER; an_error: POINTER): INTEGER is
 		-- g_thread_pool_push
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_push"
		}"
		end

	g_thread_pool_set_max_idle_time (an_interval: NATURAL) is
 		-- g_thread_pool_set_max_idle_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_set_max_idle_time"
		}"
		end

	g_thread_pool_set_max_threads (a_pool: POINTER; a_max_threads: INTEGER; an_error: POINTER): INTEGER is
 		-- g_thread_pool_set_max_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_set_max_threads"
		}"
		end

	g_thread_pool_set_max_unused_threads (a_max_threads: INTEGER) is
 		-- g_thread_pool_set_max_unused_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_set_max_unused_threads"
		}"
		end

	g_thread_pool_set_sort_function (a_pool: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_thread_pool_set_sort_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_set_sort_function"
		}"
		end

	g_thread_pool_stop_unused_threads is
 		-- g_thread_pool_stop_unused_threads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_stop_unused_threads()"
		}"
		end

	g_thread_pool_unprocessed (a_pool: POINTER): NATURAL is
 		-- g_thread_pool_unprocessed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_thread_pool_unprocessed"
		}"
		end


end -- class GTHREADPOOL_EXTERNALS
