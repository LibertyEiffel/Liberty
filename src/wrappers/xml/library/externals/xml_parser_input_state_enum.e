-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_INPUT_STATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_parser_attribute_value_low_level)  or else
				(a_value = xml_parser_cdata_section_low_level)  or else
				(a_value = xml_parser_comment_low_level)  or else
				(a_value = xml_parser_content_low_level)  or else
				(a_value = xml_parser_dtd_low_level)  or else
				(a_value = xml_parser_end_tag_low_level)  or else
				(a_value = xml_parser_entity_decl_low_level)  or else
				(a_value = xml_parser_entity_value_low_level)  or else
				(a_value = xml_parser_eof_low_level)  or else
				(a_value = xml_parser_epilog_low_level)  or else
				(a_value = xml_parser_ignore_low_level)  or else
				(a_value = xml_parser_misc_low_level)  or else
				(a_value = xml_parser_pi_low_level)  or else
				(a_value = xml_parser_prolog_low_level)  or else
				(a_value = xml_parser_public_literal_low_level)  or else
				(a_value = xml_parser_start_low_level)  or else
				(a_value = xml_parser_start_tag_low_level)  or else
				(a_value = xml_parser_system_literal_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_parser_attribute_value is
		do
			value := xml_parser_attribute_value_low_level
		end

	set_xml_parser_cdata_section is
		do
			value := xml_parser_cdata_section_low_level
		end

	set_xml_parser_comment is
		do
			value := xml_parser_comment_low_level
		end

	set_xml_parser_content is
		do
			value := xml_parser_content_low_level
		end

	set_xml_parser_dtd is
		do
			value := xml_parser_dtd_low_level
		end

	set_xml_parser_end_tag is
		do
			value := xml_parser_end_tag_low_level
		end

	set_xml_parser_entity_decl is
		do
			value := xml_parser_entity_decl_low_level
		end

	set_xml_parser_entity_value is
		do
			value := xml_parser_entity_value_low_level
		end

	set_xml_parser_eof is
		do
			value := xml_parser_eof_low_level
		end

	set_xml_parser_epilog is
		do
			value := xml_parser_epilog_low_level
		end

	set_xml_parser_ignore is
		do
			value := xml_parser_ignore_low_level
		end

	set_xml_parser_misc is
		do
			value := xml_parser_misc_low_level
		end

	set_xml_parser_pi is
		do
			value := xml_parser_pi_low_level
		end

	set_xml_parser_prolog is
		do
			value := xml_parser_prolog_low_level
		end

	set_xml_parser_public_literal is
		do
			value := xml_parser_public_literal_low_level
		end

	set_xml_parser_start is
		do
			value := xml_parser_start_low_level
		end

	set_xml_parser_start_tag is
		do
			value := xml_parser_start_tag_low_level
		end

	set_xml_parser_system_literal is
		do
			value := xml_parser_system_literal_low_level
		end

feature -- Queries
	is_xml_parser_attribute_value: BOOLEAN is
		do
			Result := (value=xml_parser_attribute_value_low_level)
		end

	is_xml_parser_cdata_section: BOOLEAN is
		do
			Result := (value=xml_parser_cdata_section_low_level)
		end

	is_xml_parser_comment: BOOLEAN is
		do
			Result := (value=xml_parser_comment_low_level)
		end

	is_xml_parser_content: BOOLEAN is
		do
			Result := (value=xml_parser_content_low_level)
		end

	is_xml_parser_dtd: BOOLEAN is
		do
			Result := (value=xml_parser_dtd_low_level)
		end

	is_xml_parser_end_tag: BOOLEAN is
		do
			Result := (value=xml_parser_end_tag_low_level)
		end

	is_xml_parser_entity_decl: BOOLEAN is
		do
			Result := (value=xml_parser_entity_decl_low_level)
		end

	is_xml_parser_entity_value: BOOLEAN is
		do
			Result := (value=xml_parser_entity_value_low_level)
		end

	is_xml_parser_eof: BOOLEAN is
		do
			Result := (value=xml_parser_eof_low_level)
		end

	is_xml_parser_epilog: BOOLEAN is
		do
			Result := (value=xml_parser_epilog_low_level)
		end

	is_xml_parser_ignore: BOOLEAN is
		do
			Result := (value=xml_parser_ignore_low_level)
		end

	is_xml_parser_misc: BOOLEAN is
		do
			Result := (value=xml_parser_misc_low_level)
		end

	is_xml_parser_pi: BOOLEAN is
		do
			Result := (value=xml_parser_pi_low_level)
		end

	is_xml_parser_prolog: BOOLEAN is
		do
			Result := (value=xml_parser_prolog_low_level)
		end

	is_xml_parser_public_literal: BOOLEAN is
		do
			Result := (value=xml_parser_public_literal_low_level)
		end

	is_xml_parser_start: BOOLEAN is
		do
			Result := (value=xml_parser_start_low_level)
		end

	is_xml_parser_start_tag: BOOLEAN is
		do
			Result := (value=xml_parser_start_tag_low_level)
		end

	is_xml_parser_system_literal: BOOLEAN is
		do
			Result := (value=xml_parser_system_literal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parser_attribute_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ATTRIBUTE_VALUE"
 			}"
 		end

	xml_parser_cdata_section_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_CDATA_SECTION"
 			}"
 		end

	xml_parser_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_COMMENT"
 			}"
 		end

	xml_parser_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_CONTENT"
 			}"
 		end

	xml_parser_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_DTD"
 			}"
 		end

	xml_parser_end_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_END_TAG"
 			}"
 		end

	xml_parser_entity_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ENTITY_DECL"
 			}"
 		end

	xml_parser_entity_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_ENTITY_VALUE"
 			}"
 		end

	xml_parser_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_EOF"
 			}"
 		end

	xml_parser_epilog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_EPILOG"
 			}"
 		end

	xml_parser_ignore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_IGNORE"
 			}"
 		end

	xml_parser_misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_MISC"
 			}"
 		end

	xml_parser_pi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PI"
 			}"
 		end

	xml_parser_prolog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PROLOG"
 			}"
 		end

	xml_parser_public_literal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_PUBLIC_LITERAL"
 			}"
 		end

	xml_parser_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_START"
 			}"
 		end

	xml_parser_start_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_START_TAG"
 			}"
 		end

	xml_parser_system_literal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSER_SYSTEM_LITERAL"
 			}"
 		end


end -- class XML_PARSER_INPUT_STATE_ENUM
