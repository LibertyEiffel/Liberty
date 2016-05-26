-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GICALLABLEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_callable_info_can_throw_gerror (an_info: POINTER): INTEGER 

		-- function g_callable_info_can_throw_gerror (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_can_throw_gerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_can_throw_gerror"
               }"
               end

	g_callable_info_get_arg (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_callable_info_get_arg (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_arg"
               }"
               end

	g_callable_info_get_caller_owns (an_info: POINTER): INTEGER 

		-- function g_callable_info_get_caller_owns (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_caller_owns
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_caller_owns"
               }"
               end

	g_callable_info_get_instance_ownership_transfer (an_info: POINTER): INTEGER 

		-- function g_callable_info_get_instance_ownership_transfer (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_instance_ownership_transfer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_instance_ownership_transfer"
               }"
               end

	g_callable_info_get_n_args (an_info: POINTER): INTEGER 

		-- function g_callable_info_get_n_args (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_n_args
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_n_args"
               }"
               end

	g_callable_info_get_return_attribute (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_callable_info_get_return_attribute (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_return_attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_return_attribute"
               }"
               end

	g_callable_info_get_return_type (an_info: POINTER): POINTER 

		-- function g_callable_info_get_return_type (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_get_return_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_return_type"
               }"
               end

	g_callable_info_invoke (an_info: POINTER; a_function: POINTER; an_in_args: POINTER; a_n_in_args: INTEGER; an_out_args: POINTER; a_n_out_args: INTEGER; a_return_value: POINTER; an_is_method: INTEGER; a_throws: INTEGER; an_error: POINTER): INTEGER 

		-- function g_callable_info_invoke (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_invoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_invoke"
               }"
               end

	g_callable_info_is_method (an_info: POINTER): INTEGER 

		-- function g_callable_info_is_method (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_is_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_is_method"
               }"
               end

	g_callable_info_iterate_return_attributes (an_info: POINTER; an_iterator: POINTER; a_name: POINTER; a_value: POINTER): INTEGER 

		-- function g_callable_info_iterate_return_attributes (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_iterate_return_attributes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_iterate_return_attributes"
               }"
               end

	g_callable_info_load_arg (an_info: POINTER; a_n: INTEGER; an_arg: POINTER) 

		-- function g_callable_info_load_arg (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_load_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_load_arg"
               }"
               end

	g_callable_info_load_return_type (an_info: POINTER; a_type: POINTER) 

		-- function g_callable_info_load_return_type (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_load_return_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_load_return_type"
               }"
               end

	g_callable_info_may_return_null (an_info: POINTER): INTEGER 

		-- function g_callable_info_may_return_null (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_may_return_null
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_may_return_null"
               }"
               end

	g_callable_info_skip_return (an_info: POINTER): INTEGER 

		-- function g_callable_info_skip_return (in `/usr/include/gobject-introspection-1.0/gicallableinfo.h')
               -- g_callable_info_skip_return
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_skip_return"
               }"
               end


end -- class GICALLABLEINFO_EXTERNALS
