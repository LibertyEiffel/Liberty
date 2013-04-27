-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSETTINGS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_rc_property_parse_border (a_pspec: POINTER; a_gstring: POINTER; a_property_value: POINTER): INTEGER is
 		-- gtk_rc_property_parse_border
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_parse_border"
		}"
		end

	gtk_rc_property_parse_color (a_pspec: POINTER; a_gstring: POINTER; a_property_value: POINTER): INTEGER is
 		-- gtk_rc_property_parse_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_parse_color"
		}"
		end

	gtk_rc_property_parse_enum (a_pspec: POINTER; a_gstring: POINTER; a_property_value: POINTER): INTEGER is
 		-- gtk_rc_property_parse_enum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_parse_enum"
		}"
		end

	gtk_rc_property_parse_flags (a_pspec: POINTER; a_gstring: POINTER; a_property_value: POINTER): INTEGER is
 		-- gtk_rc_property_parse_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_parse_flags"
		}"
		end

	gtk_rc_property_parse_requisition (a_pspec: POINTER; a_gstring: POINTER; a_property_value: POINTER): INTEGER is
 		-- gtk_rc_property_parse_requisition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_parse_requisition"
		}"
		end

	-- `hidden' function _gtk_rc_property_parser_from_type skipped.
	gtk_settings_get_default: POINTER is
 		-- gtk_settings_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_get_default()"
		}"
		end

	gtk_settings_get_for_screen (a_screen: POINTER): POINTER is
 		-- gtk_settings_get_for_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_get_for_screen"
		}"
		end

	gtk_settings_get_type: like long_unsigned is
 		-- gtk_settings_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_get_type()"
		}"
		end

	-- `hidden' function _gtk_settings_handle_event skipped.
	gtk_settings_install_property (a_pspec: POINTER) is
 		-- gtk_settings_install_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_install_property"
		}"
		end

	gtk_settings_install_property_parser (a_pspec: POINTER; a_parser: POINTER) is
 		-- gtk_settings_install_property_parser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_install_property_parser"
		}"
		end

	-- `hidden' function _gtk_settings_parse_convert skipped.
	-- `hidden' function _gtk_settings_reset_rc_values skipped.
	gtk_settings_set_double_property (a_settings: POINTER; a_name: POINTER; a_v_double: REAL; an_origin: POINTER) is
 		-- gtk_settings_set_double_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_set_double_property"
		}"
		end

	gtk_settings_set_long_property (a_settings: POINTER; a_name: POINTER; a_v_long: like long; an_origin: POINTER) is
 		-- gtk_settings_set_long_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_set_long_property"
		}"
		end

	gtk_settings_set_property_value (a_settings: POINTER; a_name: POINTER; a_svalue: POINTER) is
 		-- gtk_settings_set_property_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_set_property_value"
		}"
		end

	-- `hidden' function _gtk_settings_set_property_value_from_rc skipped.
	gtk_settings_set_string_property (a_settings: POINTER; a_name: POINTER; a_v_string: POINTER; an_origin: POINTER) is
 		-- gtk_settings_set_string_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_set_string_property"
		}"
		end


end -- class GTKSETTINGS_EXTERNALS
