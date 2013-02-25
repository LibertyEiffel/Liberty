-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOBJECT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_object_force_floating (an_object: POINTER) is
 		-- g_object_force_floating (node at line 59)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_force_floating"
		}"
		end

	g_object_add_toggle_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- g_object_add_toggle_ref (node at line 100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_add_toggle_ref"
		}"
		end

	g_object_ref_sink (an_object: POINTER): POINTER is
 		-- g_object_ref_sink (node at line 219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_ref_sink"
		}"
		end

	g_object_is_floating (an_object: POINTER): INTEGER_32 is
 		-- g_object_is_floating (node at line 333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_is_floating"
		}"
		end

	g_object_steal_data (an_object: POINTER; a_key: POINTER): POINTER is
 		-- g_object_steal_data (node at line 377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_steal_data"
		}"
		end

	g_object_add_weak_pointer (an_object: POINTER; a_weak_pointer_location: POINTER) is
 		-- g_object_add_weak_pointer (node at line 534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_add_weak_pointer"
		}"
		end

	g_signal_connect_object (an_instance: POINTER; a_detailed_signal: POINTER; a_c_handler: POINTER; a_gobject: POINTER; a_connect_flags: INTEGER): NATURAL_32 is
 		-- g_signal_connect_object (node at line 1042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_connect_object"
		}"
		end

	g_object_run_dispose (an_object: POINTER) is
 		-- g_object_run_dispose (node at line 1063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_run_dispose"
		}"
		end

	g_object_get_type: NATURAL_32 is
 		-- g_object_get_type (node at line 1291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get_type()"
		}"
		end

	g_object_disconnect (an_object: POINTER; a_signal_spec: POINTER) is
 		-- g_object_disconnect (variadic call)  (node at line 1296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_disconnect"
		}"
		end

	g_object_new_valist (an_object_type: NATURAL_32; a_first_property_name: POINTER; a_var_args: POINTER): POINTER is
 		-- g_object_new_valist (node at line 1465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_new_valist"
		}"
		end

	g_object_set_data (an_object: POINTER; a_key: POINTER; a_data: POINTER) is
 		-- g_object_set_data (node at line 1519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_data"
		}"
		end

	g_object_steal_qdata (an_object: POINTER; a_quark: NATURAL_32): POINTER is
 		-- g_object_steal_qdata (node at line 1765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_steal_qdata"
		}"
		end

	g_object_notify (an_object: POINTER; a_property_name: POINTER) is
 		-- g_object_notify (node at line 1811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_notify"
		}"
		end

	g_object_set_qdata (an_object: POINTER; a_quark: NATURAL_32; a_data: POINTER) is
 		-- g_object_set_qdata (node at line 2162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_qdata"
		}"
		end

	g_object_set_data_full (an_object: POINTER; a_key: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- g_object_set_data_full (node at line 2509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_data_full"
		}"
		end

	g_object_weak_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- g_object_weak_ref (node at line 2656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_weak_ref"
		}"
		end

	g_object_weak_unref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- g_object_weak_unref (node at line 2661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_weak_unref"
		}"
		end

	g_object_get_qdata (an_object: POINTER; a_quark: NATURAL_32): POINTER is
 		-- g_object_get_qdata (node at line 2720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get_qdata"
		}"
		end

	g_object_class_override_property (an_oclass: POINTER; a_property_id: NATURAL_32; a_name: POINTER) is
 		-- g_object_class_override_property (node at line 2732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_class_override_property"
		}"
		end

	g_object_set_qdata_full (an_object: POINTER; a_quark: NATURAL_32; a_data: POINTER; a_destroy: POINTER) is
 		-- g_object_set_qdata_full (node at line 2903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_qdata_full"
		}"
		end

	g_closure_new_object (a_sizeof_closure: NATURAL_32; an_object: POINTER): POINTER is
 		-- g_closure_new_object (node at line 3066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_new_object"
		}"
		end

	g_object_remove_toggle_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) is
 		-- g_object_remove_toggle_ref (node at line 3205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_remove_toggle_ref"
		}"
		end

	g_object_interface_install_property (a_g_iface: POINTER; a_pspec: POINTER) is
 		-- g_object_interface_install_property (node at line 3310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_interface_install_property"
		}"
		end

	g_object_thaw_notify (an_object: POINTER) is
 		-- g_object_thaw_notify (node at line 3424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_thaw_notify"
		}"
		end

	g_object_interface_find_property (a_g_iface: POINTER; a_property_name: POINTER): POINTER is
 		-- g_object_interface_find_property (node at line 3639)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_interface_find_property"
		}"
		end

	g_object_new (an_object_type: NATURAL_32; a_first_property_name: POINTER): POINTER is
 		-- g_object_new (variadic call)  (node at line 3661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_new"
		}"
		end

	g_object_connect (an_object: POINTER; a_signal_spec: POINTER): POINTER is
 		-- g_object_connect (variadic call)  (node at line 4004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_connect"
		}"
		end

	g_object_newv (an_object_type: NATURAL_32; a_n_parameters: NATURAL_32; a_parameters: POINTER): POINTER is
 		-- g_object_newv (node at line 4138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_newv"
		}"
		end

	g_object_compat_control (a_what: NATURAL_32; a_data: POINTER): NATURAL_32 is
 		-- g_object_compat_control (node at line 4189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_compat_control"
		}"
		end

	g_object_get (an_object: POINTER; a_first_property_name: POINTER) is
 		-- g_object_get (variadic call)  (node at line 4414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get"
		}"
		end

	g_object_ref (an_object: POINTER): POINTER is
 		-- g_object_ref (node at line 4539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_ref"
		}"
		end

	g_value_dup_object (a_value: POINTER): POINTER is
 		-- g_value_dup_object (node at line 5034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_dup_object"
		}"
		end

	g_object_unref (an_object: POINTER) is
 		-- g_object_unref (node at line 5319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_unref"
		}"
		end

	g_object_remove_weak_pointer (an_object: POINTER; a_weak_pointer_location: POINTER) is
 		-- g_object_remove_weak_pointer (node at line 5669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_remove_weak_pointer"
		}"
		end

	g_cclosure_new_object (a_callback_func: POINTER; an_object: POINTER): POINTER is
 		-- g_cclosure_new_object (node at line 5737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new_object"
		}"
		end

	g_object_get_data (an_object: POINTER; a_key: POINTER): POINTER is
 		-- g_object_get_data (node at line 5983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get_data"
		}"
		end

	g_object_get_valist (an_object: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- g_object_get_valist (node at line 6006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get_valist"
		}"
		end

	g_initially_unowned_get_type: NATURAL_32 is
 		-- g_initially_unowned_get_type (node at line 6242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_initially_unowned_get_type()"
		}"
		end

	g_value_set_object_take_ownership (a_value: POINTER; a_v_object: POINTER) is
 		-- g_value_set_object_take_ownership (node at line 6303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_object_take_ownership"
		}"
		end

	g_object_set_property (an_object: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- g_object_set_property (node at line 6347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_property"
		}"
		end

	g_value_take_object (a_value: POINTER; a_v_object: POINTER) is
 		-- g_value_take_object (node at line 6785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_take_object"
		}"
		end

	g_object_set (an_object: POINTER; a_first_property_name: POINTER) is
 		-- g_object_set (variadic call)  (node at line 6862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set"
		}"
		end

	g_object_set_valist (an_object: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- g_object_set_valist (node at line 6971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_set_valist"
		}"
		end

	g_object_get_property (an_object: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- g_object_get_property (node at line 7146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_get_property"
		}"
		end

	g_value_set_object (a_value: POINTER; a_v_object: POINTER) is
 		-- g_value_set_object (node at line 7267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_object"
		}"
		end

	g_object_interface_list_properties (a_g_iface: POINTER; a_n_properties_p: POINTER): POINTER is
 		-- g_object_interface_list_properties (node at line 7698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_interface_list_properties"
		}"
		end

	g_object_class_list_properties (an_oclass: POINTER; a_n_properties: POINTER): POINTER is
 		-- g_object_class_list_properties (node at line 7795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_class_list_properties"
		}"
		end

	g_cclosure_new_object_swap (a_callback_func: POINTER; an_object: POINTER): POINTER is
 		-- g_cclosure_new_object_swap (node at line 7837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new_object_swap"
		}"
		end

	g_object_class_find_property (an_oclass: POINTER; a_property_name: POINTER): POINTER is
 		-- g_object_class_find_property (node at line 7845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_class_find_property"
		}"
		end

	g_object_freeze_notify (an_object: POINTER) is
 		-- g_object_freeze_notify (node at line 8316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_freeze_notify"
		}"
		end

	g_object_class_install_property (an_oclass: POINTER; a_property_id: NATURAL_32; a_pspec: POINTER) is
 		-- g_object_class_install_property (node at line 8601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_class_install_property"
		}"
		end

	g_object_watch_closure (an_object: POINTER; a_closure: POINTER) is
 		-- g_object_watch_closure (node at line 8702)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_watch_closure"
		}"
		end

	g_value_get_object (a_value: POINTER): POINTER is
 		-- g_value_get_object (node at line 8713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_object"
		}"
		end


end -- class GOBJECT_EXTERNALS
