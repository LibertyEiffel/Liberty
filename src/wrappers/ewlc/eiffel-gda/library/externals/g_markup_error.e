-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_MARKUP_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_markup_error_bad_utf8) or else 
				(a_value = g_markup_error_empty) or else 
				(a_value = g_markup_error_parse) or else 
				(a_value = g_markup_error_unknown_element) or else 
				(a_value = g_markup_error_unknown_attribute) or else 
				(a_value = g_markup_error_invalid_content) or else 
				(a_value = g_markup_error_missing_attribute))
		end


feature {ANY} -- Setters
	default_create, set_bad_utf8
		do
			value := g_markup_error_bad_utf8
		end

	set_empty
		do
			value := g_markup_error_empty
		end

	set_parse
		do
			value := g_markup_error_parse
		end

	set_unknown_element
		do
			value := g_markup_error_unknown_element
		end

	set_unknown_attribute
		do
			value := g_markup_error_unknown_attribute
		end

	set_invalid_content
		do
			value := g_markup_error_invalid_content
		end

	set_missing_attribute
		do
			value := g_markup_error_missing_attribute
		end


feature {ANY} -- Queries
	is_bad_utf8: BOOLEAN
		do
			Result := (value=g_markup_error_bad_utf8)
		end

	is_empty: BOOLEAN
		do
			Result := (value=g_markup_error_empty)
		end

	is_parse: BOOLEAN
		do
			Result := (value=g_markup_error_parse)
		end

	is_unknown_element: BOOLEAN
		do
			Result := (value=g_markup_error_unknown_element)
		end

	is_unknown_attribute: BOOLEAN
		do
			Result := (value=g_markup_error_unknown_attribute)
		end

	is_invalid_content: BOOLEAN
		do
			Result := (value=g_markup_error_invalid_content)
		end

	is_missing_attribute: BOOLEAN
		do
			Result := (value=g_markup_error_missing_attribute)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_error_bad_utf8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_BAD_UTF8"
		end

	g_markup_error_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_EMPTY"
		end

	g_markup_error_parse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_PARSE"
		end

	g_markup_error_unknown_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_UNKNOWN_ELEMENT"
		end

	g_markup_error_unknown_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE"
		end

	g_markup_error_invalid_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_INVALID_CONTENT"
		end

	g_markup_error_missing_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_ERROR_MISSING_ATTRIBUTE"
		end


end

