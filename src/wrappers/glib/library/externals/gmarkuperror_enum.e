-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUPERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_markup_error_bad_utf8 is
		do
			value := g_markup_error_bad_utf8_low_level
		end

	set_g_markup_error_empty is
		do
			value := g_markup_error_empty_low_level
		end

	set_g_markup_error_invalid_content is
		do
			value := g_markup_error_invalid_content_low_level
		end

	set_g_markup_error_missing_attribute is
		do
			value := g_markup_error_missing_attribute_low_level
		end

	set_g_markup_error_parse is
		do
			value := g_markup_error_parse_low_level
		end

	set_g_markup_error_unknown_attribute is
		do
			value := g_markup_error_unknown_attribute_low_level
		end

	set_g_markup_error_unknown_element is
		do
			value := g_markup_error_unknown_element_low_level
		end

feature {ANY} -- Queries
	is_g_markup_error_bad_utf8: BOOLEAN is
		do
			Result := (value=g_markup_error_bad_utf8_low_level)
		end

	is_g_markup_error_empty: BOOLEAN is
		do
			Result := (value=g_markup_error_empty_low_level)
		end

	is_g_markup_error_invalid_content: BOOLEAN is
		do
			Result := (value=g_markup_error_invalid_content_low_level)
		end

	is_g_markup_error_missing_attribute: BOOLEAN is
		do
			Result := (value=g_markup_error_missing_attribute_low_level)
		end

	is_g_markup_error_parse: BOOLEAN is
		do
			Result := (value=g_markup_error_parse_low_level)
		end

	is_g_markup_error_unknown_attribute: BOOLEAN is
		do
			Result := (value=g_markup_error_unknown_attribute_low_level)
		end

	is_g_markup_error_unknown_element: BOOLEAN is
		do
			Result := (value=g_markup_error_unknown_element_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_error_bad_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_BAD_UTF8"
 			}"
 		end

	g_markup_error_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_EMPTY"
 			}"
 		end

	g_markup_error_invalid_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_INVALID_CONTENT"
 			}"
 		end

	g_markup_error_missing_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_MISSING_ATTRIBUTE"
 			}"
 		end

	g_markup_error_parse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_PARSE"
 			}"
 		end

	g_markup_error_unknown_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE"
 			}"
 		end

	g_markup_error_unknown_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ELEMENT"
 			}"
 		end


end -- class GMARKUPERROR_ENUM
