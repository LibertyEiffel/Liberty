-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_KEY_FILE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_key_file_error_unknown_encoding) or else 
				(a_value = g_key_file_error_parse) or else 
				(a_value = g_key_file_error_not_found) or else 
				(a_value = g_key_file_error_key_not_found) or else 
				(a_value = g_key_file_error_group_not_found) or else 
				(a_value = g_key_file_error_invalid_value))
		end


feature {ANY} -- Setters
	default_create, set_unknown_encoding is
		do
			value := g_key_file_error_unknown_encoding
		end

	set_parse is
		do
			value := g_key_file_error_parse
		end

	set_not_found is
		do
			value := g_key_file_error_not_found
		end

	set_key_not_found is
		do
			value := g_key_file_error_key_not_found
		end

	set_group_not_found is
		do
			value := g_key_file_error_group_not_found
		end

	set_invalid_value is
		do
			value := g_key_file_error_invalid_value
		end


feature {ANY} -- Queries
	is_unknown_encoding: BOOLEAN is
		do
			Result := (value=g_key_file_error_unknown_encoding)
		end

	is_parse: BOOLEAN is
		do
			Result := (value=g_key_file_error_parse)
		end

	is_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_not_found)
		end

	is_key_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_key_not_found)
		end

	is_group_not_found: BOOLEAN is
		do
			Result := (value=g_key_file_error_group_not_found)
		end

	is_invalid_value: BOOLEAN is
		do
			Result := (value=g_key_file_error_invalid_value)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_error_unknown_encoding: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_UNKNOWN_ENCODING"
		end

	g_key_file_error_parse: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_PARSE"
		end

	g_key_file_error_not_found: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_NOT_FOUND"
		end

	g_key_file_error_key_not_found: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_KEY_NOT_FOUND"
		end

	g_key_file_error_group_not_found: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_GROUP_NOT_FOUND"
		end

	g_key_file_error_invalid_value: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_ERROR_INVALID_VALUE"
		end


end

