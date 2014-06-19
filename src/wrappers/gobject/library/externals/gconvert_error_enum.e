-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERT_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_convert_error_bad_uri
		do
			value := g_convert_error_bad_uri_low_level
		end

	set_g_convert_error_failed
		do
			value := g_convert_error_failed_low_level
		end

	set_g_convert_error_illegal_sequence
		do
			value := g_convert_error_illegal_sequence_low_level
		end

	set_g_convert_error_no_conversion
		do
			value := g_convert_error_no_conversion_low_level
		end

	set_g_convert_error_not_absolute_path
		do
			value := g_convert_error_not_absolute_path_low_level
		end

	set_g_convert_error_partial_input
		do
			value := g_convert_error_partial_input_low_level
		end

feature {ANY} -- Queries
	is_g_convert_error_bad_uri: BOOLEAN
		do
			Result := (value=g_convert_error_bad_uri_low_level)
		end

	is_g_convert_error_failed: BOOLEAN
		do
			Result := (value=g_convert_error_failed_low_level)
		end

	is_g_convert_error_illegal_sequence: BOOLEAN
		do
			Result := (value=g_convert_error_illegal_sequence_low_level)
		end

	is_g_convert_error_no_conversion: BOOLEAN
		do
			Result := (value=g_convert_error_no_conversion_low_level)
		end

	is_g_convert_error_not_absolute_path: BOOLEAN
		do
			Result := (value=g_convert_error_not_absolute_path_low_level)
		end

	is_g_convert_error_partial_input: BOOLEAN
		do
			Result := (value=g_convert_error_partial_input_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_convert_error_bad_uri_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_BAD_URI"
 			}"
 		end

	g_convert_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_FAILED"
 			}"
 		end

	g_convert_error_illegal_sequence_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_ILLEGAL_SEQUENCE"
 			}"
 		end

	g_convert_error_no_conversion_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NO_CONVERSION"
 			}"
 		end

	g_convert_error_not_absolute_path_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
 			}"
 		end

	g_convert_error_partial_input_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_PARTIAL_INPUT"
 			}"
 		end


end -- class GCONVERT_ERROR_ENUM
