-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XMLELEMENTCONTENTOCCUR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_element_content_mult_low_level)  or else
				(a_value = xml_element_content_once_low_level)  or else
				(a_value = xml_element_content_opt_low_level)  or else
				(a_value = xml_element_content_plus_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_element_content_mult is
		do
			value := xml_element_content_mult_low_level
		end

	set_xml_element_content_once is
		do
			value := xml_element_content_once_low_level
		end

	set_xml_element_content_opt is
		do
			value := xml_element_content_opt_low_level
		end

	set_xml_element_content_plus is
		do
			value := xml_element_content_plus_low_level
		end

feature -- Queries
	is_xml_element_content_mult: BOOLEAN is
		do
			Result := (value=xml_element_content_mult_low_level)
		end

	is_xml_element_content_once: BOOLEAN is
		do
			Result := (value=xml_element_content_once_low_level)
		end

	is_xml_element_content_opt: BOOLEAN is
		do
			Result := (value=xml_element_content_opt_low_level)
		end

	is_xml_element_content_plus: BOOLEAN is
		do
			Result := (value=xml_element_content_plus_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_mult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_MULT"
 			}"
 		end

	xml_element_content_once_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ONCE"
 			}"
 		end

	xml_element_content_opt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OPT"
 			}"
 		end

	xml_element_content_plus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PLUS"
 			}"
 		end


end -- class XMLELEMENTCONTENTOCCUR_ENUM
