-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIOBJECTINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_object_info_find_method (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_object_info_find_method (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_find_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_find_method"
               }"
               end

	g_object_info_find_method_using_interfaces (an_info: POINTER; a_name: POINTER; an_implementor: POINTER): POINTER 

		-- function g_object_info_find_method_using_interfaces (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_find_method_using_interfaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_find_method_using_interfaces"
               }"
               end

	g_object_info_find_signal (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_object_info_find_signal (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_find_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_find_signal"
               }"
               end

	g_object_info_find_vfunc (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_object_info_find_vfunc (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_find_vfunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_find_vfunc"
               }"
               end

	g_object_info_find_vfunc_using_interfaces (an_info: POINTER; a_name: POINTER; an_implementor: POINTER): POINTER 

		-- function g_object_info_find_vfunc_using_interfaces (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_find_vfunc_using_interfaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_find_vfunc_using_interfaces"
               }"
               end

	g_object_info_get_abstract (an_info: POINTER): INTEGER 

		-- function g_object_info_get_abstract (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_abstract
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_abstract"
               }"
               end

	g_object_info_get_class_struct (an_info: POINTER): POINTER 

		-- function g_object_info_get_class_struct (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_class_struct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_class_struct"
               }"
               end

	g_object_info_get_constant (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_constant (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_constant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_constant"
               }"
               end

	g_object_info_get_field (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_field (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_field"
               }"
               end

	g_object_info_get_fundamental (an_info: POINTER): INTEGER 

		-- function g_object_info_get_fundamental (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_fundamental
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_fundamental"
               }"
               end

	g_object_info_get_get_value_function (an_info: POINTER): POINTER 

		-- function g_object_info_get_get_value_function (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_get_value_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_get_value_function"
               }"
               end

	g_object_info_get_get_value_function_pointer (an_info: POINTER): POINTER 

		-- function g_object_info_get_get_value_function_pointer (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_get_value_function_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_get_value_function_pointer"
               }"
               end

	g_object_info_get_interface (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_interface (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_interface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_interface"
               }"
               end

	g_object_info_get_method (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_method (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_method"
               }"
               end

	g_object_info_get_n_constants (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_constants (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_constants
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_constants"
               }"
               end

	g_object_info_get_n_fields (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_fields (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_fields
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_fields"
               }"
               end

	g_object_info_get_n_interfaces (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_interfaces (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_interfaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_interfaces"
               }"
               end

	g_object_info_get_n_methods (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_methods (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_methods
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_methods"
               }"
               end

	g_object_info_get_n_properties (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_properties (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_properties
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_properties"
               }"
               end

	g_object_info_get_n_signals (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_signals (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_signals"
               }"
               end

	g_object_info_get_n_vfuncs (an_info: POINTER): INTEGER 

		-- function g_object_info_get_n_vfuncs (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_n_vfuncs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_n_vfuncs"
               }"
               end

	g_object_info_get_parent (an_info: POINTER): POINTER 

		-- function g_object_info_get_parent (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_parent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_parent"
               }"
               end

	g_object_info_get_property (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_property (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_property"
               }"
               end

	g_object_info_get_ref_function (an_info: POINTER): POINTER 

		-- function g_object_info_get_ref_function (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_ref_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_ref_function"
               }"
               end

	g_object_info_get_ref_function_pointer (an_info: POINTER): POINTER 

		-- function g_object_info_get_ref_function_pointer (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_ref_function_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_ref_function_pointer"
               }"
               end

	g_object_info_get_set_value_function (an_info: POINTER): POINTER 

		-- function g_object_info_get_set_value_function (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_set_value_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_set_value_function"
               }"
               end

	g_object_info_get_set_value_function_pointer (an_info: POINTER): POINTER 

		-- function g_object_info_get_set_value_function_pointer (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_set_value_function_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_set_value_function_pointer"
               }"
               end

	g_object_info_get_signal (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_signal (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_signal"
               }"
               end

	g_object_info_get_type_init (an_info: POINTER): POINTER 

		-- function g_object_info_get_type_init (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_type_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_type_init"
               }"
               end

	g_object_info_get_type_name (an_info: POINTER): POINTER 

		-- function g_object_info_get_type_name (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_type_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_type_name"
               }"
               end

	g_object_info_get_unref_function (an_info: POINTER): POINTER 

		-- function g_object_info_get_unref_function (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_unref_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_unref_function"
               }"
               end

	g_object_info_get_unref_function_pointer (an_info: POINTER): POINTER 

		-- function g_object_info_get_unref_function_pointer (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_unref_function_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_unref_function_pointer"
               }"
               end

	g_object_info_get_vfunc (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_object_info_get_vfunc (in `/usr/include/gobject-introspection-1.0/giobjectinfo.h')
               -- g_object_info_get_vfunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_info_get_vfunc"
               }"
               end


end -- class GIOBJECTINFO_EXTERNALS
