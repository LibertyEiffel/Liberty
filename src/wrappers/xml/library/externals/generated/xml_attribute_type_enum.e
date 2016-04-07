-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ATTRIBUTE_TYPE_ENUM

-- Wrapper of enum xmlAttributeType defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cdata_low_level)  or else
				(a_value = entities_low_level)  or else
				(a_value = entity_low_level)  or else
				(a_value = enumeration_low_level)  or else
				(a_value = id_low_level)  or else
				(a_value = idref_low_level)  or else
				(a_value = idrefs_low_level)  or else
				(a_value = nmtoken_low_level)  or else
				(a_value = nmtokens_low_level)  or else
				(a_value = notation_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cdata
               do
                       value := cdata_low_level
               end

	set_entities
               do
                       value := entities_low_level
               end

	set_entity
               do
                       value := entity_low_level
               end

	set_enumeration
               do
                       value := enumeration_low_level
               end

	set_id
               do
                       value := id_low_level
               end

	set_idref
               do
                       value := idref_low_level
               end

	set_idrefs
               do
                       value := idrefs_low_level
               end

	set_nmtoken
               do
                       value := nmtoken_low_level
               end

	set_nmtokens
               do
                       value := nmtokens_low_level
               end

	set_notation
               do
                       value := notation_low_level
               end

feature {ANY} -- Queries
       is_cdata: BOOLEAN
               do
                       Result := (value=cdata_low_level)
               end

       is_entities: BOOLEAN
               do
                       Result := (value=entities_low_level)
               end

       is_entity: BOOLEAN
               do
                       Result := (value=entity_low_level)
               end

       is_enumeration: BOOLEAN
               do
                       Result := (value=enumeration_low_level)
               end

       is_id: BOOLEAN
               do
                       Result := (value=id_low_level)
               end

       is_idref: BOOLEAN
               do
                       Result := (value=idref_low_level)
               end

       is_idrefs: BOOLEAN
               do
                       Result := (value=idrefs_low_level)
               end

       is_nmtoken: BOOLEAN
               do
                       Result := (value=nmtoken_low_level)
               end

       is_nmtokens: BOOLEAN
               do
                       Result := (value=nmtokens_low_level)
               end

       is_notation: BOOLEAN
               do
                       Result := (value=notation_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cdata_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_CDATA"
                       }"
               end

     entities_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_ENTITIES"
                       }"
               end

     entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_ENTITY"
                       }"
               end

     enumeration_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_ENUMERATION"
                       }"
               end

     id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_ID"
                       }"
               end

     idref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_IDREF"
                       }"
               end

     idrefs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_IDREFS"
                       }"
               end

     nmtoken_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_NMTOKEN"
                       }"
               end

     nmtokens_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_NMTOKENS"
                       }"
               end

     notation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_NOTATION"
                       }"
               end


end -- class XML_ATTRIBUTE_TYPE_ENUM
