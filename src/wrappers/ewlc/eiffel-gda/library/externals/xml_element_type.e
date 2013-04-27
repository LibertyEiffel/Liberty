-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_element_node) or else 
				(a_value = xml_attribute_node) or else 
				(a_value = xml_text_node) or else 
				(a_value = xml_cdata_section_node) or else 
				(a_value = xml_entity_ref_node) or else 
				(a_value = xml_entity_node) or else 
				(a_value = xml_pi_node) or else 
				(a_value = xml_comment_node) or else 
				(a_value = xml_document_node) or else 
				(a_value = xml_document_type_node) or else 
				(a_value = xml_document_frag_node) or else 
				(a_value = xml_notation_node) or else 
				(a_value = xml_html_document_node) or else 
				(a_value = xml_dtd_node) or else 
				(a_value = xml_element_decl) or else 
				(a_value = xml_attribute_decl) or else 
				(a_value = xml_entity_decl) or else 
				(a_value = xml_namespace_decl) or else 
				(a_value = xml_xinclude_start) or else 
				(a_value = xml_xinclude_end) or else 
				(a_value = xml_docb_document_node))
		end


feature {ANY} -- Setters
	default_create, set_element_node is
		do
			value := xml_element_node
		end

	set_attribute_node is
		do
			value := xml_attribute_node
		end

	set_text_node is
		do
			value := xml_text_node
		end

	set_cdata_section_node is
		do
			value := xml_cdata_section_node
		end

	set_entity_ref_node is
		do
			value := xml_entity_ref_node
		end

	set_entity_node is
		do
			value := xml_entity_node
		end

	set_pi_node is
		do
			value := xml_pi_node
		end

	set_comment_node is
		do
			value := xml_comment_node
		end

	set_document_node is
		do
			value := xml_document_node
		end

	set_document_type_node is
		do
			value := xml_document_type_node
		end

	set_document_frag_node is
		do
			value := xml_document_frag_node
		end

	set_notation_node is
		do
			value := xml_notation_node
		end

	set_html_document_node is
		do
			value := xml_html_document_node
		end

	set_dtd_node is
		do
			value := xml_dtd_node
		end

	set_element_decl is
		do
			value := xml_element_decl
		end

	set_attribute_decl is
		do
			value := xml_attribute_decl
		end

	set_entity_decl is
		do
			value := xml_entity_decl
		end

	set_namespace_decl is
		do
			value := xml_namespace_decl
		end

	set_xinclude_start is
		do
			value := xml_xinclude_start
		end

	set_xinclude_end is
		do
			value := xml_xinclude_end
		end

	set_docb_document_node is
		do
			value := xml_docb_document_node
		end


feature {ANY} -- Queries
	is_element_node: BOOLEAN is
		do
			Result := (value=xml_element_node)
		end

	is_attribute_node: BOOLEAN is
		do
			Result := (value=xml_attribute_node)
		end

	is_text_node: BOOLEAN is
		do
			Result := (value=xml_text_node)
		end

	is_cdata_section_node: BOOLEAN is
		do
			Result := (value=xml_cdata_section_node)
		end

	is_entity_ref_node: BOOLEAN is
		do
			Result := (value=xml_entity_ref_node)
		end

	is_entity_node: BOOLEAN is
		do
			Result := (value=xml_entity_node)
		end

	is_pi_node: BOOLEAN is
		do
			Result := (value=xml_pi_node)
		end

	is_comment_node: BOOLEAN is
		do
			Result := (value=xml_comment_node)
		end

	is_document_node: BOOLEAN is
		do
			Result := (value=xml_document_node)
		end

	is_document_type_node: BOOLEAN is
		do
			Result := (value=xml_document_type_node)
		end

	is_document_frag_node: BOOLEAN is
		do
			Result := (value=xml_document_frag_node)
		end

	is_notation_node: BOOLEAN is
		do
			Result := (value=xml_notation_node)
		end

	is_html_document_node: BOOLEAN is
		do
			Result := (value=xml_html_document_node)
		end

	is_dtd_node: BOOLEAN is
		do
			Result := (value=xml_dtd_node)
		end

	is_element_decl: BOOLEAN is
		do
			Result := (value=xml_element_decl)
		end

	is_attribute_decl: BOOLEAN is
		do
			Result := (value=xml_attribute_decl)
		end

	is_entity_decl: BOOLEAN is
		do
			Result := (value=xml_entity_decl)
		end

	is_namespace_decl: BOOLEAN is
		do
			Result := (value=xml_namespace_decl)
		end

	is_xinclude_start: BOOLEAN is
		do
			Result := (value=xml_xinclude_start)
		end

	is_xinclude_end: BOOLEAN is
		do
			Result := (value=xml_xinclude_end)
		end

	is_docb_document_node: BOOLEAN is
		do
			Result := (value=xml_docb_document_node)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_NODE"
		end

	xml_attribute_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NODE"
		end

	xml_text_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_TEXT_NODE"
		end

	xml_cdata_section_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CDATA_SECTION_NODE"
		end

	xml_entity_ref_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ENTITY_REF_NODE"
		end

	xml_entity_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ENTITY_NODE"
		end

	xml_pi_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PI_NODE"
		end

	xml_comment_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_COMMENT_NODE"
		end

	xml_document_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DOCUMENT_NODE"
		end

	xml_document_type_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DOCUMENT_TYPE_NODE"
		end

	xml_document_frag_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DOCUMENT_FRAG_NODE"
		end

	xml_notation_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NOTATION_NODE"
		end

	xml_html_document_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTML_DOCUMENT_NODE"
		end

	xml_dtd_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NODE"
		end

	xml_element_decl: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_DECL"
		end

	xml_attribute_decl: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_DECL"
		end

	xml_entity_decl: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ENTITY_DECL"
		end

	xml_namespace_decl: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NAMESPACE_DECL"
		end

	xml_xinclude_start: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_START"
		end

	xml_xinclude_end: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_END"
		end

	xml_docb_document_node: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DOCB_DOCUMENT_NODE"
		end


end

