-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBOXED_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_boxed_copy (a_boxed_type: like long_unsigned; a_src_boxed: POINTER): POINTER 

		-- function g_boxed_copy (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_boxed_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_boxed_copy"
               }"
               end

	g_boxed_free (a_boxed_type: like long_unsigned; a_boxed: POINTER) 

		-- function g_boxed_free (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_boxed_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_boxed_free"
               }"
               end

	g_boxed_type_register_static (a_name: POINTER; a_boxed_copy: POINTER; a_boxed_free: POINTER): like long_unsigned 

		-- function g_boxed_type_register_static (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_boxed_type_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_boxed_type_register_static"
               }"
               end

	g_closure_get_type: like long_unsigned 

		-- function g_closure_get_type (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_closure_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_closure_get_type()"
               }"
               end

	g_value_dup_boxed (a_value: POINTER): POINTER 

		-- function g_value_dup_boxed (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_dup_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_dup_boxed"
               }"
               end

	g_value_get_boxed (a_value: POINTER): POINTER 

		-- function g_value_get_boxed (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_get_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_boxed"
               }"
               end

	g_value_get_type: like long_unsigned 

		-- function g_value_get_type (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_type()"
               }"
               end

	g_value_set_boxed (a_value: POINTER; a_v_boxed: POINTER) 

		-- function g_value_set_boxed (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_set_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_boxed"
               }"
               end

	g_value_set_boxed_take_ownership (a_value: POINTER; a_v_boxed: POINTER) 

		-- function g_value_set_boxed_take_ownership (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_set_boxed_take_ownership
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_boxed_take_ownership"
               }"
               end

	g_value_set_static_boxed (a_value: POINTER; a_v_boxed: POINTER) 

		-- function g_value_set_static_boxed (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_set_static_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_static_boxed"
               }"
               end

	g_value_take_boxed (a_value: POINTER; a_v_boxed: POINTER) 

		-- function g_value_take_boxed (in `/usr/include/glib-2.0/gobject/gboxed.h')
               -- g_value_take_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_take_boxed"
               }"
               end


end -- class GBOXED_EXTERNALS
