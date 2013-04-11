-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ATTRIBUTE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_attribute_cdata) or else 
				(a_value = xml_attribute_id) or else 
				(a_value = xml_attribute_idref) or else 
				(a_value = xml_attribute_idrefs) or else 
				(a_value = xml_attribute_entity) or else 
				(a_value = xml_attribute_entities) or else 
				(a_value = xml_attribute_nmtoken) or else 
				(a_value = xml_attribute_nmtokens) or else 
				(a_value = xml_attribute_enumeration) or else 
				(a_value = xml_attribute_notation))
		end


feature {ANY} -- Setters
	default_create, set_cdata is
		do
			value := xml_attribute_cdata
		end

	set_id is
		do
			value := xml_attribute_id
		end

	set_idref is
		do
			value := xml_attribute_idref
		end

	set_idrefs is
		do
			value := xml_attribute_idrefs
		end

	set_entity is
		do
			value := xml_attribute_entity
		end

	set_entities is
		do
			value := xml_attribute_entities
		end

	set_nmtoken is
		do
			value := xml_attribute_nmtoken
		end

	set_nmtokens is
		do
			value := xml_attribute_nmtokens
		end

	set_enumeration is
		do
			value := xml_attribute_enumeration
		end

	set_notation is
		do
			value := xml_attribute_notation
		end


feature {ANY} -- Queries
	is_cdata: BOOLEAN is
		do
			Result := (value=xml_attribute_cdata)
		end

	is_id: BOOLEAN is
		do
			Result := (value=xml_attribute_id)
		end

	is_idref: BOOLEAN is
		do
			Result := (value=xml_attribute_idref)
		end

	is_idrefs: BOOLEAN is
		do
			Result := (value=xml_attribute_idrefs)
		end

	is_entity: BOOLEAN is
		do
			Result := (value=xml_attribute_entity)
		end

	is_entities: BOOLEAN is
		do
			Result := (value=xml_attribute_entities)
		end

	is_nmtoken: BOOLEAN is
		do
			Result := (value=xml_attribute_nmtoken)
		end

	is_nmtokens: BOOLEAN is
		do
			Result := (value=xml_attribute_nmtokens)
		end

	is_enumeration: BOOLEAN is
		do
			Result := (value=xml_attribute_enumeration)
		end

	is_notation: BOOLEAN is
		do
			Result := (value=xml_attribute_notation)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_cdata: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_CDATA"
		end

	xml_attribute_id: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ID"
		end

	xml_attribute_idref: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_IDREF"
		end

	xml_attribute_idrefs: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_IDREFS"
		end

	xml_attribute_entity: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENTITY"
		end

	xml_attribute_entities: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENTITIES"
		end

	xml_attribute_nmtoken: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NMTOKEN"
		end

	xml_attribute_nmtokens: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NMTOKENS"
		end

	xml_attribute_enumeration: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENUMERATION"
		end

	xml_attribute_notation: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NOTATION"
		end


end

