-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GKEYFILEERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_key_file_error_group_not_found_low_level)  or else
				(a_value = g_key_file_error_invalid_value_low_level)  or else
				(a_value = g_key_file_error_key_not_found_low_level)  or else
				(a_value = g_key_file_error_not_found_low_level)  or else
				(a_value = g_key_file_error_parse_low_level)  or else
				(a_value = g_key_file_error_unknown_encoding_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_key_file_error_group_not_found is
		do
			value := g_key_file_error_group_not_found_low_level
		end

	set_g_key_file_error_invalid_value is
		do
			value := g_key_file_error_invalid_value_low_level
		end

	set_g_key_file_error_key_not_found is
		do
			value := g_key_file_error_key_not_found_low_level
		end

	set_g_key_file_error_not_found is
		do
			value := g_key_file_error_not_found_low_level
		end

	set_g_key_file_error_parse is
		do
			value := g_key_file_error_parse_low_level
		end

	set_g_key_file_error_unknown_encoding is
		do
			value := g_key_file_error_unknown_encoding_low_level
		end

feature {ANY} -- Queries
	is_g_key_file_error_group_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_group_not_found_low_level)
		end

	is_g_key_file_error_invalid_value: BOOLEAN is
		do
			Result := (value=g_key_file_error_invalid_value_low_level)
		end

	is_g_key_file_error_key_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_key_not_found_low_level)
		end

	is_g_key_file_error_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_not_found_low_level)
		end

	is_g_key_file_error_parse: BOOLEAN is
		do
			Result := (value=g_key_file_error_parse_low_level)
		end

	is_g_key_file_error_unknown_encoding: BOOLEAN is
		do
			Result := (value=g_key_file_error_unknown_encoding_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_error_group_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_GROUP_NOT_FOUND"
 			}"
 		end

	g_key_file_error_invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_INVALID_VALUE"
 			}"
 		end

	g_key_file_error_key_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_KEY_NOT_FOUND"
 			}"
 		end

	g_key_file_error_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_NOT_FOUND"
 			}"
 		end

	g_key_file_error_parse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_PARSE"
 			}"
 		end

	g_key_file_error_unknown_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_UNKNOWN_ENCODING"
 			}"
 		end


end -- class GKEYFILEERROR_ENUM
