-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GHOOK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_hook_alloc (a_hook_list: POINTER): POINTER 
               -- g_hook_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_alloc"
               }"
               end

	g_hook_compare_ids (a_new_hook: POINTER; a_sibling: POINTER): INTEGER 
               -- g_hook_compare_ids
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_compare_ids"
               }"
               end

	g_hook_destroy (a_hook_list: POINTER; a_hook_id: like long_unsigned): INTEGER 
               -- g_hook_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_destroy"
               }"
               end

	g_hook_destroy_link (a_hook_list: POINTER; a_hook: POINTER) 
               -- g_hook_destroy_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_destroy_link"
               }"
               end

	g_hook_find (a_hook_list: POINTER; a_need_valids: INTEGER; a_func: POINTER; a_data: POINTER): POINTER 
               -- g_hook_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_find"
               }"
               end

	g_hook_find_data (a_hook_list: POINTER; a_need_valids: INTEGER; a_data: POINTER): POINTER 
               -- g_hook_find_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_find_data"
               }"
               end

	g_hook_find_func (a_hook_list: POINTER; a_need_valids: INTEGER; a_func: POINTER): POINTER 
               -- g_hook_find_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_find_func"
               }"
               end

	g_hook_find_func_data (a_hook_list: POINTER; a_need_valids: INTEGER; a_func: POINTER; a_data: POINTER): POINTER 
               -- g_hook_find_func_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_find_func_data"
               }"
               end

	g_hook_first_valid (a_hook_list: POINTER; a_may_be_in_call: INTEGER): POINTER 
               -- g_hook_first_valid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_first_valid"
               }"
               end

	g_hook_free (a_hook_list: POINTER; a_hook: POINTER) 
               -- g_hook_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_free"
               }"
               end

	g_hook_get (a_hook_list: POINTER; a_hook_id: like long_unsigned): POINTER 
               -- g_hook_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_get"
               }"
               end

	g_hook_insert_before (a_hook_list: POINTER; a_sibling: POINTER; a_hook: POINTER) 
               -- g_hook_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_insert_before"
               }"
               end

	g_hook_insert_sorted (a_hook_list: POINTER; a_hook: POINTER; a_func: POINTER) 
               -- g_hook_insert_sorted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_insert_sorted"
               }"
               end

	g_hook_list_clear (a_hook_list: POINTER) 
               -- g_hook_list_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_clear"
               }"
               end

	g_hook_list_init (a_hook_list: POINTER; a_hook_size: NATURAL) 
               -- g_hook_list_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_init"
               }"
               end

	g_hook_list_invoke (a_hook_list: POINTER; a_may_recurse: INTEGER) 
               -- g_hook_list_invoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_invoke"
               }"
               end

	g_hook_list_invoke_check (a_hook_list: POINTER; a_may_recurse: INTEGER) 
               -- g_hook_list_invoke_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_invoke_check"
               }"
               end

	g_hook_list_marshal (a_hook_list: POINTER; a_may_recurse: INTEGER; a_marshaller: POINTER; a_marshal_data: POINTER) 
               -- g_hook_list_marshal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_marshal"
               }"
               end

	g_hook_list_marshal_check (a_hook_list: POINTER; a_may_recurse: INTEGER; a_marshaller: POINTER; a_marshal_data: POINTER) 
               -- g_hook_list_marshal_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_list_marshal_check"
               }"
               end

	g_hook_next_valid (a_hook_list: POINTER; a_hook: POINTER; a_may_be_in_call: INTEGER): POINTER 
               -- g_hook_next_valid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_next_valid"
               }"
               end

	g_hook_prepend (a_hook_list: POINTER; a_hook: POINTER) 
               -- g_hook_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_prepend"
               }"
               end

	g_hook_ref (a_hook_list: POINTER; a_hook: POINTER): POINTER 
               -- g_hook_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_ref"
               }"
               end

	g_hook_unref (a_hook_list: POINTER; a_hook: POINTER) 
               -- g_hook_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hook_unref"
               }"
               end


end -- class GHOOK_EXTERNALS
