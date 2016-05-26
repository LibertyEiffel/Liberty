-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVALUE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_value_copy (a_src_value: POINTER; a_dest_value: POINTER) 

		-- function g_value_copy (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_copy"
               }"
               end

	g_value_fits_pointer (a_value: POINTER): INTEGER 

		-- function g_value_fits_pointer (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_fits_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_fits_pointer"
               }"
               end

	g_value_init (a_value: POINTER; a_g_type: like long_unsigned): POINTER 

		-- function g_value_init (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_init"
               }"
               end

	g_value_init_from_instance (a_value: POINTER; an_instance: POINTER) 

		-- function g_value_init_from_instance (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_init_from_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_init_from_instance"
               }"
               end

	g_value_peek_pointer (a_value: POINTER): POINTER 

		-- function g_value_peek_pointer (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_peek_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_peek_pointer"
               }"
               end

	g_value_register_transform_func (a_src_type: like long_unsigned; a_dest_type: like long_unsigned; a_transform_func: POINTER) 

		-- function g_value_register_transform_func (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_register_transform_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_register_transform_func"
               }"
               end

	g_value_reset (a_value: POINTER): POINTER 

		-- function g_value_reset (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_reset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_reset"
               }"
               end

	g_value_set_instance (a_value: POINTER; an_instance: POINTER) 

		-- function g_value_set_instance (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_set_instance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_instance"
               }"
               end

	g_value_transform (a_src_value: POINTER; a_dest_value: POINTER): INTEGER 

		-- function g_value_transform (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_transform
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_transform"
               }"
               end

	g_value_type_compatible (a_src_type: like long_unsigned; a_dest_type: like long_unsigned): INTEGER 

		-- function g_value_type_compatible (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_type_compatible
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_type_compatible"
               }"
               end

	g_value_type_transformable (a_src_type: like long_unsigned; a_dest_type: like long_unsigned): INTEGER 

		-- function g_value_type_transformable (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_type_transformable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_type_transformable"
               }"
               end

	g_value_unset (a_value: POINTER) 

		-- function g_value_unset (in `/usr/include/glib-2.0/gobject/gvalue.h')
               -- g_value_unset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_unset"
               }"
               end


end -- class GVALUE_EXTERNALS
