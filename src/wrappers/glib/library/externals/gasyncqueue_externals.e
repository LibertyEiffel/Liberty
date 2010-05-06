-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GASYNCQUEUE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_async_queue_unref (a_queue: POINTER) is
 		-- g_async_queue_unref (node at line 377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_unref"
		}"
		end

	g_async_queue_lock (a_queue: POINTER) is
 		-- g_async_queue_lock (node at line 471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_lock"
		}"
		end

	-- `hidden' function _g_async_queue_get_mutex skipped.
	g_async_queue_unref_and_unlock (a_queue: POINTER) is
 		-- g_async_queue_unref_and_unlock (node at line 703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_unref_and_unlock"
		}"
		end

	g_async_queue_timed_pop (a_queue: POINTER; an_end_time: POINTER): POINTER is
 		-- g_async_queue_timed_pop (node at line 1319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_timed_pop"
		}"
		end

	g_async_queue_new: POINTER is
 		-- g_async_queue_new (node at line 1323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_new()"
		}"
		end

	g_async_queue_length (a_queue: POINTER): INTEGER_32 is
 		-- g_async_queue_length (node at line 1396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_length"
		}"
		end

	g_async_queue_ref (a_queue: POINTER): POINTER is
 		-- g_async_queue_ref (node at line 2024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_ref"
		}"
		end

	g_async_queue_new_full (an_item_free_func: POINTER): POINTER is
 		-- g_async_queue_new_full (node at line 2665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_new_full"
		}"
		end

	g_async_queue_try_pop (a_queue: POINTER): POINTER is
 		-- g_async_queue_try_pop (node at line 2925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_try_pop"
		}"
		end

	g_async_queue_push_sorted (a_queue: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_async_queue_push_sorted (node at line 2985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_push_sorted"
		}"
		end

	g_async_queue_push_sorted_unlocked (a_queue: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_async_queue_push_sorted_unlocked (node at line 3120)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_push_sorted_unlocked"
		}"
		end

	g_async_queue_ref_unlocked (a_queue: POINTER) is
 		-- g_async_queue_ref_unlocked (node at line 3251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_ref_unlocked"
		}"
		end

	g_async_queue_push_unlocked (a_queue: POINTER; a_data: POINTER) is
 		-- g_async_queue_push_unlocked (node at line 3775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_push_unlocked"
		}"
		end

	g_async_queue_sort (a_queue: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_async_queue_sort (node at line 4376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_sort"
		}"
		end

	g_async_queue_pop_unlocked (a_queue: POINTER): POINTER is
 		-- g_async_queue_pop_unlocked (node at line 4562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_pop_unlocked"
		}"
		end

	g_async_queue_push (a_queue: POINTER; a_data: POINTER) is
 		-- g_async_queue_push (node at line 5209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_push"
		}"
		end

	g_async_queue_pop (a_queue: POINTER): POINTER is
 		-- g_async_queue_pop (node at line 5371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_pop"
		}"
		end

	g_async_queue_sort_unlocked (a_queue: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_async_queue_sort_unlocked (node at line 5478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_sort_unlocked"
		}"
		end

	g_async_queue_unlock (a_queue: POINTER) is
 		-- g_async_queue_unlock (node at line 5723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_unlock"
		}"
		end

	g_async_queue_length_unlocked (a_queue: POINTER): INTEGER_32 is
 		-- g_async_queue_length_unlocked (node at line 6101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_length_unlocked"
		}"
		end

	g_async_queue_timed_pop_unlocked (a_queue: POINTER; an_end_time: POINTER): POINTER is
 		-- g_async_queue_timed_pop_unlocked (node at line 6262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_timed_pop_unlocked"
		}"
		end

	g_async_queue_try_pop_unlocked (a_queue: POINTER): POINTER is
 		-- g_async_queue_try_pop_unlocked (node at line 6294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_async_queue_try_pop_unlocked"
		}"
		end


end -- class GASYNCQUEUE_EXTERNALS
