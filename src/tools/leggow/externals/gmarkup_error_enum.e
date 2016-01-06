-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GMARKUP_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_utf8_low_level)  or else
				(a_value = empty_low_level)  or else
				(a_value = invalid_content_low_level)  or else
				(a_value = missing_attribute_low_level)  or else
				(a_value = parse_low_level)  or else
				(a_value = unknown_attribute_low_level)  or else
				(a_value = unknown_element_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_utf8
               do
                       value := bad_utf8_low_level
               end

	set_empty
               do
                       value := empty_low_level
               end

	set_invalid_content
               do
                       value := invalid_content_low_level
               end

	set_missing_attribute
               do
                       value := missing_attribute_low_level
               end

	set_parse
               do
                       value := parse_low_level
               end

	set_unknown_attribute
               do
                       value := unknown_attribute_low_level
               end

	set_unknown_element
               do
                       value := unknown_element_low_level
               end

feature {ANY} -- Queries
       is_bad_utf8: BOOLEAN
               do
                       Result := (value=bad_utf8_low_level)
               end

       is_empty: BOOLEAN
               do
                       Result := (value=empty_low_level)
               end

       is_invalid_content: BOOLEAN
               do
                       Result := (value=invalid_content_low_level)
               end

       is_missing_attribute: BOOLEAN
               do
                       Result := (value=missing_attribute_low_level)
               end

       is_parse: BOOLEAN
               do
                       Result := (value=parse_low_level)
               end

       is_unknown_attribute: BOOLEAN
               do
                       Result := (value=unknown_attribute_low_level)
               end

       is_unknown_element: BOOLEAN
               do
                       Result := (value=unknown_element_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_BAD_UTF8"
                       }"
               end

     empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_EMPTY"
                       }"
               end

     invalid_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_INVALID_CONTENT"
                       }"
               end

     missing_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_MISSING_ATTRIBUTE"
                       }"
               end

     parse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_PARSE"
                       }"
               end

     unknown_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE"
                       }"
               end

     unknown_element_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_ERROR_UNKNOWN_ELEMENT"
                       }"
               end


end -- class GMARKUP_ERROR_ENUM
