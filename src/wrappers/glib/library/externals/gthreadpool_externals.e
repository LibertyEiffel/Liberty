-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREADPOOL_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_thread_pool_get_num_threads (a_pool: POINTER): NATURAL_32 is
 		-- g_thread_pool_get_num_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_get_num_threads"
		}"
		end

	g_thread_pool_get_max_unused_threads: INTEGER_32 is
 		-- g_thread_pool_get_max_unused_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_get_max_unused_threads"
		}"
		end

	g_thread_pool_set_sort_function (a_pool: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_thread_pool_set_sort_function
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_set_sort_function"
		}"
		end

	g_thread_pool_new (a_func: POINTER; an_user_data: POINTER; a_max_threads: INTEGER_32; an_exclusive: INTEGER_32; an_error: POINTER): POINTER is
 		-- g_thread_pool_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_new"
		}"
		end

	g_thread_pool_free (a_pool: POINTER; an_immediate: INTEGER_32; a_wait_: INTEGER_32) is
 		-- g_thread_pool_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_free"
		}"
		end

	g_thread_pool_set_max_unused_threads (a_max_threads: INTEGER_32) is
 		-- g_thread_pool_set_max_unused_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_set_max_unused_threads"
		}"
		end

	g_thread_pool_set_max_idle_time (an_interval: NATURAL_32) is
 		-- g_thread_pool_set_max_idle_time
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_set_max_idle_time"
		}"
		end

	g_thread_pool_unprocessed (a_pool: POINTER): NATURAL_32 is
 		-- g_thread_pool_unprocessed
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_unprocessed"
		}"
		end

	g_thread_pool_stop_unused_threads is
 		-- g_thread_pool_stop_unused_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_stop_unused_threads"
		}"
		end

	g_thread_pool_set_max_threads (a_pool: POINTER; a_max_threads: INTEGER_32; an_error: POINTER) is
 		-- g_thread_pool_set_max_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_set_max_threads"
		}"
		end

	g_thread_pool_get_num_unused_threads: NATURAL_32 is
 		-- g_thread_pool_get_num_unused_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_get_num_unused_threads"
		}"
		end

	g_thread_pool_push (a_pool: POINTER; a_data: POINTER; an_error: POINTER) is
 		-- g_thread_pool_push
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_push"
		}"
		end

	g_thread_pool_get_max_idle_time: NATURAL_32 is
 		-- g_thread_pool_get_max_idle_time
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_get_max_idle_time"
		}"
		end

	g_thread_pool_get_max_threads (a_pool: POINTER): INTEGER_32 is
 		-- g_thread_pool_get_max_threads
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_thread_pool_get_max_threads"
		}"
		end

end
