-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCOMPLETION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_completion_free (a_cmp: POINTER) is
 		-- g_completion_free (node at line 536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_free"
		}"
		end

	g_completion_set_compare (a_cmp: POINTER; a_strncmp_func: POINTER) is
 		-- g_completion_set_compare (node at line 2271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_set_compare"
		}"
		end

	g_completion_complete_utf8 (a_cmp: POINTER; a_prefix: POINTER; a_new_prefix: POINTER): POINTER is
 		-- g_completion_complete_utf8 (node at line 2991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_complete_utf8"
		}"
		end

	g_completion_new (a_func: POINTER): POINTER is
 		-- g_completion_new (node at line 4947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_new"
		}"
		end

	g_completion_add_items (a_cmp: POINTER; an_items: POINTER) is
 		-- g_completion_add_items (node at line 5029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_add_items"
		}"
		end

	g_completion_complete (a_cmp: POINTER; a_prefix: POINTER; a_new_prefix: POINTER): POINTER is
 		-- g_completion_complete (node at line 5080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_complete"
		}"
		end

	g_completion_remove_items (a_cmp: POINTER; an_items: POINTER) is
 		-- g_completion_remove_items (node at line 6150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_remove_items"
		}"
		end

	g_completion_clear_items (a_cmp: POINTER) is
 		-- g_completion_clear_items (node at line 6198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_completion_clear_items"
		}"
		end


end -- class GCOMPLETION_EXTERNALS
