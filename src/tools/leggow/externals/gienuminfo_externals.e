-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIENUMINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_enum_info_get_error_domain (an_info: POINTER): POINTER 
               -- g_enum_info_get_error_domain
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_error_domain"
               }"
               end

	g_enum_info_get_method (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_enum_info_get_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_method"
               }"
               end

	g_enum_info_get_n_methods (an_info: POINTER): INTEGER 
               -- g_enum_info_get_n_methods
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_n_methods"
               }"
               end

	g_enum_info_get_n_values (an_info: POINTER): INTEGER 
               -- g_enum_info_get_n_values
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_n_values"
               }"
               end

	g_enum_info_get_storage_type (an_info: POINTER): INTEGER 
               -- g_enum_info_get_storage_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_storage_type"
               }"
               end

	g_enum_info_get_value (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_enum_info_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_info_get_value"
               }"
               end

	g_value_info_get_value (an_info: POINTER): like long 
               -- g_value_info_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_info_get_value"
               }"
               end


end -- class GIENUMINFO_EXTERNALS
