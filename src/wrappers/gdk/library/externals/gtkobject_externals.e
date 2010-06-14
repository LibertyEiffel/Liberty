-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOBJECT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_object_get_type: NATURAL_32 is
 		-- gtk_object_get_type (node at line 2848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get_type()"
		}"
		end

	gtk_object_remove_no_notify (an_object: POINTER; a_key: POINTER) is
 		-- gtk_object_remove_no_notify (node at line 7400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_remove_no_notify"
		}"
		end

	gtk_object_get_user_data (an_object: POINTER): POINTER is
 		-- gtk_object_get_user_data (node at line 9821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get_user_data"
		}"
		end

	gtk_object_destroy (an_object: POINTER) is
 		-- gtk_object_destroy (node at line 10140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_destroy"
		}"
		end

	gtk_object_weakref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- gtk_object_weakref (node at line 13666)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_weakref"
		}"
		end

	gtk_object_ref (an_object: POINTER): POINTER is
 		-- gtk_object_ref (node at line 13730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_ref"
		}"
		end

	gtk_object_new (a_type: NATURAL_32; a_first_property_name: POINTER): POINTER is
 		-- gtk_object_new (variadic call)  (node at line 13734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_new"
		}"
		end

	gtk_object_set_user_data (an_object: POINTER; a_data: POINTER) is
 		-- gtk_object_set_user_data (node at line 13885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set_user_data"
		}"
		end

	gtk_object_get_data_by_id (an_object: POINTER; a_data_id: NATURAL_32): POINTER is
 		-- gtk_object_get_data_by_id (node at line 16088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get_data_by_id"
		}"
		end

	gtk_object_set_data (an_object: POINTER; a_key: POINTER; a_data: POINTER) is
 		-- gtk_object_set_data (node at line 17898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set_data"
		}"
		end

	gtk_object_remove_no_notify_by_id (an_object: POINTER; a_key_id: NATURAL_32) is
 		-- gtk_object_remove_no_notify_by_id (node at line 18231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_remove_no_notify_by_id"
		}"
		end

	gtk_object_add_arg_type (an_arg_name: POINTER; an_arg_type: NATURAL_32; an_arg_flags: NATURAL_32; an_arg_id: NATURAL_32) is
 		-- gtk_object_add_arg_type (node at line 19760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_add_arg_type"
		}"
		end

	gtk_object_weakunref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- gtk_object_weakunref (node at line 24072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_weakunref"
		}"
		end

	gtk_object_set (an_object: POINTER; a_first_property_name: POINTER) is
 		-- gtk_object_set (variadic call)  (node at line 26318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set"
		}"
		end

	gtk_object_remove_data_by_id (an_object: POINTER; a_data_id: NATURAL_32) is
 		-- gtk_object_remove_data_by_id (node at line 26758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_remove_data_by_id"
		}"
		end

	gtk_object_sink (an_object: POINTER) is
 		-- gtk_object_sink (node at line 27080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_sink"
		}"
		end

	gtk_object_set_data_full (an_object: POINTER; a_key: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_object_set_data_full (node at line 27733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set_data_full"
		}"
		end

	gtk_object_set_data_by_id (an_object: POINTER; a_data_id: NATURAL_32; a_data: POINTER) is
 		-- gtk_object_set_data_by_id (node at line 29205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set_data_by_id"
		}"
		end

	gtk_object_set_data_by_id_full (an_object: POINTER; a_data_id: NATURAL_32; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_object_set_data_by_id_full (node at line 29286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_set_data_by_id_full"
		}"
		end

	gtk_object_unref (an_object: POINTER) is
 		-- gtk_object_unref (node at line 29785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_unref"
		}"
		end

	gtk_object_get (an_object: POINTER; a_first_property_name: POINTER) is
 		-- gtk_object_get (variadic call)  (node at line 32793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get"
		}"
		end

	gtk_object_remove_data (an_object: POINTER; a_key: POINTER) is
 		-- gtk_object_remove_data (node at line 34261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_remove_data"
		}"
		end

	gtk_object_get_data (an_object: POINTER; a_key: POINTER): POINTER is
 		-- gtk_object_get_data (node at line 37561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get_data"
		}"
		end


end -- class GTKOBJECT_EXTERNALS
