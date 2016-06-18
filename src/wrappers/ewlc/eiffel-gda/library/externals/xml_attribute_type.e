-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ATTRIBUTE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_cdata
		do
			value := xml_attribute_cdata
		end

	set_id
		do
			value := xml_attribute_id
		end

	set_idref
		do
			value := xml_attribute_idref
		end

	set_idrefs
		do
			value := xml_attribute_idrefs
		end

	set_entity
		do
			value := xml_attribute_entity
		end

	set_entities
		do
			value := xml_attribute_entities
		end

	set_nmtoken
		do
			value := xml_attribute_nmtoken
		end

	set_nmtokens
		do
			value := xml_attribute_nmtokens
		end

	set_enumeration
		do
			value := xml_attribute_enumeration
		end

	set_notation
		do
			value := xml_attribute_notation
		end


feature {ANY} -- Queries
	is_cdata: BOOLEAN
		do
			Result := (value=xml_attribute_cdata)
		end

	is_id: BOOLEAN
		do
			Result := (value=xml_attribute_id)
		end

	is_idref: BOOLEAN
		do
			Result := (value=xml_attribute_idref)
		end

	is_idrefs: BOOLEAN
		do
			Result := (value=xml_attribute_idrefs)
		end

	is_entity: BOOLEAN
		do
			Result := (value=xml_attribute_entity)
		end

	is_entities: BOOLEAN
		do
			Result := (value=xml_attribute_entities)
		end

	is_nmtoken: BOOLEAN
		do
			Result := (value=xml_attribute_nmtoken)
		end

	is_nmtokens: BOOLEAN
		do
			Result := (value=xml_attribute_nmtokens)
		end

	is_enumeration: BOOLEAN
		do
			Result := (value=xml_attribute_enumeration)
		end

	is_notation: BOOLEAN
		do
			Result := (value=xml_attribute_notation)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_cdata: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_CDATA"
		end

	xml_attribute_id: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ID"
		end

	xml_attribute_idref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_IDREF"
		end

	xml_attribute_idrefs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_IDREFS"
		end

	xml_attribute_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENTITY"
		end

	xml_attribute_entities: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENTITIES"
		end

	xml_attribute_nmtoken: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NMTOKEN"
		end

	xml_attribute_nmtokens: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NMTOKENS"
		end

	xml_attribute_enumeration: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_ENUMERATION"
		end

	xml_attribute_notation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NOTATION"
		end


end

