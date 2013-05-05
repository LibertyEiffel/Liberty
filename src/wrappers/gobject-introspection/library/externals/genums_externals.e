-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GENUMS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_enum_complete_type_info (a_g_enum_type: like long_unsigned; an_info: POINTER; a_const_values: POINTER) is
 		-- g_enum_complete_type_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_complete_type_info"
		}"
		end

	g_enum_get_value (an_enum_class: POINTER; a_value: INTEGER): POINTER is
 		-- g_enum_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value"
		}"
		end

	g_enum_get_value_by_name (an_enum_class: POINTER; a_name: POINTER): POINTER is
 		-- g_enum_get_value_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value_by_name"
		}"
		end

	g_enum_get_value_by_nick (an_enum_class: POINTER; a_nick: POINTER): POINTER is
 		-- g_enum_get_value_by_nick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_get_value_by_nick"
		}"
		end

	g_enum_register_static (a_name: POINTER; a_const_static_values: POINTER): like long_unsigned is
 		-- g_enum_register_static
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_enum_register_static"
		}"
		end

	g_flags_complete_type_info (a_g_flags_type: like long_unsigned; an_info: POINTER; a_const_values: POINTER) is
 		-- g_flags_complete_type_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_complete_type_info"
		}"
		end

	g_flags_get_first_value (a_flags_class: POINTER; a_value: NATURAL): POINTER is
 		-- g_flags_get_first_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_first_value"
		}"
		end

	g_flags_get_value_by_name (a_flags_class: POINTER; a_name: POINTER): POINTER is
 		-- g_flags_get_value_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_value_by_name"
		}"
		end

	g_flags_get_value_by_nick (a_flags_class: POINTER; a_nick: POINTER): POINTER is
 		-- g_flags_get_value_by_nick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_get_value_by_nick"
		}"
		end

	g_flags_register_static (a_name: POINTER; a_const_static_values: POINTER): like long_unsigned is
 		-- g_flags_register_static
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_flags_register_static"
		}"
		end

	g_value_get_enum (a_value: POINTER): INTEGER is
 		-- g_value_get_enum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_enum"
		}"
		end

	g_value_get_flags (a_value: POINTER): NATURAL is
 		-- g_value_get_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_flags"
		}"
		end

	g_value_set_enum (a_value: POINTER; a_v_enum: INTEGER) is
 		-- g_value_set_enum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_enum"
		}"
		end

	g_value_set_flags (a_value: POINTER; a_v_flags: NATURAL) is
 		-- g_value_set_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_flags"
		}"
		end


end -- class GENUMS_EXTERNALS
