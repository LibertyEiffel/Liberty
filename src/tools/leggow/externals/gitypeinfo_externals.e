-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GITYPEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_info_type_to_string (a_type: INTEGER): POINTER 

		-- function g_info_type_to_string (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_info_type_to_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_info_type_to_string"
               }"
               end

	g_type_info_get_array_fixed_size (an_info: POINTER): INTEGER 

		-- function g_type_info_get_array_fixed_size (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_array_fixed_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_array_fixed_size"
               }"
               end

	g_type_info_get_array_length (an_info: POINTER): INTEGER 

		-- function g_type_info_get_array_length (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_array_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_array_length"
               }"
               end

	g_type_info_get_array_type (an_info: POINTER): INTEGER 

		-- function g_type_info_get_array_type (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_array_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_array_type"
               }"
               end

	g_type_info_get_interface (an_info: POINTER): POINTER 

		-- function g_type_info_get_interface (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_interface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_interface"
               }"
               end

	g_type_info_get_param_type (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_type_info_get_param_type (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_param_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_param_type"
               }"
               end

	g_type_info_get_tag (an_info: POINTER): INTEGER 

		-- function g_type_info_get_tag (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_get_tag
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_tag"
               }"
               end

	g_type_info_is_pointer (an_info: POINTER): INTEGER 

		-- function g_type_info_is_pointer (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_is_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_is_pointer"
               }"
               end

	g_type_info_is_zero_terminated (an_info: POINTER): INTEGER 

		-- function g_type_info_is_zero_terminated (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_info_is_zero_terminated
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_is_zero_terminated"
               }"
               end

	g_type_tag_to_string (a_type: INTEGER): POINTER 

		-- function g_type_tag_to_string (in `/usr/include/gobject-introspection-1.0/gitypeinfo.h')
               -- g_type_tag_to_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_tag_to_string"
               }"
               end


end -- class GITYPEINFO_EXTERNALS
