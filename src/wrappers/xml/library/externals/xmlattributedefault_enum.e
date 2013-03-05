-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XMLATTRIBUTEDEFAULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_attribute_fixed_low_level)  or else
				(a_value = xml_attribute_implied_low_level)  or else
				(a_value = xml_attribute_none_low_level)  or else
				(a_value = xml_attribute_required_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_attribute_fixed is
		do
			value := xml_attribute_fixed_low_level
		end

	set_xml_attribute_implied is
		do
			value := xml_attribute_implied_low_level
		end

	set_xml_attribute_none is
		do
			value := xml_attribute_none_low_level
		end

	set_xml_attribute_required is
		do
			value := xml_attribute_required_low_level
		end

feature -- Queries
	is_xml_attribute_fixed: BOOLEAN is
		do
			Result := (value=xml_attribute_fixed_low_level)
		end

	is_xml_attribute_implied: BOOLEAN is
		do
			Result := (value=xml_attribute_implied_low_level)
		end

	is_xml_attribute_none: BOOLEAN is
		do
			Result := (value=xml_attribute_none_low_level)
		end

	is_xml_attribute_required: BOOLEAN is
		do
			Result := (value=xml_attribute_required_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_FIXED"
 			}"
 		end

	xml_attribute_implied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IMPLIED"
 			}"
 		end

	xml_attribute_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NONE"
 			}"
 		end

	xml_attribute_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_REQUIRED"
 			}"
 		end


end -- class XMLATTRIBUTEDEFAULT_ENUM
