-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ENTITY_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = internal_general_entity_low_level)  or else
				(a_value = external_general_parsed_entity_low_level)  or else
				(a_value = external_general_unparsed_entity_low_level)  or else
				(a_value = internal_parameter_entity_low_level)  or else
				(a_value = external_parameter_entity_low_level)  or else
				(a_value = internal_predefined_entity_low_level) )
		end

feature -- Setters
	default_create,
	set_internal_general_entity is
		do
			value := internal_general_entity_low_level
		end

	set_external_general_parsed_entity is
		do
			value := external_general_parsed_entity_low_level
		end

	set_external_general_unparsed_entity is
		do
			value := external_general_unparsed_entity_low_level
		end

	set_internal_parameter_entity is
		do
			value := internal_parameter_entity_low_level
		end

	set_external_parameter_entity is
		do
			value := external_parameter_entity_low_level
		end

	set_internal_predefined_entity is
		do
			value := internal_predefined_entity_low_level
		end

feature -- Queries
	internal_general_entity: BOOLEAN is
		do
			Result := (value=internal_general_entity_low_level)
		end

	external_general_parsed_entity: BOOLEAN is
		do
			Result := (value=external_general_parsed_entity_low_level)
		end

	external_general_unparsed_entity: BOOLEAN is
		do
			Result := (value=external_general_unparsed_entity_low_level)
		end

	internal_parameter_entity: BOOLEAN is
		do
			Result := (value=internal_parameter_entity_low_level)
		end

	external_parameter_entity: BOOLEAN is
		do
			Result := (value=external_parameter_entity_low_level)
		end

	internal_predefined_entity: BOOLEAN is
		do
			Result := (value=internal_predefined_entity_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	internal_general_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_GENERAL_ENTITY"
 			}"
 		end

	external_general_parsed_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_GENERAL_PARSED_ENTITY"
 			}"
 		end

	external_general_unparsed_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_GENERAL_UNPARSED_ENTITY"
 			}"
 		end

	internal_parameter_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_PARAMETER_ENTITY"
 			}"
 		end

	external_parameter_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXTERNAL_PARAMETER_ENTITY"
 			}"
 		end

	internal_predefined_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_INTERNAL_PREDEFINED_ENTITY"
 			}"
 		end


end -- class XML_ENTITY_TYPE_ENUM
