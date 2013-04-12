-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XMLELEMENTTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_attribute_decl_low_level)  or else
				(a_value = xml_attribute_node_low_level)  or else
				(a_value = xml_cdata_section_node_low_level)  or else
				(a_value = xml_comment_node_low_level)  or else
				(a_value = xml_docb_document_node_low_level)  or else
				(a_value = xml_document_frag_node_low_level)  or else
				(a_value = xml_document_node_low_level)  or else
				(a_value = xml_document_type_node_low_level)  or else
				(a_value = xml_dtd_node_low_level)  or else
				(a_value = xml_element_decl_low_level)  or else
				(a_value = xml_element_node_low_level)  or else
				(a_value = xml_entity_decl_low_level)  or else
				(a_value = xml_entity_node_low_level)  or else
				(a_value = xml_entity_ref_node_low_level)  or else
				(a_value = xml_html_document_node_low_level)  or else
				(a_value = xml_namespace_decl_low_level)  or else
				(a_value = xml_notation_node_low_level)  or else
				(a_value = xml_pi_node_low_level)  or else
				(a_value = xml_text_node_low_level)  or else
				(a_value = xml_xinclude_end_low_level)  or else
				(a_value = xml_xinclude_start_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_attribute_decl is
		do
			value := xml_attribute_decl_low_level
		end

	set_xml_attribute_node is
		do
			value := xml_attribute_node_low_level
		end

	set_xml_cdata_section_node is
		do
			value := xml_cdata_section_node_low_level
		end

	set_xml_comment_node is
		do
			value := xml_comment_node_low_level
		end

	set_xml_docb_document_node is
		do
			value := xml_docb_document_node_low_level
		end

	set_xml_document_frag_node is
		do
			value := xml_document_frag_node_low_level
		end

	set_xml_document_node is
		do
			value := xml_document_node_low_level
		end

	set_xml_document_type_node is
		do
			value := xml_document_type_node_low_level
		end

	set_xml_dtd_node is
		do
			value := xml_dtd_node_low_level
		end

	set_xml_element_decl is
		do
			value := xml_element_decl_low_level
		end

	set_xml_element_node is
		do
			value := xml_element_node_low_level
		end

	set_xml_entity_decl is
		do
			value := xml_entity_decl_low_level
		end

	set_xml_entity_node is
		do
			value := xml_entity_node_low_level
		end

	set_xml_entity_ref_node is
		do
			value := xml_entity_ref_node_low_level
		end

	set_xml_html_document_node is
		do
			value := xml_html_document_node_low_level
		end

	set_xml_namespace_decl is
		do
			value := xml_namespace_decl_low_level
		end

	set_xml_notation_node is
		do
			value := xml_notation_node_low_level
		end

	set_xml_pi_node is
		do
			value := xml_pi_node_low_level
		end

	set_xml_text_node is
		do
			value := xml_text_node_low_level
		end

	set_xml_xinclude_end is
		do
			value := xml_xinclude_end_low_level
		end

	set_xml_xinclude_start is
		do
			value := xml_xinclude_start_low_level
		end

feature -- Queries
	is_xml_attribute_decl: BOOLEAN is
		do
			Result := (value=xml_attribute_decl_low_level)
		end

	is_xml_attribute_node: BOOLEAN is
		do
			Result := (value=xml_attribute_node_low_level)
		end

	is_xml_cdata_section_node: BOOLEAN is
		do
			Result := (value=xml_cdata_section_node_low_level)
		end

	is_xml_comment_node: BOOLEAN is
		do
			Result := (value=xml_comment_node_low_level)
		end

	is_xml_docb_document_node: BOOLEAN is
		do
			Result := (value=xml_docb_document_node_low_level)
		end

	is_xml_document_frag_node: BOOLEAN is
		do
			Result := (value=xml_document_frag_node_low_level)
		end

	is_xml_document_node: BOOLEAN is
		do
			Result := (value=xml_document_node_low_level)
		end

	is_xml_document_type_node: BOOLEAN is
		do
			Result := (value=xml_document_type_node_low_level)
		end

	is_xml_dtd_node: BOOLEAN is
		do
			Result := (value=xml_dtd_node_low_level)
		end

	is_xml_element_decl: BOOLEAN is
		do
			Result := (value=xml_element_decl_low_level)
		end

	is_xml_element_node: BOOLEAN is
		do
			Result := (value=xml_element_node_low_level)
		end

	is_xml_entity_decl: BOOLEAN is
		do
			Result := (value=xml_entity_decl_low_level)
		end

	is_xml_entity_node: BOOLEAN is
		do
			Result := (value=xml_entity_node_low_level)
		end

	is_xml_entity_ref_node: BOOLEAN is
		do
			Result := (value=xml_entity_ref_node_low_level)
		end

	is_xml_html_document_node: BOOLEAN is
		do
			Result := (value=xml_html_document_node_low_level)
		end

	is_xml_namespace_decl: BOOLEAN is
		do
			Result := (value=xml_namespace_decl_low_level)
		end

	is_xml_notation_node: BOOLEAN is
		do
			Result := (value=xml_notation_node_low_level)
		end

	is_xml_pi_node: BOOLEAN is
		do
			Result := (value=xml_pi_node_low_level)
		end

	is_xml_text_node: BOOLEAN is
		do
			Result := (value=xml_text_node_low_level)
		end

	is_xml_xinclude_end: BOOLEAN is
		do
			Result := (value=xml_xinclude_end_low_level)
		end

	is_xml_xinclude_start: BOOLEAN is
		do
			Result := (value=xml_xinclude_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_DECL"
 			}"
 		end

	xml_attribute_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NODE"
 			}"
 		end

	xml_cdata_section_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CDATA_SECTION_NODE"
 			}"
 		end

	xml_comment_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_COMMENT_NODE"
 			}"
 		end

	xml_docb_document_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCB_DOCUMENT_NODE"
 			}"
 		end

	xml_document_frag_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_FRAG_NODE"
 			}"
 		end

	xml_document_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_NODE"
 			}"
 		end

	xml_document_type_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_TYPE_NODE"
 			}"
 		end

	xml_dtd_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NODE"
 			}"
 		end

	xml_element_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_DECL"
 			}"
 		end

	xml_element_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_NODE"
 			}"
 		end

	xml_entity_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_DECL"
 			}"
 		end

	xml_entity_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_NODE"
 			}"
 		end

	xml_entity_ref_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_REF_NODE"
 			}"
 		end

	xml_html_document_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTML_DOCUMENT_NODE"
 			}"
 		end

	xml_namespace_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NAMESPACE_DECL"
 			}"
 		end

	xml_notation_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NOTATION_NODE"
 			}"
 		end

	xml_pi_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PI_NODE"
 			}"
 		end

	xml_text_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TEXT_NODE"
 			}"
 		end

	xml_xinclude_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_END"
 			}"
 		end

	xml_xinclude_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_START"
 			}"
 		end


end -- class XMLELEMENTTYPE_ENUM
