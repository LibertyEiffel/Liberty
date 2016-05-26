-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIARGINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_arg_info_get_closure (an_info: POINTER): INTEGER 

		-- function g_arg_info_get_closure (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_closure"
               }"
               end

	g_arg_info_get_destroy (an_info: POINTER): INTEGER 

		-- function g_arg_info_get_destroy (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_destroy"
               }"
               end

	g_arg_info_get_direction (an_info: POINTER): INTEGER 

		-- function g_arg_info_get_direction (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_direction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_direction"
               }"
               end

	g_arg_info_get_ownership_transfer (an_info: POINTER): INTEGER 

		-- function g_arg_info_get_ownership_transfer (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_ownership_transfer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_ownership_transfer"
               }"
               end

	g_arg_info_get_scope (an_info: POINTER): INTEGER 

		-- function g_arg_info_get_scope (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_scope
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_scope"
               }"
               end

	g_arg_info_get_type (an_info: POINTER): POINTER 

		-- function g_arg_info_get_type (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_get_type"
               }"
               end

	g_arg_info_is_caller_allocates (an_info: POINTER): INTEGER 

		-- function g_arg_info_is_caller_allocates (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_is_caller_allocates
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_is_caller_allocates"
               }"
               end

	g_arg_info_is_optional (an_info: POINTER): INTEGER 

		-- function g_arg_info_is_optional (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_is_optional
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_is_optional"
               }"
               end

	g_arg_info_is_return_value (an_info: POINTER): INTEGER 

		-- function g_arg_info_is_return_value (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_is_return_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_is_return_value"
               }"
               end

	g_arg_info_is_skip (an_info: POINTER): INTEGER 

		-- function g_arg_info_is_skip (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_is_skip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_is_skip"
               }"
               end

	g_arg_info_load_type (an_info: POINTER; a_type: POINTER) 

		-- function g_arg_info_load_type (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_load_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_load_type"
               }"
               end

	g_arg_info_may_be_null (an_info: POINTER): INTEGER 

		-- function g_arg_info_may_be_null (in `/usr/include/gobject-introspection-1.0/giarginfo.h')
               -- g_arg_info_may_be_null
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_arg_info_may_be_null"
               }"
               end


end -- class GIARGINFO_EXTERNALS
