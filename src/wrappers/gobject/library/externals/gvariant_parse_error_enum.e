-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GVARIANT_PARSE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_variant_parse_error_basic_type_expected_low_level)  or else
				(a_value = g_variant_parse_error_cannot_infer_type_low_level)  or else
				(a_value = g_variant_parse_error_definite_type_expected_low_level)  or else
				(a_value = g_variant_parse_error_failed_low_level)  or else
				(a_value = g_variant_parse_error_input_not_at_end_low_level)  or else
				(a_value = g_variant_parse_error_invalid_character_low_level)  or else
				(a_value = g_variant_parse_error_invalid_format_string_low_level)  or else
				(a_value = g_variant_parse_error_invalid_object_path_low_level)  or else
				(a_value = g_variant_parse_error_invalid_signature_low_level)  or else
				(a_value = g_variant_parse_error_invalid_type_string_low_level)  or else
				(a_value = g_variant_parse_error_no_common_type_low_level)  or else
				(a_value = g_variant_parse_error_number_out_of_range_low_level)  or else
				(a_value = g_variant_parse_error_number_too_big_low_level)  or else
				(a_value = g_variant_parse_error_type_error_low_level)  or else
				(a_value = g_variant_parse_error_unexpected_token_low_level)  or else
				(a_value = g_variant_parse_error_unknown_keyword_low_level)  or else
				(a_value = g_variant_parse_error_unterminated_string_constant_low_level)  or else
				(a_value = g_variant_parse_error_value_expected_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_variant_parse_error_basic_type_expected
		do
			value := g_variant_parse_error_basic_type_expected_low_level
		end

	set_g_variant_parse_error_cannot_infer_type
		do
			value := g_variant_parse_error_cannot_infer_type_low_level
		end

	set_g_variant_parse_error_definite_type_expected
		do
			value := g_variant_parse_error_definite_type_expected_low_level
		end

	set_g_variant_parse_error_failed
		do
			value := g_variant_parse_error_failed_low_level
		end

	set_g_variant_parse_error_input_not_at_end
		do
			value := g_variant_parse_error_input_not_at_end_low_level
		end

	set_g_variant_parse_error_invalid_character
		do
			value := g_variant_parse_error_invalid_character_low_level
		end

	set_g_variant_parse_error_invalid_format_string
		do
			value := g_variant_parse_error_invalid_format_string_low_level
		end

	set_g_variant_parse_error_invalid_object_path
		do
			value := g_variant_parse_error_invalid_object_path_low_level
		end

	set_g_variant_parse_error_invalid_signature
		do
			value := g_variant_parse_error_invalid_signature_low_level
		end

	set_g_variant_parse_error_invalid_type_string
		do
			value := g_variant_parse_error_invalid_type_string_low_level
		end

	set_g_variant_parse_error_no_common_type
		do
			value := g_variant_parse_error_no_common_type_low_level
		end

	set_g_variant_parse_error_number_out_of_range
		do
			value := g_variant_parse_error_number_out_of_range_low_level
		end

	set_g_variant_parse_error_number_too_big
		do
			value := g_variant_parse_error_number_too_big_low_level
		end

	set_g_variant_parse_error_type_error
		do
			value := g_variant_parse_error_type_error_low_level
		end

	set_g_variant_parse_error_unexpected_token
		do
			value := g_variant_parse_error_unexpected_token_low_level
		end

	set_g_variant_parse_error_unknown_keyword
		do
			value := g_variant_parse_error_unknown_keyword_low_level
		end

	set_g_variant_parse_error_unterminated_string_constant
		do
			value := g_variant_parse_error_unterminated_string_constant_low_level
		end

	set_g_variant_parse_error_value_expected
		do
			value := g_variant_parse_error_value_expected_low_level
		end

feature {ANY} -- Queries
	is_g_variant_parse_error_basic_type_expected: BOOLEAN
		do
			Result := (value=g_variant_parse_error_basic_type_expected_low_level)
		end

	is_g_variant_parse_error_cannot_infer_type: BOOLEAN
		do
			Result := (value=g_variant_parse_error_cannot_infer_type_low_level)
		end

	is_g_variant_parse_error_definite_type_expected: BOOLEAN
		do
			Result := (value=g_variant_parse_error_definite_type_expected_low_level)
		end

	is_g_variant_parse_error_failed: BOOLEAN
		do
			Result := (value=g_variant_parse_error_failed_low_level)
		end

	is_g_variant_parse_error_input_not_at_end: BOOLEAN
		do
			Result := (value=g_variant_parse_error_input_not_at_end_low_level)
		end

	is_g_variant_parse_error_invalid_character: BOOLEAN
		do
			Result := (value=g_variant_parse_error_invalid_character_low_level)
		end

	is_g_variant_parse_error_invalid_format_string: BOOLEAN
		do
			Result := (value=g_variant_parse_error_invalid_format_string_low_level)
		end

	is_g_variant_parse_error_invalid_object_path: BOOLEAN
		do
			Result := (value=g_variant_parse_error_invalid_object_path_low_level)
		end

	is_g_variant_parse_error_invalid_signature: BOOLEAN
		do
			Result := (value=g_variant_parse_error_invalid_signature_low_level)
		end

	is_g_variant_parse_error_invalid_type_string: BOOLEAN
		do
			Result := (value=g_variant_parse_error_invalid_type_string_low_level)
		end

	is_g_variant_parse_error_no_common_type: BOOLEAN
		do
			Result := (value=g_variant_parse_error_no_common_type_low_level)
		end

	is_g_variant_parse_error_number_out_of_range: BOOLEAN
		do
			Result := (value=g_variant_parse_error_number_out_of_range_low_level)
		end

	is_g_variant_parse_error_number_too_big: BOOLEAN
		do
			Result := (value=g_variant_parse_error_number_too_big_low_level)
		end

	is_g_variant_parse_error_type_error: BOOLEAN
		do
			Result := (value=g_variant_parse_error_type_error_low_level)
		end

	is_g_variant_parse_error_unexpected_token: BOOLEAN
		do
			Result := (value=g_variant_parse_error_unexpected_token_low_level)
		end

	is_g_variant_parse_error_unknown_keyword: BOOLEAN
		do
			Result := (value=g_variant_parse_error_unknown_keyword_low_level)
		end

	is_g_variant_parse_error_unterminated_string_constant: BOOLEAN
		do
			Result := (value=g_variant_parse_error_unterminated_string_constant_low_level)
		end

	is_g_variant_parse_error_value_expected: BOOLEAN
		do
			Result := (value=g_variant_parse_error_value_expected_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_variant_parse_error_basic_type_expected_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED"
 			}"
 		end

	g_variant_parse_error_cannot_infer_type_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE"
 			}"
 		end

	g_variant_parse_error_definite_type_expected_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED"
 			}"
 		end

	g_variant_parse_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_FAILED"
 			}"
 		end

	g_variant_parse_error_input_not_at_end_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END"
 			}"
 		end

	g_variant_parse_error_invalid_character_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_CHARACTER"
 			}"
 		end

	g_variant_parse_error_invalid_format_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING"
 			}"
 		end

	g_variant_parse_error_invalid_object_path_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH"
 			}"
 		end

	g_variant_parse_error_invalid_signature_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE"
 			}"
 		end

	g_variant_parse_error_invalid_type_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING"
 			}"
 		end

	g_variant_parse_error_no_common_type_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE"
 			}"
 		end

	g_variant_parse_error_number_out_of_range_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE"
 			}"
 		end

	g_variant_parse_error_number_too_big_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG"
 			}"
 		end

	g_variant_parse_error_type_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_TYPE_ERROR"
 			}"
 		end

	g_variant_parse_error_unexpected_token_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN"
 			}"
 		end

	g_variant_parse_error_unknown_keyword_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD"
 			}"
 		end

	g_variant_parse_error_unterminated_string_constant_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT"
 			}"
 		end

	g_variant_parse_error_value_expected_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_VALUE_EXPECTED"
 			}"
 		end


end -- class GVARIANT_PARSE_ERROR_ENUM
