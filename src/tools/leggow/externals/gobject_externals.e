-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOBJECT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_cclosure_new_object (a_callback_func: POINTER; an_object: POINTER): POINTER 

		-- function g_cclosure_new_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_cclosure_new_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cclosure_new_object"
               }"
               end

	g_cclosure_new_object_swap (a_callback_func: POINTER; an_object: POINTER): POINTER 

		-- function g_cclosure_new_object_swap (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_cclosure_new_object_swap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_cclosure_new_object_swap"
               }"
               end

	g_clear_object (an_object_ptr: POINTER) 

		-- function g_clear_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_clear_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_clear_object"
               }"
               end

	g_closure_new_object (a_sizeof_closure: NATURAL; an_object: POINTER): POINTER 

		-- function g_closure_new_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_closure_new_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_closure_new_object"
               }"
               end

	g_initially_unowned_get_type: like long_unsigned 

		-- function g_initially_unowned_get_type (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_initially_unowned_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_initially_unowned_get_type()"
               }"
               end

	g_object_add_toggle_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) 

		-- function g_object_add_toggle_ref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_add_toggle_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_add_toggle_ref"
               }"
               end

	g_object_add_weak_pointer (an_object: POINTER; a_weak_pointer_location: POINTER) 

		-- function g_object_add_weak_pointer (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_add_weak_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_add_weak_pointer"
               }"
               end

	g_object_class_find_property (an_oclass: POINTER; a_property_name: POINTER): POINTER 

		-- function g_object_class_find_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_class_find_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_class_find_property"
               }"
               end

	g_object_class_install_properties (an_oclass: POINTER; a_n_pspecs: NATURAL; a_pspecs: POINTER) 

		-- function g_object_class_install_properties (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_class_install_properties
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_class_install_properties"
               }"
               end

	g_object_class_install_property (an_oclass: POINTER; a_property_id: NATURAL; a_pspec: POINTER) 

		-- function g_object_class_install_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_class_install_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_class_install_property"
               }"
               end

	g_object_class_list_properties (an_oclass: POINTER; a_n_properties: POINTER): POINTER 

		-- function g_object_class_list_properties (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_class_list_properties
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_class_list_properties"
               }"
               end

	g_object_class_override_property (an_oclass: POINTER; a_property_id: NATURAL; a_name: POINTER) 

		-- function g_object_class_override_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_class_override_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_class_override_property"
               }"
               end

	g_object_compat_control (a_what: like long_unsigned; a_data: POINTER): like long_unsigned 

		-- function g_object_compat_control (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_compat_control
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_compat_control"
               }"
               end

	g_object_connect (an_object: POINTER; a_signal_spec: POINTER): POINTER 

		-- function g_object_connect (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_connect (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_connect"
               }"
               end

	g_object_disconnect (an_object: POINTER; a_signal_spec: POINTER) 

		-- function g_object_disconnect (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_disconnect (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_disconnect"
               }"
               end

	g_object_dup_data (an_object: POINTER; a_key: POINTER; a_dup_func: POINTER; an_user_data: POINTER): POINTER 

		-- function g_object_dup_data (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_dup_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_dup_data"
               }"
               end

	g_object_dup_qdata (an_object: POINTER; a_quark: NATURAL; a_dup_func: POINTER; an_user_data: POINTER): POINTER 

		-- function g_object_dup_qdata (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_dup_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_dup_qdata"
               }"
               end

	g_object_force_floating (an_object: POINTER) 

		-- function g_object_force_floating (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_force_floating
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_force_floating"
               }"
               end

	g_object_freeze_notify (an_object: POINTER) 

		-- function g_object_freeze_notify (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_freeze_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_freeze_notify"
               }"
               end

	g_object_get (an_object: POINTER; a_first_property_name: POINTER) 

		-- function g_object_get (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get"
               }"
               end

	g_object_get_data (an_object: POINTER; a_key: POINTER): POINTER 

		-- function g_object_get_data (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get_data"
               }"
               end

	g_object_get_property (an_object: POINTER; a_property_name: POINTER; a_value: POINTER) 

		-- function g_object_get_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get_property"
               }"
               end

	g_object_get_qdata (an_object: POINTER; a_quark: NATURAL): POINTER 

		-- function g_object_get_qdata (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get_qdata"
               }"
               end

	g_object_get_type: like long_unsigned 

		-- function g_object_get_type (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get_type()"
               }"
               end

	g_object_get_valist (an_object: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) 

		-- function g_object_get_valist (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_get_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_get_valist"
               }"
               end

	g_object_interface_find_property (a_g_iface: POINTER; a_property_name: POINTER): POINTER 

		-- function g_object_interface_find_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_interface_find_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_interface_find_property"
               }"
               end

	g_object_interface_install_property (a_g_iface: POINTER; a_pspec: POINTER) 

		-- function g_object_interface_install_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_interface_install_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_interface_install_property"
               }"
               end

	g_object_interface_list_properties (a_g_iface: POINTER; a_n_properties_p: POINTER): POINTER 

		-- function g_object_interface_list_properties (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_interface_list_properties
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_interface_list_properties"
               }"
               end

	g_object_is_floating (an_object: POINTER): INTEGER 

		-- function g_object_is_floating (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_is_floating
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_is_floating"
               }"
               end

	g_object_new (an_object_type: like long_unsigned; a_first_property_name: POINTER): POINTER 

		-- function g_object_new (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_new (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_new"
               }"
               end

	g_object_new_valist (an_object_type: like long_unsigned; a_first_property_name: POINTER; a_var_args: POINTER): POINTER 

		-- function g_object_new_valist (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_new_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_new_valist"
               }"
               end

	g_object_newv (an_object_type: like long_unsigned; a_n_parameters: NATURAL; a_parameters: POINTER): POINTER 

		-- function g_object_newv (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_newv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_newv"
               }"
               end

	g_object_notify (an_object: POINTER; a_property_name: POINTER) 

		-- function g_object_notify (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_notify"
               }"
               end

	g_object_notify_by_pspec (an_object: POINTER; a_pspec: POINTER) 

		-- function g_object_notify_by_pspec (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_notify_by_pspec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_notify_by_pspec"
               }"
               end

	g_object_ref (an_object: POINTER): POINTER 

		-- function g_object_ref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_ref"
               }"
               end

	g_object_ref_sink (an_object: POINTER): POINTER 

		-- function g_object_ref_sink (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_ref_sink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_ref_sink"
               }"
               end

	g_object_remove_toggle_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) 

		-- function g_object_remove_toggle_ref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_remove_toggle_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_remove_toggle_ref"
               }"
               end

	g_object_remove_weak_pointer (an_object: POINTER; a_weak_pointer_location: POINTER) 

		-- function g_object_remove_weak_pointer (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_remove_weak_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_remove_weak_pointer"
               }"
               end

	g_object_replace_data (an_object: POINTER; a_key: POINTER; an_oldval: POINTER; a_newval: POINTER; a_destroy: POINTER; an_old_destroy: POINTER): INTEGER 

		-- function g_object_replace_data (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_replace_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_replace_data"
               }"
               end

	g_object_replace_qdata (an_object: POINTER; a_quark: NATURAL; an_oldval: POINTER; a_newval: POINTER; a_destroy: POINTER; an_old_destroy: POINTER): INTEGER 

		-- function g_object_replace_qdata (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_replace_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_replace_qdata"
               }"
               end

	g_object_run_dispose (an_object: POINTER) 

		-- function g_object_run_dispose (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_run_dispose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_run_dispose"
               }"
               end

	g_object_set (an_object: POINTER; a_first_property_name: POINTER) 

		-- function g_object_set (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set"
               }"
               end

	g_object_set_data (an_object: POINTER; a_key: POINTER; a_data: POINTER) 

		-- function g_object_set_data (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_data"
               }"
               end

	g_object_set_data_full (an_object: POINTER; a_key: POINTER; a_data: POINTER; a_destroy: POINTER) 

		-- function g_object_set_data_full (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_data_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_data_full"
               }"
               end

	g_object_set_property (an_object: POINTER; a_property_name: POINTER; a_value: POINTER) 

		-- function g_object_set_property (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_property"
               }"
               end

	g_object_set_qdata (an_object: POINTER; a_quark: NATURAL; a_data: POINTER) 

		-- function g_object_set_qdata (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_qdata"
               }"
               end

	g_object_set_qdata_full (an_object: POINTER; a_quark: NATURAL; a_data: POINTER; a_destroy: POINTER) 

		-- function g_object_set_qdata_full (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_qdata_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_qdata_full"
               }"
               end

	g_object_set_valist (an_object: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) 

		-- function g_object_set_valist (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_set_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_set_valist"
               }"
               end

	g_object_steal_data (an_object: POINTER; a_key: POINTER): POINTER 

		-- function g_object_steal_data (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_steal_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_steal_data"
               }"
               end

	g_object_steal_qdata (an_object: POINTER; a_quark: NATURAL): POINTER 

		-- function g_object_steal_qdata (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_steal_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_steal_qdata"
               }"
               end

	g_object_thaw_notify (an_object: POINTER) 

		-- function g_object_thaw_notify (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_thaw_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_thaw_notify"
               }"
               end

	g_object_unref (an_object: POINTER) 

		-- function g_object_unref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_unref"
               }"
               end

	g_object_watch_closure (an_object: POINTER; a_closure: POINTER) 

		-- function g_object_watch_closure (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_watch_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_watch_closure"
               }"
               end

	g_object_weak_ref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) 

		-- function g_object_weak_ref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_weak_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_weak_ref"
               }"
               end

	g_object_weak_unref (an_object: POINTER; a_notify: POINTER; a_data: POINTER) 

		-- function g_object_weak_unref (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_object_weak_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_weak_unref"
               }"
               end

	g_set_object (an_object_ptr: POINTER; a_new_object: POINTER): INTEGER 

		-- function g_set_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_set_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_object"
               }"
               end

	g_signal_connect_object (an_instance: POINTER; a_detailed_signal: POINTER; a_c_handler: POINTER; a_gobject: POINTER; a_connect_flags: INTEGER): like long_unsigned 

		-- function g_signal_connect_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_signal_connect_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_connect_object"
               }"
               end

	g_value_dup_object (a_value: POINTER): POINTER 

		-- function g_value_dup_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_value_dup_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_dup_object"
               }"
               end

	g_value_get_object (a_value: POINTER): POINTER 

		-- function g_value_get_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_value_get_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_object"
               }"
               end

	g_value_set_object (a_value: POINTER; a_v_object: POINTER) 

		-- function g_value_set_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_value_set_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_object"
               }"
               end

	g_value_set_object_take_ownership (a_value: POINTER; a_v_object: POINTER) 

		-- function g_value_set_object_take_ownership (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_value_set_object_take_ownership
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_object_take_ownership"
               }"
               end

	g_value_take_object (a_value: POINTER; a_v_object: POINTER) 

		-- function g_value_take_object (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_value_take_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_take_object"
               }"
               end

	g_weak_ref_clear (a_weak_ref: POINTER) 

		-- function g_weak_ref_clear (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_weak_ref_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_weak_ref_clear"
               }"
               end

	g_weak_ref_get (a_weak_ref: POINTER): POINTER 

		-- function g_weak_ref_get (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_weak_ref_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_weak_ref_get"
               }"
               end

	g_weak_ref_init (a_weak_ref: POINTER; an_object: POINTER) 

		-- function g_weak_ref_init (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_weak_ref_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_weak_ref_init"
               }"
               end

	g_weak_ref_set (a_weak_ref: POINTER; an_object: POINTER) 

		-- function g_weak_ref_set (in `/usr/include/glib-2.0/gobject/gobject.h')
               -- g_weak_ref_set
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_weak_ref_set"
               }"
               end


end -- class GOBJECT_EXTERNALS
