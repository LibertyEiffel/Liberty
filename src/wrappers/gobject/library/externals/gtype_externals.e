-- This file have been created by wrapper-generator.
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
                       feature_name: "Void"
               }"
               end

	g_type_add_class_private (a_class_type: like long_unsigned; a_private_size: like long_unsigned) 
               -- g_type_add_class_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_add_instance_private (a_class_type: like long_unsigned; a_private_size: like long_unsigned): INTEGER 
               -- g_type_add_instance_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_add_interface_check (a_check_data: POINTER; a_check_func: POINTER) 
               -- g_type_add_interface_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_add_interface_dynamic (an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; a_plugin: POINTER) 
               -- g_type_add_interface_dynamic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_add_interface_static (an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; an_info: POINTER) 
               -- g_type_add_interface_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_class_cast (a_g_class: POINTER; an_is_a_type: like long_unsigned): POINTER 
               -- g_type_check_class_cast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_class_is_a (a_g_class: POINTER; an_is_a_type: like long_unsigned): INTEGER 
               -- g_type_check_class_is_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_instance (an_instance: POINTER): INTEGER 
               -- g_type_check_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_instance_cast (an_instance: POINTER; an_iface_type: like long_unsigned): POINTER 
               -- g_type_check_instance_cast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_instance_is_a (an_instance: POINTER; an_iface_type: like long_unsigned): INTEGER 
               -- g_type_check_instance_is_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_instance_is_fundamentally_a (an_instance: POINTER; a_fundamental_type: like long_unsigned): INTEGER 
               -- g_type_check_instance_is_fundamentally_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_is_value_type (a_type: like long_unsigned): INTEGER 
               -- g_type_check_is_value_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_value (a_value: POINTER): INTEGER 
               -- g_type_check_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_check_value_holds (a_value: POINTER; a_type: like long_unsigned): INTEGER 
               -- g_type_check_value_holds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_children (a_type: like long_unsigned; a_n_children: POINTER): POINTER 
               -- g_type_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_add_private (a_g_class: POINTER; a_private_size: like long_unsigned) 
               -- g_type_class_add_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_adjust_private_offset (a_g_class: POINTER; a_private_size_or_offset: POINTER) 
               -- g_type_class_adjust_private_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_get_instance_private_offset (a_g_class: POINTER): INTEGER 
               -- g_type_class_get_instance_private_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_get_private (a_klass: POINTER; a_private_type: like long_unsigned): POINTER 
               -- g_type_class_get_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_peek (a_type: like long_unsigned): POINTER 
               -- g_type_class_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_peek_parent (a_g_class: POINTER): POINTER 
               -- g_type_class_peek_parent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	g_type_class_peek_static (a_type: like long_unsigned): POINTER 
               -- g_type_class_peek_static
               external "plug_in"
               alias "{
                       