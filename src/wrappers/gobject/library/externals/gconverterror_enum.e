-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERTERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_convert_error_bad_uri_low_level)  or else
				(a_value = g_convert_error_failed_low_level)  or else
				(a_value = g_convert_error_illegal_sequence_low_level)  or else
				(a_value = g_convert_error_no_conversion_low_level)  or else
				(a_value = g_convert_error_not_absolute_path_low_level)  or else
				(a_value = g_convert_error_partial_input_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_convert_error_bad_uri is
		do
			value := g_convert_error_bad_uri_low_level
		end

	set_g_convert_error_failed is
		do
			value := g_convert_error_failed_low_level
		end

	set_g_convert_error_illegal_sequence is
		do
			value := g_convert_error_illegal_sequence_low_level
		end

	set_g_convert_error_no_conversion is
		do
			value := g_convert_error_no_conversion_low_level
		end

	set_g_convert_error_not_absolute_path is
		do
			value := g_convert_error_not_absolute_path_low_level
		end

	set_g_convert_error_partial_input is
		do
			value := g_convert_error_partial_input_low_level
		end

feature {ANY} -- Queries
	is_g_convert_error_bad_uri: BOOLEAN is
		do
			Result := (value=g_convert_error_bad_uri_low_level)
		end

	is_g_convert_error_failed: BOOLEAN is
		do
			Result := (value=g_convert_error_failed_low_level)
		end

	is_g_convert_error_illegal_sequence: BOOLEAN is
		do
			Result := (value=g_convert_error_illegal_sequence_low_level)
		end

	is_g_convert_error_no_conversion: BOOLEAN is
		do
			Result := (value=g_convert_error_no_conversion_low_level)
		end

	is_g_convert_error_not_absolute_path: BOOLEAN is
		do
			Result := (value=g_convert_error_not_absolute_path_low_level)
		end

	is_g_convert_error_partial_input: BOOLEAN is
		do
			Result := (value=g_convert_error_partial_input_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_convert_error_bad_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_BAD_URI"
 			}"
 		end

	g_convert_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_FAILED"
 			}"
 		end

	g_convert_error_illegal_sequence_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_ILLEGAL_SEQUENCE"
 			}"
 		end

	g_convert_error_no_conversion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NO_CONVERSION"
 			}"
 		end

	g_convert_error_not_absolute_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
 			}"
 		end

	g_convert_error_partial_input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_PARTIAL_INPUT"
 			}"
 		end


end -- class GCONVERTERROR_ENUM
