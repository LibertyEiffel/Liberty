-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBOOKMARK_FILE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_bookmark_file_error_app_not_registered_low_level)  or else
				(a_value = g_bookmark_file_error_file_not_found_low_level)  or else
				(a_value = g_bookmark_file_error_invalid_uri_low_level)  or else
				(a_value = g_bookmark_file_error_invalid_value_low_level)  or else
				(a_value = g_bookmark_file_error_read_low_level)  or else
				(a_value = g_bookmark_file_error_unknown_encoding_low_level)  or else
				(a_value = g_bookmark_file_error_uri_not_found_low_level)  or else
				(a_value = g_bookmark_file_error_write_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_bookmark_file_error_app_not_registered
		do
			value := g_bookmark_file_error_app_not_registered_low_level
		end

	set_g_bookmark_file_error_file_not_found
		do
			value := g_bookmark_file_error_file_not_found_low_level
		end

	set_g_bookmark_file_error_invalid_uri
		do
			value := g_bookmark_file_error_invalid_uri_low_level
		end

	set_g_bookmark_file_error_invalid_value
		do
			value := g_bookmark_file_error_invalid_value_low_level
		end

	set_g_bookmark_file_error_read
		do
			value := g_bookmark_file_error_read_low_level
		end

	set_g_bookmark_file_error_unknown_encoding
		do
			value := g_bookmark_file_error_unknown_encoding_low_level
		end

	set_g_bookmark_file_error_uri_not_found
		do
			value := g_bookmark_file_error_uri_not_found_low_level
		end

	set_g_bookmark_file_error_write
		do
			value := g_bookmark_file_error_write_low_level
		end

feature {ANY} -- Queries
	is_g_bookmark_file_error_app_not_registered: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_app_not_registered_low_level)
		end

	is_g_bookmark_file_error_file_not_found: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_file_not_found_low_level)
		end

	is_g_bookmark_file_error_invalid_uri: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_invalid_uri_low_level)
		end

	is_g_bookmark_file_error_invalid_value: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_invalid_value_low_level)
		end

	is_g_bookmark_file_error_read: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_read_low_level)
		end

	is_g_bookmark_file_error_unknown_encoding: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_unknown_encoding_low_level)
		end

	is_g_bookmark_file_error_uri_not_found: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_uri_not_found_low_level)
		end

	is_g_bookmark_file_error_write: BOOLEAN
		do
			Result := (value=g_bookmark_file_error_write_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_bookmark_file_error_app_not_registered_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED"
 			}"
 		end

	g_bookmark_file_error_file_not_found_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND"
 			}"
 		end

	g_bookmark_file_error_invalid_uri_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_URI"
 			}"
 		end

	g_bookmark_file_error_invalid_value_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_VALUE"
 			}"
 		end

	g_bookmark_file_error_read_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_READ"
 			}"
 		end

	g_bookmark_file_error_unknown_encoding_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING"
 			}"
 		end

	g_bookmark_file_error_uri_not_found_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND"
 			}"
 		end

	g_bookmark_file_error_write_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_WRITE"
 			}"
 		end


end -- class GBOOKMARK_FILE_ERROR_ENUM
