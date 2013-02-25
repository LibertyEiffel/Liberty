-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GENUMS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_enum_get_value (an_enum_class: POINTER; a_value: INTEGER_32): POINTER is
 		-- g_enum_get_value (node at line 524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value"
		}"
		end

	g_flags_get_first_value (a_flags_class: POINTER; a_value: NATURAL_32): POINTER is
 		-- g_flags_get_first_value (node at line 1088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_first_value"
		}"
		end

	g_value_set_flags (a_value: POINTER; a_v_flags: NATURAL_32) is
 		-- g_value_set_flags (node at line 1292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_flags"
		}"
		end

	g_enum_complete_type_info (a_g_enum_type: NATURAL_32; an_info: POINTER; a_const_values: POINTER) is
 		-- g_enum_complete_type_info (node at line 1793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_complete_type_info"
		}"
		end

	g_flags_get_value_by_name (a_flags_class: POINTER; a_name: POINTER): POINTER is
 		-- g_flags_get_value_by_name (node at line 2400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_value_by_name"
		}"
		end

	g_flags_get_value_by_nick (a_flags_class: POINTER; a_nick: POINTER): POINTER is
 		-- g_flags_get_value_by_nick (node at line 3738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_value_by_nick"
		}"
		end

	g_enum_get_value_by_name (an_enum_class: POINTER; a_name: POINTER): POINTER is
 		-- g_enum_get_value_by_name (node at line 4220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value_by_name"
		}"
		end

	g_value_set_enum (a_value: POINTER; a_v_enum: INTEGER_32) is
 		-- g_value_set_enum (node at line 5372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_enum"
		}"
		end

	g_enum_get_value_by_nick (an_enum_class: POINTER; a_nick: POINTER): POINTER is
 		-- g_enum_get_value_by_nick (node at line 6021)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value_by_nick"
		}"
		end

	g_value_get_enum (a_value: POINTER): INTEGER_32 is
 		-- g_value_get_enum (node at line 6943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_enum"
		}"
		end

	g_value_get_flags (a_value: POINTER): NATURAL_32 is
 		-- g_value_get_flags (node at line 7006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_flags"
		}"
		end

	g_enum_register_static (a_name: POINTER; a_const_static_values: POINTER): NATURAL_32 is
 		-- g_enum_register_static (node at line 7127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_register_static"
		}"
		end

	g_flags_complete_type_info (a_g_flags_type: NATURAL_32; an_info: POINTER; a_const_values: POINTER) is
 		-- g_flags_complete_type_info (node at line 7565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_complete_type_info"
		}"
		end

	g_flags_register_static (a_name: POINTER; a_const_static_values: POINTER): NATURAL_32 is
 		-- g_flags_register_static (node at line 8203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_register_static"
		}"
		end


end -- class GENUMS_EXTERNALS
