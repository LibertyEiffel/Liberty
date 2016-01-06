-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_type_add_class_cache_func (a_cache_data: POINTER; a_cache_func: POINTER) 
               -- g_type_add_class_cache_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_class_cache_func"
               }"
               end

	g_type_add_class_private (a_class_type: like long_unsigned; a_private_size: like long_unsigned) 
               -- g_type_add_class_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_class_private"
               }"
               end

	g_type_add_instance_private (a_class_type: like long_unsigned; a_private_size: like long_unsigned): INTEGER 
               -- g_type_add_instance_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_instance_private"
               }"
               end

	g_type_add_interface_check (a_check_data: POINTER; a_check_func: POINTER) 
               -- g_type_add_interface_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_interface_check"
               }"
               end

	g_type_add_interface_dynamic (an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; a_plugin: POINTER) 
               -- g_type_add_interface_dynamic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_interface_dynamic"
               }"
               end

	g_type_add_interface_static (an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; an_info: POINTER) 
               -- g_type_add_interface_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_add_interface_static"
               }"
               end

	g_type_check_class_cast (a_g_class: POINTER; an_is_a_type: like long_unsigned): POINTER 
               -- g_type_check_class_cast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_class_cast"
               }"
               end

	g_type_check_class_is_a (a_g_class: POINTER; an_is_a_type: like long_unsigned): INTEGER 
               -- g_type_check_class_is_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_class_is_a"
               }"
               end

	g_type_check_instance (an_instance: POINTER): INTEGER 
               -- g_type_check_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_instance"
               }"
               end

	g_type_check_instance_cast (an_instance: POINTER; an_iface_type: like long_unsigned): POINTER 
               -- g_type_check_instance_cast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_instance_cast"
               }"
               end

	g_type_check_instance_is_a (an_instance: POINTER; an_iface_type: like long_unsigned): INTEGER 
               -- g_type_check_instance_is_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_instance_is_a"
               }"
               end

	g_type_check_instance_is_fundamentally_a (an_instance: POINTER; a_fundamental_type: like long_unsigned): INTEGER 
               -- g_type_check_instance_is_fundamentally_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_instance_is_fundamentally_a"
               }"
               end

	g_type_check_is_value_type (a_type: like long_unsigned): INTEGER 
               -- g_type_check_is_value_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_is_value_type"
               }"
               end

	g_type_check_value (a_value: POINTER): INTEGER 
               -- g_type_check_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_value"
               }"
               end

	g_type_check_value_holds (a_value: POINTER; a_type: like long_unsigned): INTEGER 
               -- g_type_check_value_holds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_check_value_holds"
               }"
               end

	g_type_children (a_type: like long_unsigned; a_n_children: POINTER): POINTER 
               -- g_type_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_children"
               }"
               end

	g_type_class_add_private (a_g_class: POINTER; a_private_size: like long_unsigned) 
               -- g_type_class_add_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_add_private"
               }"
               end

	g_type_class_adjust_private_offset (a_g_class: POINTER; a_private_size_or_offset: POINTER) 
               -- g_type_class_adjust_private_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_adjust_private_offset"
               }"
               end

	g_type_class_get_instance_private_offset (a_g_class: POINTER): INTEGER 
               -- g_type_class_get_instance_private_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_get_instance_private_offset"
               }"
               end

	g_type_class_get_private (a_klass: POINTER; a_private_type: like long_unsigned): POINTER 
               -- g_type_class_get_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_get_private"
               }"
               end

	g_type_class_peek (a_type: like long_unsigned): POINTER 
               -- g_type_class_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_peek"
               }"
               end

	g_type_class_peek_parent (a_g_class: POINTER): POINTER 
               -- g_type_class_peek_parent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_peek_parent"
               }"
               end

	g_type_class_peek_static (a_type: like long_unsigned): POINTER 
               -- g_type_class_peek_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_peek_static"
               }"
               end

	g_type_class_ref (a_type: like long_unsigned): POINTER 
               -- g_type_class_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_ref"
               }"
               end

	g_type_class_unref (a_g_class: POINTER) 
               -- g_type_class_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_unref"
               }"
               end

	g_type_class_unref_uncached (a_g_class: POINTER) 
               -- g_type_class_unref_uncached
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_class_unref_uncached"
               }"
               end

	g_type_create_instance (a_type: like long_unsigned): POINTER 
               -- g_type_create_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_create_instance"
               }"
               end

	g_type_default_interface_peek (a_g_type: like long_unsigned): POINTER 
               -- g_type_default_interface_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_default_interface_peek"
               }"
               end

	g_type_default_interface_ref (a_g_type: like long_unsigned): POINTER 
               -- g_type_default_interface_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_default_interface_ref"
               }"
               end

	g_type_default_interface_unref (a_g_iface: POINTER) 
               -- g_type_default_interface_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_default_interface_unref"
               }"
               end

	g_type_depth (a_type: like long_unsigned): NATURAL 
               -- g_type_depth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_depth"
               }"
               end

	g_type_ensure (a_type: like long_unsigned) 
               -- g_type_ensure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_ensure"
               }"
               end

	g_type_free_instance (an_instance: POINTER) 
               -- g_type_free_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_free_instance"
               }"
               end

	g_type_from_name (a_name: POINTER): like long_unsigned 
               -- g_type_from_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_from_name"
               }"
               end

	g_type_fundamental (a_type_id: like long_unsigned): like long_unsigned 
               -- g_type_fundamental
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_fundamental"
               }"
               end

	g_type_fundamental_next: like long_unsigned 
               -- g_type_fundamental_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_fundamental_next"
               }"
               end

	g_type_get_instance_count (a_type: like long_unsigned): INTEGER 
               -- g_type_get_instance_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_get_instance_count"
               }"
               end

	g_type_get_plugin (a_type: like long_unsigned): POINTER 
               -- g_type_get_plugin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_get_plugin"
               }"
               end

	g_type_get_qdata (a_type: like long_unsigned; a_quark: NATURAL): POINTER 
               -- g_type_get_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_get_qdata"
               }"
               end

	g_type_get_type_registration_serial: NATURAL 
               -- g_type_get_type_registration_serial
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_get_type_registration_serial"
               }"
               end

	g_type_init 
               -- g_type_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_init"
               }"
               end

	g_type_init_with_debug_flags (a_debug_flags: INTEGER) 
               -- g_type_init_with_debug_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_init_with_debug_flags"
               }"
               end

	g_type_instance_get_private (an_instance: POINTER; a_private_type: like long_unsigned): POINTER 
               -- g_type_instance_get_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_instance_get_private"
               }"
               end

	g_type_interface_add_prerequisite (an_interface_type: like long_unsigned; a_prerequisite_type: like long_unsigned) 
               -- g_type_interface_add_prerequisite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interface_add_prerequisite"
               }"
               end

	g_type_interface_get_plugin (an_instance_type: like long_unsigned; an_interface_type: like long_unsigned): POINTER 
               -- g_type_interface_get_plugin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interface_get_plugin"
               }"
               end

	g_type_interface_peek (an_instance_class: POINTER; an_iface_type: like long_unsigned): POINTER 
               -- g_type_interface_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interface_peek"
               }"
               end

	g_type_interface_peek_parent (a_g_iface: POINTER): POINTER 
               -- g_type_interface_peek_parent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interface_peek_parent"
               }"
               end

	g_type_interface_prerequisites (an_interface_type: like long_unsigned; a_n_prerequisites: POINTER): POINTER 
               -- g_type_interface_prerequisites
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interface_prerequisites"
               }"
               end

	g_type_interfaces (a_type: like long_unsigned; a_n_interfaces: POINTER): POINTER 
               -- g_type_interfaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_interfaces"
               }"
               end

	g_type_is_a (a_type: like long_unsigned; an_is_a_type: like long_unsigned): INTEGER 
               -- g_type_is_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_is_a"
               }"
               end

	g_type_name (a_type: like long_unsigned): POINTER 
               -- g_type_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_name"
               }"
               end

	g_type_name_from_class (a_g_class: POINTER): POINTER 
               -- g_type_name_from_class
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_name_from_class"
               }"
               end

	g_type_name_from_instance (an_instance: POINTER): POINTER 
               -- g_type_name_from_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_name_from_instance"
               }"
               end

	g_type_next_base (a_leaf_type: like long_unsigned; a_root_type: like long_unsigned): like long_unsigned 
               -- g_type_next_base
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_next_base"
               }"
               end

	g_type_parent (a_type: like long_unsigned): like long_unsigned 
               -- g_type_parent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_parent"
               }"
               end

	g_type_qname (a_type: like long_unsigned): NATURAL 
               -- g_type_qname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_qname"
               }"
               end

	g_type_query (a_type: like long_unsigned; a_query: POINTER) 
               -- g_type_query
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_query"
               }"
               end

	g_type_register_dynamic (a_parent_type: like long_unsigned; a_type_name: POINTER; a_plugin: POINTER; a_flags: INTEGER): like long_unsigned 
               -- g_type_register_dynamic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_register_dynamic"
               }"
               end

	g_type_register_fundamental (a_type_id: like long_unsigned; a_type_name: POINTER; an_info: POINTER; a_finfo: POINTER; a_flags: INTEGER): like long_unsigned 
               -- g_type_register_fundamental
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_register_fundamental"
               }"
               end

	g_type_register_static (a_parent_type: like long_unsigned; a_type_name: POINTER; an_info: POINTER; a_flags: INTEGER): like long_unsigned 
               -- g_type_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_register_static"
               }"
               end

	g_type_register_static_simple (a_parent_type: like long_unsigned; a_type_name: POINTER; a_class_size: NATURAL; a_class_init: POINTER; an_instance_size: NATURAL; an_instance_init: POINTER; a_flags: INTEGER): like long_unsigned 
               -- g_type_register_static_simple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_register_static_simple"
               }"
               end

	g_type_remove_class_cache_func (a_cache_data: POINTER; a_cache_func: POINTER) 
               -- g_type_remove_class_cache_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_remove_class_cache_func"
               }"
               end

	g_type_remove_interface_check (a_check_data: POINTER; a_check_func: POINTER) 
               -- g_type_remove_interface_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_remove_interface_check"
               }"
               end

	g_type_set_qdata (a_type: like long_unsigned; a_quark: NATURAL; a_data: POINTER) 
               -- g_type_set_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_set_qdata"
               }"
               end

	g_type_test_flags (a_type: like long_unsigned; a_flags: NATURAL): INTEGER 
               -- g_type_test_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_test_flags"
               }"
               end

	g_type_value_table_peek (a_type: like long_unsigned): POINTER 
               -- g_type_value_table_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_value_table_peek"
               }"
               end


end -- class GTYPE_EXTERNALS
