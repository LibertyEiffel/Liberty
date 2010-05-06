-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCACHE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_cache_key_foreach (a_cache: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_cache_key_foreach (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_key_foreach"
		}"
		end

	g_cache_destroy (a_cache: POINTER) is
 		-- g_cache_destroy (node at line 795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_destroy"
		}"
		end

	g_cache_insert (a_cache: POINTER; a_key: POINTER): POINTER is
 		-- g_cache_insert (node at line 2079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_insert"
		}"
		end

	g_cache_value_foreach (a_cache: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_cache_value_foreach (node at line 3911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_value_foreach"
		}"
		end

	g_cache_new (a_value_new_func: POINTER; a_value_destroy_func: POINTER; a_key_dup_func: POINTER; a_key_destroy_func: POINTER; a_hash_key_func: POINTER; a_hash_value_func: POINTER; a_key_equal_func: POINTER): POINTER is
 		-- g_cache_new (node at line 4432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_new"
		}"
		end

	g_cache_remove (a_cache: POINTER; a_value: POINTER) is
 		-- g_cache_remove (node at line 6897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cache_remove"
		}"
		end


end -- class GCACHE_EXTERNALS
