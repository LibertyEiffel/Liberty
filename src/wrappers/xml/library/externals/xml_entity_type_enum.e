-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ENTITY_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_external_general_parsed_entity_low_level)  or else
				(a_value = xml_external_general_unparsed_entity_low_level)  or else
				(a_value = xml_external_parameter_entity_low_level)  or else
				(a_value = xml_internal_general_entity_low_level)  or else
				(a_value = xml_internal_parameter_entity_low_level)  or else
				(a_value = xml_internal_predefined_entity_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_external_general_parsed_entity
		do
			value := xml_external_general_parsed_entity_low_level
		end

	set_xml_external_general_unparsed_entity
		do
			value := xml_external_general_unparsed_entity_low_level
		end

	set_xml_external_parameter_entity
		do
			value := xml_external_parameter_entity_low_level
		end

	set_xml_internal_general_entity
		do
			value := xml_internal_general_entity_low_level
		end

	set_xml_internal_parameter_entity
		do
			value := xml_internal_parameter_entity_low_level
		end

	set_xml_internal_predefined_entity
		do
			value := xml_internal_predefined_entity_low_level
		end

feature -- Queries
	is_xml_external_general_parsed_entity: BOOLEAN
		do
			Result := (value=xml_external_general_parsed_entity_low_level)
		end

	is_xml_external_general_unparsed_entity: BOOLEAN
		do
			Result := (value=xml_external_general_unparsed_entity_low_level)
		end

	is_xml_external_parameter_entity: BOOLEAN
		do
			Result := (value=xml_external_parameter_entity_low_level)
		end

	is_xml_internal_general_entity: BOOLEAN
		do
			Result := (value=xml_internal_general_entity_low_level)
		end

	is_xml_internal_parameter_entity: BOOLEAN
		do
			Result := (value=xml_internal_parameter_entity_low_level)
		end

	is_xml_internal_predefined_entity: BOOLEAN
		do
			Result := (value=xml_internal_predefined_entity_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_external_general_parsed_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_GENERAL_PARSED_ENTITY"
 			}"
 		end

	xml_external_general_unparsed_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_GENERAL_UNPARSED_ENTITY"
 			}"
 		end

	xml_external_parameter_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_PARAMETER_ENTITY"
 			}"
 		end

	xml_internal_general_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_GENERAL_ENTITY"
 			}"
 		end

	xml_internal_parameter_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_PARAMETER_ENTITY"
 			}"
 		end

	xml_internal_predefined_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_PREDEFINED_ENTITY"
 			}"
 		end


end -- class XML_ENTITY_TYPE_ENUM
