-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_type_init is
 		-- g_type_init (node at line 44)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_init()"
		}"
		end

	g_type_check_value (a_value: POINTER): INTEGER_32 is
 		-- g_type_check_value (node at line 69)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_value"
		}"
		end

	g_type_check_instance (an_instance: POINTER): INTEGER_32 is
 		-- g_type_check_instance (node at line 124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_instance"
		}"
		end

	g_type_query (a_type: NATURAL_32; a_query: POINTER) is
 		-- g_type_query (node at line 180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_query"
		}"
		end

	g_type_class_peek_static (a_type: NATURAL_32): POINTER is
 		-- g_type_class_peek_static (node at line 324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_peek_static"
		}"
		end

	g_param_type_init is
 		-- g_param_type_init (node at line 507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_type_init()"
		}"
		end

	g_type_qname (a_type: NATURAL_32): NATURAL_32 is
 		-- g_type_qname (node at line 531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_qname"
		}"
		end

	g_type_init_with_debug_flags (a_debug_flags: INTEGER) is
 		-- g_type_init_with_debug_flags (node at line 550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_init_with_debug_flags"
		}"
		end

	g_type_add_interface_static (an_instance_type: NATURAL_32; an_interface_type: NATURAL_32; an_info: POINTER) is
 		-- g_type_add_interface_static (node at line 577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_add_interface_static"
		}"
		end

	g_param_spec_types_init is
 		-- g_param_spec_types_init (node at line 705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_types_init()"
		}"
		end

	g_type_class_add_private (a_g_class: POINTER; a_private_size: NATURAL_32) is
 		-- g_type_class_add_private (node at line 747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_add_private"
		}"
		end

	g_type_class_peek_parent (a_g_class: POINTER): POINTER is
 		-- g_type_class_peek_parent (node at line 1245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_peek_parent"
		}"
		end

	g_type_interface_add_prerequisite (an_interface_type: NATURAL_32; a_prerequisite_type: NATURAL_32) is
 		-- g_type_interface_add_prerequisite (node at line 1357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interface_add_prerequisite"
		}"
		end

	g_type_free_instance (an_instance: POINTER) is
 		-- g_type_free_instance (node at line 1373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_free_instance"
		}"
		end

	g_type_fundamental (a_type_id: NATURAL_32): NATURAL_32 is
 		-- g_type_fundamental (node at line 1405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_fundamental"
		}"
		end

	g_value_transforms_init is
 		-- g_value_transforms_init (node at line 1450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_transforms_init()"
		}"
		end

	g_enum_types_init is
 		-- g_enum_types_init (node at line 1501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_types_init()"
		}"
		end

	g_type_from_name (a_name: POINTER): NATURAL_32 is
 		-- g_type_from_name (node at line 1559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_from_name"
		}"
		end

	g_type_interface_peek (an_instance_class: POINTER; an_iface_type: NATURAL_32): POINTER is
 		-- g_type_interface_peek (node at line 1798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interface_peek"
		}"
		end

	g_type_is_a (a_type: NATURAL_32; an_is_a_type: NATURAL_32): INTEGER_32 is
 		-- g_type_is_a (node at line 2206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_is_a"
		}"
		end

	g_type_test_flags (a_type: NATURAL_32; a_flags: NATURAL_32): INTEGER_32 is
 		-- g_type_test_flags (node at line 2342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_test_flags"
		}"
		end

	g_type_depth (a_type: NATURAL_32): NATURAL_32 is
 		-- g_type_depth (node at line 2455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_depth"
		}"
		end

	g_type_class_unref_uncached (a_g_class: POINTER) is
 		-- g_type_class_unref_uncached (node at line 2749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_unref_uncached"
		}"
		end

	g_type_default_interface_peek (a_g_type: NATURAL_32): POINTER is
 		-- g_type_default_interface_peek (node at line 2753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_default_interface_peek"
		}"
		end

	g_type_add_class_cache_func (a_cache_data: POINTER; a_cache_func: POINTER) is
 		-- g_type_add_class_cache_func (node at line 2828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_add_class_cache_func"
		}"
		end

	g_type_name_from_class (a_g_class: POINTER): POINTER is
 		-- g_type_name_from_class (node at line 2835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_name_from_class"
		}"
		end

	g_type_next_base (a_leaf_type: NATURAL_32; a_root_type: NATURAL_32): NATURAL_32 is
 		-- g_type_next_base (node at line 2927)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_next_base"
		}"
		end

	g_type_check_value_holds (a_value: POINTER; a_type: NATURAL_32): INTEGER_32 is
 		-- g_type_check_value_holds (node at line 3126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_value_holds"
		}"
		end

	g_type_add_interface_check (a_check_data: POINTER; a_check_func: POINTER) is
 		-- g_type_add_interface_check (node at line 3151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_add_interface_check"
		}"
		end

	g_type_register_static_simple (a_parent_type: NATURAL_32; a_type_name: POINTER; a_class_size: NATURAL_32; a_class_init: POINTER; an_instance_size: NATURAL_32; an_instance_init: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_type_register_static_simple (node at line 3378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_register_static_simple"
		}"
		end

	g_value_c_init is
 		-- g_value_c_init (node at line 3527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_c_init()"
		}"
		end

	g_type_interfaces (a_type: NATURAL_32; a_n_interfaces: POINTER): POINTER is
 		-- g_type_interfaces (node at line 3607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interfaces"
		}"
		end

	g_value_types_init is
 		-- g_value_types_init (node at line 3914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_types_init()"
		}"
		end

	g_type_class_get_private (a_klass: POINTER; a_private_type: NATURAL_32): POINTER is
 		-- g_type_class_get_private (node at line 3950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_get_private"
		}"
		end

	g_boxed_type_init is
 		-- g_boxed_type_init (node at line 4043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_type_init()"
		}"
		end

	g_type_set_qdata (a_type: NATURAL_32; a_quark: NATURAL_32; a_data: POINTER) is
 		-- g_type_set_qdata (node at line 4056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_set_qdata"
		}"
		end

	g_type_check_instance_is_a (an_instance: POINTER; an_iface_type: NATURAL_32): INTEGER_32 is
 		-- g_type_check_instance_is_a (node at line 4106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_instance_is_a"
		}"
		end

	g_type_check_is_value_type (a_type: NATURAL_32): INTEGER_32 is
 		-- g_type_check_is_value_type (node at line 4385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_is_value_type"
		}"
		end

	g_type_children (a_type: NATURAL_32; a_n_children: POINTER): POINTER is
 		-- g_type_children (node at line 4618)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_children"
		}"
		end

	g_type_get_qdata (a_type: NATURAL_32; a_quark: NATURAL_32): POINTER is
 		-- g_type_get_qdata (node at line 4704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_get_qdata"
		}"
		end

	g_type_check_class_cast (a_g_class: POINTER; an_is_a_type: NATURAL_32): POINTER is
 		-- g_type_check_class_cast (node at line 4768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_class_cast"
		}"
		end

	g_type_default_interface_ref (a_g_type: NATURAL_32): POINTER is
 		-- g_type_default_interface_ref (node at line 4845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_default_interface_ref"
		}"
		end

	g_type_register_static (a_parent_type: NATURAL_32; a_type_name: POINTER; an_info: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_type_register_static (node at line 4918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_register_static"
		}"
		end

	g_type_remove_class_cache_func (a_cache_data: POINTER; a_cache_func: POINTER) is
 		-- g_type_remove_class_cache_func (node at line 5026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_remove_class_cache_func"
		}"
		end

	g_type_create_instance (a_type: NATURAL_32): POINTER is
 		-- g_type_create_instance (node at line 5030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_create_instance"
		}"
		end

	g_type_class_ref (a_type: NATURAL_32): POINTER is
 		-- g_type_class_ref (node at line 5064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_ref"
		}"
		end

	g_object_type_init is
 		-- g_object_type_init (node at line 5067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_object_type_init()"
		}"
		end

	g_type_fundamental_next: NATURAL_32 is
 		-- g_type_fundamental_next (node at line 5096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_fundamental_next()"
		}"
		end

	g_type_class_peek (a_type: NATURAL_32): POINTER is
 		-- g_type_class_peek (node at line 5359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_peek"
		}"
		end

	g_signal_init is
 		-- g_signal_init (node at line 5478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_init()"
		}"
		end

	g_type_value_table_peek (a_type: NATURAL_32): POINTER is
 		-- g_type_value_table_peek (node at line 5552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_value_table_peek"
		}"
		end

	g_type_check_class_is_a (a_g_class: POINTER; an_is_a_type: NATURAL_32): INTEGER_32 is
 		-- g_type_check_class_is_a (node at line 5600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_class_is_a"
		}"
		end

	g_type_default_interface_unref (a_g_iface: POINTER) is
 		-- g_type_default_interface_unref (node at line 5721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_default_interface_unref"
		}"
		end

	g_type_instance_get_private (an_instance: POINTER; a_private_type: NATURAL_32): POINTER is
 		-- g_type_instance_get_private (node at line 5807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_instance_get_private"
		}"
		end

	g_type_interface_prerequisites (an_interface_type: NATURAL_32; a_n_prerequisites: POINTER): POINTER is
 		-- g_type_interface_prerequisites (node at line 5811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interface_prerequisites"
		}"
		end

	g_type_register_dynamic (a_parent_type: NATURAL_32; a_type_name: POINTER; a_plugin: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_type_register_dynamic (node at line 5886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_register_dynamic"
		}"
		end

	g_type_get_plugin (a_type: NATURAL_32): POINTER is
 		-- g_type_get_plugin (node at line 5901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_get_plugin"
		}"
		end

	g_type_add_interface_dynamic (an_instance_type: NATURAL_32; an_interface_type: NATURAL_32; a_plugin: POINTER) is
 		-- g_type_add_interface_dynamic (node at line 5964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_add_interface_dynamic"
		}"
		end

	g_type_register_fundamental (a_type_id: NATURAL_32; a_type_name: POINTER; an_info: POINTER; a_finfo: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_type_register_fundamental (node at line 6142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_register_fundamental"
		}"
		end

	g_type_interface_get_plugin (an_instance_type: NATURAL_32; an_interface_type: NATURAL_32): POINTER is
 		-- g_type_interface_get_plugin (node at line 6211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interface_get_plugin"
		}"
		end

	g_type_interface_peek_parent (a_g_iface: POINTER): POINTER is
 		-- g_type_interface_peek_parent (node at line 6331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_interface_peek_parent"
		}"
		end

	g_type_class_unref (a_g_class: POINTER) is
 		-- g_type_class_unref (node at line 6618)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_class_unref"
		}"
		end

	g_type_name_from_instance (an_instance: POINTER): POINTER is
 		-- g_type_name_from_instance (node at line 6812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_name_from_instance"
		}"
		end

	g_type_remove_interface_check (a_check_data: POINTER; a_check_func: POINTER) is
 		-- g_type_remove_interface_check (node at line 6822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_remove_interface_check"
		}"
		end

	g_type_check_instance_cast (an_instance: POINTER; an_iface_type: NATURAL_32): POINTER is
 		-- g_type_check_instance_cast (node at line 7131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_check_instance_cast"
		}"
		end

	g_type_add_class_private (a_class_type: NATURAL_32; a_private_size: NATURAL_32) is
 		-- g_type_add_class_private (node at line 7326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_add_class_private"
		}"
		end

	g_type_name (a_type: NATURAL_32): POINTER is
 		-- g_type_name (node at line 7879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_name"
		}"
		end

	g_type_parent (a_type: NATURAL_32): NATURAL_32 is
 		-- g_type_parent (node at line 8469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_parent"
		}"
		end

feature {} -- Variables
	-- `hidden' variable _g_type_debug_flags skipped.

end -- class GTYPE_EXTERNALS
