-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_CONTENT_OCCUR_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_element_content_mult_low_level)  or else
				(a_value = xml_element_content_once_low_level)  or else
				(a_value = xml_element_content_opt_low_level)  or else
				(a_value = xml_element_content_plus_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_element_content_mult
		do
			value := xml_element_content_mult_low_level
		end

	set_xml_element_content_once
		do
			value := xml_element_content_once_low_level
		end

	set_xml_element_content_opt
		do
			value := xml_element_content_opt_low_level
		end

	set_xml_element_content_plus
		do
			value := xml_element_content_plus_low_level
		end

feature -- Queries
	is_xml_element_content_mult: BOOLEAN
		do
			Result := (value=xml_element_content_mult_low_level)
		end

	is_xml_element_content_once: BOOLEAN
		do
			Result := (value=xml_element_content_once_low_level)
		end

	is_xml_element_content_opt: BOOLEAN
		do
			Result := (value=xml_element_content_opt_low_level)
		end

	is_xml_element_content_plus: BOOLEAN
		do
			Result := (value=xml_element_content_plus_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_mult_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_MULT"
 			}"
 		end

	xml_element_content_once_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ONCE"
 			}"
 		end

	xml_element_content_opt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OPT"
 			}"
 		end

	xml_element_content_plus_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PLUS"
 			}"
 		end


end -- class XML_ELEMENT_CONTENT_OCCUR_ENUM
