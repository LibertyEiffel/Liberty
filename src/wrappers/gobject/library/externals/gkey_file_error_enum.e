-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GKEY_FILE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_key_file_error_group_not_found
		do
			value := g_key_file_error_group_not_found_low_level
		end

	set_g_key_file_error_invalid_value
		do
			value := g_key_file_error_invalid_value_low_level
		end

	set_g_key_file_error_key_not_found
		do
			value := g_key_file_error_key_not_found_low_level
		end

	set_g_key_file_error_not_found
		do
			value := g_key_file_error_not_found_low_level
		end

	set_g_key_file_error_parse
		do
			value := g_key_file_error_parse_low_level
		end

	set_g_key_file_error_unknown_encoding
		do
			value := g_key_file_error_unknown_encoding_low_level
		end

feature {ANY} -- Queries
	is_g_key_file_error_group_not_found: BOOLEAN
		do
			Result := (value=g_key_file_error_group_not_found_low_level)
		end

	is_g_key_file_error_invalid_value: BOOLEAN
		do
			Result := (value=g_key_file_error_invalid_value_low_level)
		end

	is_g_key_file_error_key_not_found: BOOLEAN
		do
			Result := (value=g_key_file_error_key_not_found_low_level)
		end

	is_g_key_file_error_not_found: BOOLEAN
		do
			Result := (value=g_key_file_error_not_found_low_level)
		end

	is_g_key_file_error_parse: BOOLEAN
		do
			Result := (value=g_key_file_error_parse_low_level)
		end

	is_g_key_file_error_unknown_encoding: BOOLEAN
		do
			Result := (value=g_key_file_error_unknown_encoding_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_error_group_not_found_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_GROUP_NOT_FOUND"
 			}"
 		end

	g_key_file_error_invalid_value_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_INVALID_VALUE"
 			}"
 		end

	g_key_file_error_key_not_found_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_KEY_NOT_FOUND"
 			}"
 		end

	g_key_file_error_not_found_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_NOT_FOUND"
 			}"
 		end

	g_key_file_error_parse_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_PARSE"
 			}"
 		end

	g_key_file_error_unknown_encoding_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_UNKNOWN_ENCODING"
 			}"
 		end


end -- class GKEY_FILE_ERROR_ENUM
