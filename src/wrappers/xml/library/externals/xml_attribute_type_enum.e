-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ATTRIBUTE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = cdata_low_level)  or else
				(a_value = id_low_level)  or else
				(a_value = idref_low_level)  or else
				(a_value = idrefs_low_level)  or else
				(a_value = entity_low_level)  or else
				(a_value = entities_low_level)  or else
				(a_value = nmtoken_low_level)  or else
				(a_value = nmtokens_low_level)  or else
				(a_value = enumeration_low_level)  or else
				(a_value = notation_low_level) )
		end

feature -- Setters
	default_create,
	set_cdata is
		do
			value := cdata_low_level
		end

	set_id is
		do
			value := id_low_level
		end

	set_idref is
		do
			value := idref_low_level
		end

	set_idrefs is
		do
			value := idrefs_low_level
		end

	set_entity is
		do
			value := entity_low_level
		end

	set_entities is
		do
			value := entities_low_level
		end

	set_nmtoken is
		do
			value := nmtoken_low_level
		end

	set_nmtokens is
		do
			value := nmtokens_low_level
		end

	set_enumeration is
		do
			value := enumeration_low_level
		end

	set_notation is
		do
			value := notation_low_level
		end

feature -- Queries
	cdata: BOOLEAN is
		do
			Result := (value=cdata_low_level)
		end

	id: BOOLEAN is
		do
			Result := (value=id_low_level)
		end

	idref: BOOLEAN is
		do
			Result := (value=idref_low_level)
		end

	idrefs: BOOLEAN is
		do
			Result := (value=idrefs_low_level)
		end

	entity: BOOLEAN is
		do
			Result := (value=entity_low_level)
		end

	entities: BOOLEAN is
		do
			Result := (value=entities_low_level)
		end

	nmtoken: BOOLEAN is
		do
			Result := (value=nmtoken_low_level)
		end

	nmtokens: BOOLEAN is
		do
			Result := (value=nmtokens_low_level)
		end

	enumeration: BOOLEAN is
		do
			Result := (value=enumeration_low_level)
		end

	notation: BOOLEAN is
		do
			Result := (value=notation_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_CDATA"
 			}"
 		end

	id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ID"
 			}"
 		end

	idref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREF"
 			}"
 		end

	idrefs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IDREFS"
 			}"
 		end

	entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITY"
 			}"
 		end

	entities_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENTITIES"
 			}"
 		end

	nmtoken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKEN"
 			}"
 		end

	nmtokens_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NMTOKENS"
 			}"
 		end

	enumeration_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_ENUMERATION"
 			}"
 		end

	notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NOTATION"
 			}"
 		end


end -- class XML_ATTRIBUTE_TYPE_ENUM
