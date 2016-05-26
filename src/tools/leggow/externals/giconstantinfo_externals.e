-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GICONSTANTINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_constant_info_free_value (an_info: POINTER; a_value: POINTER) 

		-- function g_constant_info_free_value (in `/usr/include/gobject-introspection-1.0/giconstantinfo.h')
               -- g_constant_info_free_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_free_value"
               }"
               end

	g_constant_info_get_type (an_info: POINTER): POINTER 

		-- function g_constant_info_get_type (in `/usr/include/gobject-introspection-1.0/giconstantinfo.h')
               -- g_constant_info_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_get_type"
               }"
               end

	g_constant_info_get_value (an_info: POINTER; a_value: POINTER): INTEGER 

		-- function g_constant_info_get_value (in `/usr/include/gobject-introspection-1.0/giconstantinfo.h')
               -- g_constant_info_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_get_value"
               }"
               end


end -- class GICONSTANTINFO_EXTERNALS
