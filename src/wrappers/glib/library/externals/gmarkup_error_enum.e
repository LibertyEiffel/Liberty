-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = bad__utf_8_low_level)  or else
				(a_value = parse_low_level)  or else
				(a_value = unknown__element_low_level)  or else
				(a_value = unknown__attribute_low_level)  or else
				(a_value = invalid__content_low_level)  or else
				(a_value = missing__attribute_low_level) )
		end

feature -- Setters
	default_create,
	set_bad__utf_8 is
		do
			value := bad__utf_8_low_level
		end

	set_parse is
		do
			value := parse_low_level
		end

	set_unknown__element is
		do
			value := unknown__element_low_level
		end

	set_unknown__attribute is
		do
			value := unknown__attribute_low_level
		end

	set_invalid__content is
		do
			value := invalid__content_low_level
		end

	set_missing__attribute is
		do
			value := missing__attribute_low_level
		end

feature -- Queries
	is_bad__utf_8: BOOLEAN is
		do
			Result := (value=bad__utf_8_low_level)
		end

	is_parse: BOOLEAN is
		do
			Result := (value=parse_low_level)
		end

	is_unknown__element: BOOLEAN is
		do
			Result := (value=unknown__element_low_level)
		end

	is_unknown__attribute: BOOLEAN is
		do
			Result := (value=unknown__attribute_low_level)
		end

	is_invalid__content: BOOLEAN is
		do
			Result := (value=invalid__content_low_level)
		end

	is_missing__attribute: BOOLEAN is
		do
			Result := (value=missing__attribute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bad__utf_8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_BAD_UTF8"
 			}"
 		end

	parse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_PARSE"
 			}"
 		end

	unknown__element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ELEMENT"
 			}"
 		end

	unknown__attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE"
 			}"
 		end

	invalid__content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_INVALID_CONTENT"
 			}"
 		end

	missing__attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_ERROR_MISSING_ATTRIBUTE"
 			}"
 		end


end -- class GMARKUP_ERROR_ENUM
