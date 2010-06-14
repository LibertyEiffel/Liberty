-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCLOSURE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_closure_add_finalize_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_add_finalize_notifier (node at line 1153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_finalize_notifier"
		}"
		end

	g_closure_set_meta_marshal (a_closure: POINTER; a_marshal_data: POINTER; a_meta_marshal: POINTER) is
 		-- g_closure_set_meta_marshal (node at line 1439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_set_meta_marshal"
		}"
		end

	g_closure_add_marshal_guards (a_closure: POINTER; a_pre_marshal_data: POINTER; a_pre_marshal_notify: POINTER; a_post_marshal_data: POINTER; a_post_marshal_notify: POINTER) is
 		-- g_closure_add_marshal_guards (node at line 1974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_marshal_guards"
		}"
		end

	g_cclosure_new_swap (a_callback_func: POINTER; an_user_data: POINTER; a_destroy_data: POINTER): POINTER is
 		-- g_cclosure_new_swap (node at line 2093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new_swap"
		}"
		end

	g_closure_remove_invalidate_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_remove_invalidate_notifier (node at line 2819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_remove_invalidate_notifier"
		}"
		end

	g_closure_remove_finalize_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_remove_finalize_notifier (node at line 4546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_remove_finalize_notifier"
		}"
		end

	g_signal_type_cclosure_new (an_itype: NATURAL_32; a_struct_offset: NATURAL_32): POINTER is
 		-- g_signal_type_cclosure_new (node at line 4649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_type_cclosure_new"
		}"
		end

	g_closure_ref (a_closure: POINTER): POINTER is
 		-- g_closure_ref (node at line 5458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_ref"
		}"
		end

	g_closure_invoke (a_closure: POINTER; a_return_value: POINTER; a_n_param_values: NATURAL_32; a_param_values: POINTER; an_invocation_hint: POINTER) is
 		-- g_closure_invoke (node at line 5537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_invoke"
		}"
		end

	g_closure_sink (a_closure: POINTER) is
 		-- g_closure_sink (node at line 6149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_sink"
		}"
		end

	g_closure_invalidate (a_closure: POINTER) is
 		-- g_closure_invalidate (node at line 6673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_invalidate"
		}"
		end

	g_closure_set_marshal (a_closure: POINTER; a_marshal: POINTER) is
 		-- g_closure_set_marshal (node at line 6704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_set_marshal"
		}"
		end

	g_closure_unref (a_closure: POINTER) is
 		-- g_closure_unref (node at line 7135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_unref"
		}"
		end

	g_closure_add_invalidate_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_add_invalidate_notifier (node at line 7931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_invalidate_notifier"
		}"
		end

	g_closure_new_simple (a_sizeof_closure: NATURAL_32; a_data: POINTER): POINTER is
 		-- g_closure_new_simple (node at line 8342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_new_simple"
		}"
		end

	g_cclosure_new (a_callback_func: POINTER; an_user_data: POINTER; a_destroy_data: POINTER): POINTER is
 		-- g_cclosure_new (node at line 8727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new"
		}"
		end


end -- class GCLOSURE_EXTERNALS
