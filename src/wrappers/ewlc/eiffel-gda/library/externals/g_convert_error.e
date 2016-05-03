-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_CONVERT_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_convert_error_no_conversion) or else 
				(a_value = g_convert_error_illegal_sequence) or else 
				(a_value = g_convert_error_failed) or else 
				(a_value = g_convert_error_partial_input) or else 
				(a_value = g_convert_error_bad_uri) or else 
				(a_value = g_convert_error_not_absolute_path))
		end


feature {ANY} -- Setters
	default_create, set_no_conversion is
		do
			value := g_convert_error_no_conversion
		end

	set_illegal_sequence is
		do
			value := g_convert_error_illegal_sequence
		end

	set_failed is
		do
			value := g_convert_error_failed
		end

	set_partial_input is
		do
			value := g_convert_error_partial_input
		end

	set_bad_uri is
		do
			value := g_convert_error_bad_uri
		end

	set_not_absolute_path is
		do
			value := g_convert_error_not_absolute_path
		end


feature {ANY} -- Queries
	is_no_conversion: BOOLEAN is
		do
			Result := (value=g_convert_error_no_conversion)
		end

	is_illegal_sequence: BOOLEAN is
		do
			Result := (value=g_convert_error_illegal_sequence)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=g_convert_error_failed)
		end

	is_partial_input: BOOLEAN is
		do
			Result := (value=g_convert_error_partial_input)
		end

	is_bad_uri: BOOLEAN is
		do
			Result := (value=g_convert_error_bad_uri)
		end

	is_not_absolute_path: BOOLEAN is
		do
			Result := (value=g_convert_error_not_absolute_path)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_convert_error_no_conversion: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_NO_CONVERSION"
		end

	g_convert_error_illegal_sequence: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_ILLEGAL_SEQUENCE"
		end

	g_convert_error_failed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_FAILED"
		end

	g_convert_error_partial_input: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_PARTIAL_INPUT"
		end

	g_convert_error_bad_uri: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_BAD_URI"
		end

	g_convert_error_not_absolute_path: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
		end


end

