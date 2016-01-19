-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GVARIANT_PARSE_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_variant_parse_error_basic_type_expected is
		do
			value := g_variant_parse_error_basic_type_expected_low_level
		end

	set_g_variant_parse_error_cannot_infer_type is
		do
			value := g_variant_parse_error_cannot_infer_type_low_level
		end

	set_g_variant_parse_error_definite_type_expected is
		do
			value := g_variant_parse_error_definite_type_expected_low_level
		end

	set_g_variant_parse_error_failed is
		do
			value := g_variant_parse_error_failed_low_level
		end

	set_g_variant_parse_error_input_not_at_end is
		do
			value := g_variant_parse_error_input_not_at_end_low_level
		end

	set_g_variant_parse_error_invalid_character is
		do
			value := g_variant_parse_error_invalid_character_low_level
		end

	set_g_variant_parse_error_invalid_format_string is
		do
			value := g_variant_parse_error_invalid_format_string_low_level
		end

	set_g_variant_parse_error_invalid_object_path is
		do
			value := g_variant_parse_error_invalid_object_path_low_level
		end

	set_g_variant_parse_error_invalid_signature is
		do
			value := g_variant_parse_error_invalid_signature_low_level
		end

	set_g_variant_parse_error_invalid_type_string is
		do
			value := g_variant_parse_error_invalid_type_string_low_level
		end

	set_g_variant_parse_error_no_common_type is
		do
			value := g_variant_parse_error_no_common_type_low_level
		end

	set_g_variant_parse_error_number_out_of_range is
		do
			value := g_variant_parse_error_number_out_of_range_low_level
		end

	set_g_variant_parse_error_number_too_big is
		do
			value := g_variant_parse_error_number_too_big_low_level
		end

	set_g_variant_parse_error_type_error is
		do
			value := g_variant_parse_error_type_error_low_level
		end

	set_g_variant_parse_error_unexpected_token is
		do
			value := g_variant_parse_error_unexpected_token_low_level
		end

	set_g_variant_parse_error_unknown_keyword is
		do
			value := g_variant_parse_error_unknown_keyword_low_level
		end

	set_g_variant_parse_error_unterminated_string_constant is
		do
			value := g_variant_parse_error_unterminated_string_constant_low_level
		end

	set_g_variant_parse_error_value_expected is
		do
			value := g_variant_parse_error_value_expected_low_level
		end

feature -- Queries
	is_g_variant_parse_error_basic_type_expected: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_basic_type_expected_low_level)
		end

	is_g_variant_parse_error_cannot_infer_type: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_cannot_infer_type_low_level)
		end

	is_g_variant_parse_error_definite_type_expected: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_definite_type_expected_low_level)
		end

	is_g_variant_parse_error_failed: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_failed_low_level)
		end

	is_g_variant_parse_error_input_not_at_end: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_input_not_at_end_low_level)
		end

	is_g_variant_parse_error_invalid_character: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_invalid_character_low_level)
		end

	is_g_variant_parse_error_invalid_format_string: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_invalid_format_string_low_level)
		end

	is_g_variant_parse_error_invalid_object_path: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_invalid_object_path_low_level)
		end

	is_g_variant_parse_error_invalid_signature: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_invalid_signature_low_level)
		end

	is_g_variant_parse_error_invalid_type_string: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_invalid_type_string_low_level)
		end

	is_g_variant_parse_error_no_common_type: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_no_common_type_low_level)
		end

	is_g_variant_parse_error_number_out_of_range: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_number_out_of_range_low_level)
		end

	is_g_variant_parse_error_number_too_big: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_number_too_big_low_level)
		end

	is_g_variant_parse_error_type_error: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_type_error_low_level)
		end

	is_g_variant_parse_error_unexpected_token: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_unexpected_token_low_level)
		end

	is_g_variant_parse_error_unknown_keyword: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_unknown_keyword_low_level)
		end

	is_g_variant_parse_error_unterminated_string_constant: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_unterminated_string_constant_low_level)
		end

	is_g_variant_parse_error_value_expected: BOOLEAN is
		do
			Result := (value=g_variant_parse_error_value_expected_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_variant_parse_error_basic_type_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED"
 			}"
 		end

	g_variant_parse_error_cannot_infer_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE"
 			}"
 		end

	g_variant_parse_error_definite_type_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED"
 			}"
 		end

	g_variant_parse_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_FAILED"
 			}"
 		end

	g_variant_parse_error_input_not_at_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END"
 			}"
 		end

	g_variant_parse_error_invalid_character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_CHARACTER"
 			}"
 		end

	g_variant_parse_error_invalid_format_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING"
 			}"
 		end

	g_variant_parse_error_invalid_object_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH"
 			}"
 		end

	g_variant_parse_error_invalid_signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE"
 			}"
 		end

	g_variant_parse_error_invalid_type_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING"
 			}"
 		end

	g_variant_parse_error_no_common_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE"
 			}"
 		end

	g_variant_parse_error_number_out_of_range_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE"
 			}"
 		end

	g_variant_parse_error_number_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG"
 			}"
 		end

	g_variant_parse_error_type_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_TYPE_ERROR"
 			}"
 		end

	g_variant_parse_error_unexpected_token_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN"
 			}"
 		end

	g_variant_parse_error_unknown_keyword_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD"
 			}"
 		end

	g_variant_parse_error_unterminated_string_constant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT"
 			}"
 		end

	g_variant_parse_error_value_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_PARSE_ERROR_VALUE_EXPECTED"
 			}"
 		end


end -- class GVARIANT_PARSE_ERROR_ENUM
