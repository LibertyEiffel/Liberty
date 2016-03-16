-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_INPUT_STATE_ENUM

-- Wrapper of enum xmlParserInputState defined in file /usr/include/libxml2/libxml/parser.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = attribute_value_low_level)  or else
				(a_value = cdata_section_low_level)  or else
				(a_value = comment_low_level)  or else
				(a_value = content_low_level)  or else
				(a_value = dtd_low_level)  or else
				(a_value = end_tag_low_level)  or else
				(a_value = entity_decl_low_level)  or else
				(a_value = entity_value_low_level)  or else
				(a_value = eof_low_level)  or else
				(a_value = epilog_low_level)  or else
				(a_value = ignore_low_level)  or else
				(a_value = misc_low_level)  or else
				(a_value = pi_low_level)  or else
				(a_value = prolog_low_level)  or else
				(a_value = public_literal_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = start_tag_low_level)  or else
				(a_value = system_literal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_attribute_value
               do
                       value := attribute_value_low_level
               end

	set_cdata_section
               do
                       value := cdata_section_low_level
               end

	set_comment
               do
                       value := comment_low_level
               end

	set_content
               do
                       value := content_low_level
               end

	set_dtd
               do
                       value := dtd_low_level
               end

	set_end_tag
               do
                       value := end_tag_low_level
               end

	set_entity_decl
               do
                       value := entity_decl_low_level
               end

	set_entity_value
               do
                       value := entity_value_low_level
               end

	set_eof
               do
                       value := eof_low_level
               end

	set_epilog
               do
                       value := epilog_low_level
               end

	set_ignore
               do
                       value := ignore_low_level
               end

	set_misc
               do
                       value := misc_low_level
               end

	set_pi
               do
                       value := pi_low_level
               end

	set_prolog
               do
                       value := prolog_low_level
               end

	set_public_literal
               do
                       value := public_literal_low_level
               end

	set_start
               do
                       value := start_low_level
               end

	set_start_tag
               do
                       value := start_tag_low_level
               end

	set_system_literal
               do
                       value := system_literal_low_level
               end

feature {ANY} -- Queries
       is_attribute_value: BOOLEAN
               do
                       Result := (value=attribute_value_low_level)
               end

       is_cdata_section: BOOLEAN
               do
                       Result := (value=cdata_section_low_level)
               end

       is_comment: BOOLEAN
               do
                       Result := (value=comment_low_level)
               end

       is_content: BOOLEAN
               do
                       Result := (value=content_low_level)
               end

       is_dtd: BOOLEAN
               do
                       Result := (value=dtd_low_level)
               end

       is_end_tag: BOOLEAN
               do
                       Result := (value=end_tag_low_level)
               end

       is_entity_decl: BOOLEAN
               do
                       Result := (value=entity_decl_low_level)
               end

       is_entity_value: BOOLEAN
               do
                       Result := (value=entity_value_low_level)
               end

       is_eof: BOOLEAN
               do
                       Result := (value=eof_low_level)
               end

       is_epilog: BOOLEAN
               do
                       Result := (value=epilog_low_level)
               end

       is_ignore: BOOLEAN
               do
                       Result := (value=ignore_low_level)
               end

       is_misc: BOOLEAN
               do
                       Result := (value=misc_low_level)
               end

       is_pi: BOOLEAN
               do
                       Result := (value=pi_low_level)
               end

       is_prolog: BOOLEAN
               do
                       Result := (value=prolog_low_level)
               end

       is_public_literal: BOOLEAN
               do
                       Result := (value=public_literal_low_level)
               end

       is_start: BOOLEAN
               do
                       Result := (value=start_low_level)
               end

       is_start_tag: BOOLEAN
               do
                       Result := (value=start_tag_low_level)
               end

       is_system_literal: BOOLEAN
               do
                       Result := (value=system_literal_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     attribute_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_ATTRIBUTE_VALUE"
                       }"
               end

     cdata_section_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_CDATA_SECTION"
                       }"
               end

     comment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_COMMENT"
                       }"
               end

     content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_CONTENT"
                       }"
               end

     dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_DTD"
                       }"
               end

     end_tag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_END_TAG"
                       }"
               end

     entity_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_ENTITY_DECL"
                       }"
               end

     entity_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_ENTITY_VALUE"
                       }"
               end

     eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_EOF"
                       }"
               end

     epilog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_EPILOG"
                       }"
               end

     ignore_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_IGNORE"
                       }"
               end

     misc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_MISC"
                       }"
               end

     pi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_PI"
                       }"
               end

     prolog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_PROLOG"
                       }"
               end

     public_literal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_PUBLIC_LITERAL"
                       }"
               end

     start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_START"
                       }"
               end

     start_tag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_START_TAG"
                       }"
               end

     system_literal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSER_SYSTEM_LITERAL"
                       }"
               end


end -- class XML_PARSER_INPUT_STATE_ENUM
