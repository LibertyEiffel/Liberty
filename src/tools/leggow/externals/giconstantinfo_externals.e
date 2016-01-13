-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GICONSTANTINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_constant_info_free_value (an_info: POINTER; a_value: POINTER) 
               -- g_constant_info_free_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_free_value"
               }"
               end

	g_constant_info_get_type (an_info: POINTER): POINTER 
               -- g_constant_info_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_get_type"
               }"
               end

	g_constant_info_get_value (an_info: POINTER; a_value: POINTER): INTEGER 
               -- g_constant_info_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_constant_info_get_value"
               }"
               end


end -- class GICONSTANTINFO_EXTERNALS
