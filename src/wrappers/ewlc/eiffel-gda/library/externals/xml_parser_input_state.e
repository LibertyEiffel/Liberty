-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_INPUT_STATE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_parser_eof) or else 
				(a_value = xml_parser_start) or else 
				(a_value = xml_parser_misc) or else 
				(a_value = xml_parser_pi) or else 
				(a_value = xml_parser_dtd) or else 
				(a_value = xml_parser_prolog) or else 
				(a_value = xml_parser_comment) or else 
				(a_value = xml_parser_start_tag) or else 
				(a_value = xml_parser_content) or else 
				(a_value = xml_parser_cdata_section) or else 
				(a_value = xml_parser_end_tag) or else 
				(a_value = xml_parser_entity_decl) or else 
				(a_value = xml_parser_entity_value) or else 
				(a_value = xml_parser_attribute_value) or else 
				(a_value = xml_parser_system_literal) or else 
				(a_value = xml_parser_epilog) or else 
				(a_value = xml_parser_ignore) or else 
				(a_value = xml_parser_public_literal))
		end


feature {ANY} -- Setters
	default_create, set_eof
		do
			value := xml_parser_eof
		end

	set_start
		do
			value := xml_parser_start
		end

	set_misc
		do
			value := xml_parser_misc
		end

	set_pi
		do
			value := xml_parser_pi
		end

	set_dtd
		do
			value := xml_parser_dtd
		end

	set_prolog
		do
			value := xml_parser_prolog
		end

	set_comment
		do
			value := xml_parser_comment
		end

	set_start_tag
		do
			value := xml_parser_start_tag
		end

	set_content
		do
			value := xml_parser_content
		end

	set_cdata_section
		do
			value := xml_parser_cdata_section
		end

	set_end_tag
		do
			value := xml_parser_end_tag
		end

	set_entity_decl
		do
			value := xml_parser_entity_decl
		end

	set_entity_value
		do
			value := xml_parser_entity_value
		end

	set_attribute_value
		do
			value := xml_parser_attribute_value
		end

	set_system_literal
		do
			value := xml_parser_system_literal
		end

	set_epilog
		do
			value := xml_parser_epilog
		end

	set_ignore
		do
			value := xml_parser_ignore
		end

	set_public_literal
		do
			value := xml_parser_public_literal
		end


feature {ANY} -- Queries
	is_eof: BOOLEAN
		do
			Result := (value=xml_parser_eof)
		end

	is_start: BOOLEAN
		do
			Result := (value=xml_parser_start)
		end

	is_misc: BOOLEAN
		do
			Result := (value=xml_parser_misc)
		end

	is_pi: BOOLEAN
		do
			Result := (value=xml_parser_pi)
		end

	is_dtd: BOOLEAN
		do
			Result := (value=xml_parser_dtd)
		end

	is_prolog: BOOLEAN
		do
			Result := (value=xml_parser_prolog)
		end

	is_comment: BOOLEAN
		do
			Result := (value=xml_parser_comment)
		end

	is_start_tag: BOOLEAN
		do
			Result := (value=xml_parser_start_tag)
		end

	is_content: BOOLEAN
		do
			Result := (value=xml_parser_content)
		end

	is_cdata_section: BOOLEAN
		do
			Result := (value=xml_parser_cdata_section)
		end

	is_end_tag: BOOLEAN
		do
			Result := (value=xml_parser_end_tag)
		end

	is_entity_decl: BOOLEAN
		do
			Result := (value=xml_parser_entity_decl)
		end

	is_entity_value: BOOLEAN
		do
			Result := (value=xml_parser_entity_value)
		end

	is_attribute_value: BOOLEAN
		do
			Result := (value=xml_parser_attribute_value)
		end

	is_system_literal: BOOLEAN
		do
			Result := (value=xml_parser_system_literal)
		end

	is_epilog: BOOLEAN
		do
			Result := (value=xml_parser_epilog)
		end

	is_ignore: BOOLEAN
		do
			Result := (value=xml_parser_ignore)
		end

	is_public_literal: BOOLEAN
		do
			Result := (value=xml_parser_public_literal)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parser_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_EOF"
		end

	xml_parser_start: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_START"
		end

	xml_parser_misc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_MISC"
		end

	xml_parser_pi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_PI"
		end

	xml_parser_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_DTD"
		end

	xml_parser_prolog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_PROLOG"
		end

	xml_parser_comment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_COMMENT"
		end

	xml_parser_start_tag: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_START_TAG"
		end

	xml_parser_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_CONTENT"
		end

	xml_parser_cdata_section: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_CDATA_SECTION"
		end

	xml_parser_end_tag: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_END_TAG"
		end

	xml_parser_entity_decl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_ENTITY_DECL"
		end

	xml_parser_entity_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_ENTITY_VALUE"
		end

	xml_parser_attribute_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_ATTRIBUTE_VALUE"
		end

	xml_parser_system_literal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_SYSTEM_LITERAL"
		end

	xml_parser_epilog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_EPILOG"
		end

	xml_parser_ignore: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_IGNORE"
		end

	xml_parser_public_literal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSER_PUBLIC_LITERAL"
		end


end

