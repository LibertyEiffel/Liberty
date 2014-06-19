-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_markup_error_bad_utf8_low_level)  or else
				(a_value = g_markup_error_empty_low_level)  or else
				(a_value = g_markup_error_invalid_content_low_level)  or else
				(a_value = g_markup_error_missing_attribute_low_level)  or else
				(a_value = g_markup_error_parse_low_level)  or else
				(a_value = g_markup_error_unknown_attribute_low_level)  or else
				(a_value = g_markup_error_unknown_element_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_markup_error_bad_utf8
		do
			value := g_markup_error_bad_utf8_low_level
		end

	set_g_markup_error_empty
		do
			value := g_markup_error_empty_low_level
		end

	set_g_markup_error_invalid_content
		do
			value := g_markup_error_invalid_content_low_level
		end

	set_g_markup_error_missing_attribute
		do
			value := g_markup_error_missing_attribute_low_level
		end

	set_g_markup_error_parse
		do
			value := g_markup_error_parse_low_level
		end

	set_g_markup_error_unknown_attribute
		do
			value := g_markup_error_unknown_attribute_low_level
		end

	set_g_markup_error_unknown_element
		do
			value := g_markup_error_unknown_element_low_level
		end

feature {ANY} -- Queries
	is_g_markup_error_bad_utf8: BOOLEAN
		do
			Result := (value=g_markup_error_bad_utf8_low_level)
		end

	is_g_markup_error_empty: BOOLEAN
		do
			Result := (value=g_markup_error_empty_low_level)
		end

	is_g_markup_error_invalid_content: BOOLEAN
		do
			Result := (value=g_markup_error_invalid_content_low_level)
		end

	is_g_markup_error_missing_attribute: BOOLEAN
		do
			Result := (value=g_markup_error_missing_attribute_low_level)
		end

	is_g_markup_error_parse: BOOLEAN
		do
			Result := (value=g_markup_error_parse_low_level)
		end

	is_g_markup_error_unknown_attribute: BOOLEAN
		do
			Result := (value=g_markup_error_unknown_attribute_low_level)
		end

	is_g_markup_error_unknown_element: BOOLEAN
		do
			Result := (value=g_markup_error_unknown_element_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_error_bad_utf8_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_BAD_UTF8"
 			}"
 		end

	g_markup_error_empty_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_EMPTY"
 			}"
 		end

	g_markup_error_invalid_content_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_INVALID_CONTENT"
 			}"
 		end

	g_markup_error_missing_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_MISSING_ATTRIBUTE"
 			}"
 		end

	g_markup_error_parse_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_PARSE"
 			}"
 		end

	g_markup_error_unknown_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE"
 			}"
 		end

	g_markup_error_unknown_element_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ELEMENT"
 			}"
 		end


end -- class GMARKUP_ERROR_ENUM
