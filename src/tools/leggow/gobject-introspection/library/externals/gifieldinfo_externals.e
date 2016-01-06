-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIFIELDINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_field_info_get_field (a_field_info: POINTER; a_mem: POINTER; a_value: POINTER): INTEGER 
               -- g_field_info_get_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_get_field"
               }"
               end

	g_field_info_get_flags (an_info: POINTER): INTEGER 
               -- g_field_info_get_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_get_flags"
               }"
               end

	g_field_info_get_offset (an_info: POINTER): INTEGER 
               -- g_field_info_get_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_get_offset"
               }"
               end

	g_field_info_get_size (an_info: POINTER): INTEGER 
               -- g_field_info_get_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_get_size"
               }"
               end

	g_field_info_get_type (an_info: POINTER): POINTER 
               -- g_field_info_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_get_type"
               }"
               end

	g_field_info_set_field (a_field_info: POINTER; a_mem: POINTER; a_value: POINTER): INTEGER 
               -- g_field_info_set_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_field_info_set_field"
               }"
               end


end -- class GIFIELDINFO_EXTERNALS
