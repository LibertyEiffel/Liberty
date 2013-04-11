-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_INPUT_STATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = eof_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = misc_low_level)  or else
				(a_value = pi_low_level)  or else
				(a_value = dtd_low_level)  or else
				(a_value = prolog_low_level)  or else
				(a_value = comment_low_level)  or else
				(a_value = start_tag_low_level)  or else
				(a_value = content_low_level)  or else
				(a_value = cdata_section_low_level)  or else
				(a_value = end_tag_low_level)  or else
				(a_value = entity_decl_low_level)  or else
				(a_value = entity_value_low_level)  or else
				(a_value = attribute_value_low_level)  or else
				(a_value = system_literal_low_level)  or else
				(a_value = epilog_low_level)  or else
				(a_value = ignore_low_level)  or else
				(a_value = public_literal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_eof is
		do
			value := eof_low_level
		end

	set_start is
		do
			value := start_low_level
		end

	set_misc is
		do
			value := misc_low_level
		end

	set_pi is
		do
			value := pi_low_level
		end

	set_dtd is
		do
			value := dtd_low_level
		end

	set_prolog is
		do
			value := prolog_low_level
		end

	set_comment is
		do
			value := comment_low_level
		end

	set_start_tag is
		do
			value := start_tag_low_level
		end

	set_content is
		do
			value := content_low_level
		end

	set_cdata_section is
		do
			value := cdata_section_low_level
		end

	set_end_tag is
		do
			value := end_tag_low_level
		end

	set_entity_decl is
		do
			value := entity_decl_low_level
		end

	set_entity_value is
		do
			value := entity_value_low_level
		end

	set_attribute_value is
		do
			value := attribute_value_low_level
		end

	set_system_literal is
		do
			value := system_literal_low_level
		end

	set_epilog is
		do
			value := epilog_low_level
		end

	set_ignore is
		do
			value := ignore_low_level
		end

	set_public_literal is
		do
			value := public_literal_low_level
		end

feature {ANY} -- Queries
	eof: BOOLEAN is
		do
			Result := (value=eof_low_level)
		end

	start: BOOLEAN is
		do
			Result := (value=start_low_level)
		end

	misc: BOOLEAN is
		do
			Result := (value=misc_low_level)
		end

	pi: BOOLEAN is
		do
			Result := (value=pi_low_level)
		end

	dtd: BOOLEAN is
		do
			Result := (value=dtd_low_level)
		end

	prolog: BOOLEAN is
		do
			Result := (value=prolog_low_level)
		end

	comment: BOOLEAN is
		do
			Result := (value=comment_low_level)
		end

	start_tag: BOOLEAN is
		do
			Result := (value=start_tag_low_level)
		end

	content: BOOLEAN is
		do
			Result := (value=content_low_level)
		end

	cdata_section: BOOLEAN is
		do
			Result := (value=cdata_section_low_level)
		end

	end_tag: BOOLEAN is
		do
			Result := (value=end_tag_low_level)
		end

	entity_decl: BOOLEAN is
		do
			Result := (value=entity_decl_low_level)
		end

	entity_value: BOOLEAN is
		do
			Result := (value=entity_value_low_level)
		end

	attribute_value: BOOLEAN is
		do
			Result := (value=attribute_value_low_level)
		end

	system_literal: BOOLEAN is
		do
			Result := (value=system_literal_low_level)
		end

	epilog: BOOLEAN is
		do
			Result := (value=epilog_low_level)
		end

	ignore: BOOLEAN is
		do
			Result := (value=ignore_low_level)
		end

	public_literal: BOOLEAN is
		do
			Result := (value=public_literal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_EOF"
 			}"
 		end

	start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_START"
 			}"
 		end

	misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_MISC"
 			}"
 		end

	pi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PI"
 			}"
 		end

	dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_DTD"
 			}"
 		end

	prolog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PROLOG"
 			}"
 		end

	comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_COMMENT"
 			}"
 		end

	start_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_START_TAG"
 			}"
 		end

	content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_CONTENT"
 			}"
 		end

	cdata_section_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_CDATA_SECTION"
 			}"
 		end

	end_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_END_TAG"
 			}"
 		end

	entity_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ENTITY_DECL"
 			}"
 		end

	entity_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ENTITY_VALUE"
 			}"
 		end

	attribute_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ATTRIBUTE_VALUE"
 			}"
 		end

	system_literal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_SYSTEM_LITERAL"
 			}"
 		end

	epilog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_EPILOG"
 			}"
 		end

	ignore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_IGNORE"
 			}"
 		end

	public_literal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PUBLIC_LITERAL"
 			}"
 		end


end -- class XML_PARSER_INPUT_STATE_ENUM
