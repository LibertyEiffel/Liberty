-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHOOK_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_hook_list_invoke (a_hook_list: POINTER; a_may_recurse: INTEGER_32) is
 		-- g_hook_list_invoke (node at line 521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_invoke"
		}"
		end

	g_hook_unref (a_hook_list: POINTER; a_hook: POINTER) is
 		-- g_hook_unref (node at line 526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_unref"
		}"
		end

	g_hook_alloc (a_hook_list: POINTER): POINTER is
 		-- g_hook_alloc (node at line 547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_alloc"
		}"
		end

	g_hook_free (a_hook_list: POINTER; a_hook: POINTER) is
 		-- g_hook_free (node at line 616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_free"
		}"
		end

	g_hook_list_init (a_hook_list: POINTER; a_hook_size: NATURAL_32) is
 		-- g_hook_list_init (node at line 630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_init"
		}"
		end

	g_hook_insert_sorted (a_hook_list: POINTER; a_hook: POINTER; a_func: POINTER) is
 		-- g_hook_insert_sorted (node at line 1538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_insert_sorted"
		}"
		end

	g_hook_next_valid (a_hook_list: POINTER; a_hook: POINTER; a_may_be_in_call: INTEGER_32): POINTER is
 		-- g_hook_next_valid (node at line 1767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_next_valid"
		}"
		end

	g_hook_destroy (a_hook_list: POINTER; a_hook_id: NATURAL_32): INTEGER_32 is
 		-- g_hook_destroy (node at line 2009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_destroy"
		}"
		end

	g_hook_list_invoke_check (a_hook_list: POINTER; a_may_recurse: INTEGER_32) is
 		-- g_hook_list_invoke_check (node at line 2243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_invoke_check"
		}"
		end

	g_hook_prepend (a_hook_list: POINTER; a_hook: POINTER) is
 		-- g_hook_prepend (node at line 3094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_prepend"
		}"
		end

	g_hook_list_marshal (a_hook_list: POINTER; a_may_recurse: INTEGER_32; a_marshaller: POINTER; a_marshal_data: POINTER) is
 		-- g_hook_list_marshal (node at line 3299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_marshal"
		}"
		end

	g_hook_find_func_data (a_hook_list: POINTER; a_need_valids: INTEGER_32; a_func: POINTER; a_data: POINTER): POINTER is
 		-- g_hook_find_func_data (node at line 3372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_find_func_data"
		}"
		end

	g_hook_find_func (a_hook_list: POINTER; a_need_valids: INTEGER_32; a_func: POINTER): POINTER is
 		-- g_hook_find_func (node at line 3399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_find_func"
		}"
		end

	g_hook_find (a_hook_list: POINTER; a_need_valids: INTEGER_32; a_func: POINTER; a_data: POINTER): POINTER is
 		-- g_hook_find (node at line 3978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_find"
		}"
		end

	g_hook_first_valid (a_hook_list: POINTER; a_may_be_in_call: INTEGER_32): POINTER is
 		-- g_hook_first_valid (node at line 4135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_first_valid"
		}"
		end

	g_hook_list_marshal_check (a_hook_list: POINTER; a_may_recurse: INTEGER_32; a_marshaller: POINTER; a_marshal_data: POINTER) is
 		-- g_hook_list_marshal_check (node at line 4400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_marshal_check"
		}"
		end

	g_hook_compare_ids (a_new_hook: POINTER; a_sibling: POINTER): INTEGER_32 is
 		-- g_hook_compare_ids (node at line 4522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_compare_ids"
		}"
		end

	g_hook_get (a_hook_list: POINTER; a_hook_id: NATURAL_32): POINTER is
 		-- g_hook_get (node at line 4705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_get"
		}"
		end

	g_hook_ref (a_hook_list: POINTER; a_hook: POINTER): POINTER is
 		-- g_hook_ref (node at line 4829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_ref"
		}"
		end

	g_hook_list_clear (a_hook_list: POINTER) is
 		-- g_hook_list_clear (node at line 5389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_list_clear"
		}"
		end

	g_hook_find_data (a_hook_list: POINTER; a_need_valids: INTEGER_32; a_data: POINTER): POINTER is
 		-- g_hook_find_data (node at line 6027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_find_data"
		}"
		end

	g_hook_destroy_link (a_hook_list: POINTER; a_hook: POINTER) is
 		-- g_hook_destroy_link (node at line 6158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_destroy_link"
		}"
		end

	g_hook_insert_before (a_hook_list: POINTER; a_sibling: POINTER; a_hook: POINTER) is
 		-- g_hook_insert_before (node at line 6379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hook_insert_before"
		}"
		end


end -- class GHOOK_EXTERNALS
