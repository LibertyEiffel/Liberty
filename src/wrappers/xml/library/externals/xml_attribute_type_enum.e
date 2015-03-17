-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ATTRIBUTE_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_attribute_cdata_low_level)  or else
				(a_value = xml_attribute_entities_low_level)  or else
				(a_value = xml_attribute_entity_low_level)  or else
				(a_value = xml_attribute_enumeration_low_level)  or else
				(a_value = xml_attribute_id_low_level)  or else
				(a_value = xml_attribute_idref_low_level)  or else
				(a_value = xml_attribute_idrefs_low_level)  or else
				(a_value = xml_attribute_nmtoken_low_level)  or else
				(a_value = xml_attribute_nmtokens_low_level)  or else
				(a_value = xml_attribute_notation_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_attribute_cdata
		do
			value := xml_attribute_cdata_low_level
		end

	set_xml_attribute_entities
		do
			value := xml_attribute_entities_low_level
		end

	set_xml_attribute_entity
		do
			value := xml_attribute_entity_low_level
		end

	set_xml_attribute_enumeration
		do
			value := xml_attribute_enumeration_low_level
		end

	set_xml_attribute_id
		do
			value := xml_attribute_id_low_level
		end

	set_xml_attribute_idref
		do
			value := xml_attribute_idref_low_level
		end

	set_xml_attribute_idrefs
		do
			value := xml_attribute_idrefs_low_level
		end

	set_xml_attribute_nmtoken
		do
			value := xml_attribute_nmtoken_low_level
		end

	set_xml_attribute_nmtokens
		do
			value := xml_attribute_nmtokens_low_level
		end

	set_xml_attribute_notation
		do
			value := xml_attribute_notation_low_level
		end

feature -- Queries
	is_xml_attribute_cdata: BOOLEAN
		do
			Result := (value=xml_attribute_cdata_low_level)
		end

	is_xml_attribute_entities: BOOLEAN
		do
			Result := (value=xml_attribute_entities_low_level)
		end

	is_xml_attribute_entity: BOOLEAN
		do
			Result := (value=xml_attribute_entity_low_level)
		end

	is_xml_attribute_enumeration: BOOLEAN
		do
			Result := (value=xml_attribute_enumeration_low_level)
		end

	is_xml_attribute_id: BOOLEAN
		do
			Result := (value=xml_attribute_id_low_level)
		end

	is_xml_attribute_idref: BOOLEAN
		do
			Result := (value=xml_attribute_idref_low_level)
		end

	is_xml_attribute_idrefs: BOOLEAN
		do
			Result := (value=xml_attribute_idrefs_low_level)
		end

	is_xml_attribute_nmtoken: BOOLEAN
		do
			Result := (value=xml_attribute_nmtoken_low_level)
		end

	is_xml_attribute_nmtokens: BOOLEAN
		do
			Result := (value=xml_attribute_nmtokens_low_level)
		end

	is_xml_attribute_notation: BOOLEAN
		do
			Result := (value=xml_attribute_notation_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_cdata_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_CDATA"
 			}"
 		end

	xml_attribute_entities_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITIES"
 			}"
 		end

	xml_attribute_entity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITY"
 			}"
 		end

	xml_attribute_enumeration_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENUMERATION"
 			}"
 		end

	xml_attribute_id_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ID"
 			}"
 		end

	xml_attribute_idref_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREF"
 			}"
 		end

	xml_attribute_idrefs_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREFS"
 			}"
 		end

	xml_attribute_nmtoken_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKEN"
 			}"
 		end

	xml_attribute_nmtokens_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKENS"
 			}"
 		end

	xml_attribute_notation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NOTATION"
 			}"
 		end


end -- class XML_ATTRIBUTE_TYPE_ENUM
