-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GCOMPLETION_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_completion_free (a_cmp: POINTER) is
 		-- g_completion_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_free"
		}"
		end

	g_completion_set_compare (a_cmp: POINTER; a_strncmp_func: POINTER) is
 		-- g_completion_set_compare
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_set_compare"
		}"
		end

	g_completion_complete_utf8 (a_cmp: POINTER; a_prefix: POINTER; a_new_prefix: POINTER): POINTER is
 		-- g_completion_complete_utf8
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_complete_utf8"
		}"
		end

	g_completion_new (a_func: POINTER): POINTER is
 		-- g_completion_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_new"
		}"
		end

	g_completion_add_items (a_cmp: POINTER; an_items: POINTER) is
 		-- g_completion_add_items
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_add_items"
		}"
		end

	g_completion_complete (a_cmp: POINTER; a_prefix: POINTER; a_new_prefix: POINTER): POINTER is
 		-- g_completion_complete
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_complete"
		}"
		end

	g_completion_remove_items (a_cmp: POINTER; an_items: POINTER) is
 		-- g_completion_remove_items
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_remove_items"
		}"
		end

	g_completion_clear_items (a_cmp: POINTER) is
 		-- g_completion_clear_items
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_completion_clear_items"
		}"
		end

end
