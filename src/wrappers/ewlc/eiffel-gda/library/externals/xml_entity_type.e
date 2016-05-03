-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ENTITY_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_internal_general_entity) or else 
				(a_value = xml_external_general_parsed_entity) or else 
				(a_value = xml_external_general_unparsed_entity) or else 
				(a_value = xml_internal_parameter_entity) or else 
				(a_value = xml_external_parameter_entity) or else 
				(a_value = xml_internal_predefined_entity))
		end


feature {ANY} -- Setters
	default_create, set_internal_general_entity is
		do
			value := xml_internal_general_entity
		end

	set_external_general_parsed_entity is
		do
			value := xml_external_general_parsed_entity
		end

	set_external_general_unparsed_entity is
		do
			value := xml_external_general_unparsed_entity
		end

	set_internal_parameter_entity is
		do
			value := xml_internal_parameter_entity
		end

	set_external_parameter_entity is
		do
			value := xml_external_parameter_entity
		end

	set_internal_predefined_entity is
		do
			value := xml_internal_predefined_entity
		end


feature {ANY} -- Queries
	is_internal_general_entity: BOOLEAN is
		do
			Result := (value=xml_internal_general_entity)
		end

	is_external_general_parsed_entity: BOOLEAN is
		do
			Result := (value=xml_external_general_parsed_entity)
		end

	is_external_general_unparsed_entity: BOOLEAN is
		do
			Result := (value=xml_external_general_unparsed_entity)
		end

	is_internal_parameter_entity: BOOLEAN is
		do
			Result := (value=xml_internal_parameter_entity)
		end

	is_external_parameter_entity: BOOLEAN is
		do
			Result := (value=xml_external_parameter_entity)
		end

	is_internal_predefined_entity: BOOLEAN is
		do
			Result := (value=xml_internal_predefined_entity)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_internal_general_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_INTERNAL_GENERAL_ENTITY"
		end

	xml_external_general_parsed_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXTERNAL_GENERAL_PARSED_ENTITY"
		end

	xml_external_general_unparsed_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXTERNAL_GENERAL_UNPARSED_ENTITY"
		end

	xml_internal_parameter_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_INTERNAL_PARAMETER_ENTITY"
		end

	xml_external_parameter_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXTERNAL_PARAMETER_ENTITY"
		end

	xml_internal_predefined_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_INTERNAL_PREDEFINED_ENTITY"
		end


end

