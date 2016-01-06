-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GICALLABLEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_callable_info_can_throw_gerror (an_info: POINTER): INTEGER 
               -- g_callable_info_can_throw_gerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_can_throw_gerror"
               }"
               end

	g_callable_info_get_arg (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_callable_info_get_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_arg"
               }"
               end

	g_callable_info_get_caller_owns (an_info: POINTER): INTEGER 
               -- g_callable_info_get_caller_owns
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_caller_owns"
               }"
               end

	g_callable_info_get_instance_ownership_transfer (an_info: POINTER): INTEGER 
               -- g_callable_info_get_instance_ownership_transfer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_instance_ownership_transfer"
               }"
               end

	g_callable_info_get_n_args (an_info: POINTER): INTEGER 
               -- g_callable_info_get_n_args
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_n_args"
               }"
               end

	g_callable_info_get_return_attribute (an_info: POINTER; a_name: POINTER): POINTER 
               -- g_callable_info_get_return_attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_return_attribute"
               }"
               end

	g_callable_info_get_return_type (an_info: POINTER): POINTER 
               -- g_callable_info_get_return_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_get_return_type"
               }"
               end

	g_callable_info_invoke (an_info: POINTER; a_function: POINTER; an_in_args: POINTER; a_n_in_args: INTEGER; an_out_args: POINTER; a_n_out_args: INTEGER; a_return_value: POINTER; an_is_method: INTEGER; a_throws: INTEGER; an_error: POINTER): INTEGER 
               -- g_callable_info_invoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_invoke"
               }"
               end

	g_callable_info_is_method (an_info: POINTER): INTEGER 
               -- g_callable_info_is_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_is_method"
               }"
               end

	g_callable_info_iterate_return_attributes (an_info: POINTER; an_iterator: POINTER; a_name: POINTER; a_value: POINTER): INTEGER 
               -- g_callable_info_iterate_return_attributes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_iterate_return_attributes"
               }"
               end

	g_callable_info_load_arg (an_info: POINTER; a_n: INTEGER; an_arg: POINTER) 
               -- g_callable_info_load_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_load_arg"
               }"
               end

	g_callable_info_load_return_type (an_info: POINTER; a_type: POINTER) 
               -- g_callable_info_load_return_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_load_return_type"
               }"
               end

	g_callable_info_may_return_null (an_info: POINTER): INTEGER 
               -- g_callable_info_may_return_null
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_may_return_null"
               }"
               end

	g_callable_info_skip_return (an_info: POINTER): INTEGER 
               -- g_callable_info_skip_return
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_skip_return"
               }"
               end


end -- class GICALLABLEINFO_EXTERNALS
