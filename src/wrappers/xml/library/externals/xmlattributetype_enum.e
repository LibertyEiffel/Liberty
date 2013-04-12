-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XMLATTRIBUTETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_xml_attribute_cdata is
		do
			value := xml_attribute_cdata_low_level
		end

	set_xml_attribute_entities is
		do
			value := xml_attribute_entities_low_level
		end

	set_xml_attribute_entity is
		do
			value := xml_attribute_entity_low_level
		end

	set_xml_attribute_enumeration is
		do
			value := xml_attribute_enumeration_low_level
		end

	set_xml_attribute_id is
		do
			value := xml_attribute_id_low_level
		end

	set_xml_attribute_idref is
		do
			value := xml_attribute_idref_low_level
		end

	set_xml_attribute_idrefs is
		do
			value := xml_attribute_idrefs_low_level
		end

	set_xml_attribute_nmtoken is
		do
			value := xml_attribute_nmtoken_low_level
		end

	set_xml_attribute_nmtokens is
		do
			value := xml_attribute_nmtokens_low_level
		end

	set_xml_attribute_notation is
		do
			value := xml_attribute_notation_low_level
		end

feature -- Queries
	is_xml_attribute_cdata: BOOLEAN is
		do
			Result := (value=xml_attribute_cdata_low_level)
		end

	is_xml_attribute_entities: BOOLEAN is
		do
			Result := (value=xml_attribute_entities_low_level)
		end

	is_xml_attribute_entity: BOOLEAN is
		do
			Result := (value=xml_attribute_entity_low_level)
		end

	is_xml_attribute_enumeration: BOOLEAN is
		do
			Result := (value=xml_attribute_enumeration_low_level)
		end

	is_xml_attribute_id: BOOLEAN is
		do
			Result := (value=xml_attribute_id_low_level)
		end

	is_xml_attribute_idref: BOOLEAN is
		do
			Result := (value=xml_attribute_idref_low_level)
		end

	is_xml_attribute_idrefs: BOOLEAN is
		do
			Result := (value=xml_attribute_idrefs_low_level)
		end

	is_xml_attribute_nmtoken: BOOLEAN is
		do
			Result := (value=xml_attribute_nmtoken_low_level)
		end

	is_xml_attribute_nmtokens: BOOLEAN is
		do
			Result := (value=xml_attribute_nmtokens_low_level)
		end

	is_xml_attribute_notation: BOOLEAN is
		do
			Result := (value=xml_attribute_notation_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_cdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_CDATA"
 			}"
 		end

	xml_attribute_entities_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITIES"
 			}"
 		end

	xml_attribute_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITY"
 			}"
 		end

	xml_attribute_enumeration_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENUMERATION"
 			}"
 		end

	xml_attribute_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ID"
 			}"
 		end

	xml_attribute_idref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREF"
 			}"
 		end

	xml_attribute_idrefs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREFS"
 			}"
 		end

	xml_attribute_nmtoken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKEN"
 			}"
 		end

	xml_attribute_nmtokens_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKENS"
 			}"
 		end

	xml_attribute_notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NOTATION"
 			}"
 		end


end -- class XMLATTRIBUTETYPE_ENUM
