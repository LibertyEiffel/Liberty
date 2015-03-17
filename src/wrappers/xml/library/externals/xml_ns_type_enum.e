-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_NS_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = element_node_low_level)  or else
				(a_value = attribute_node_low_level)  or else
				(a_value = text_node_low_level)  or else
				(a_value = cdata_section_node_low_level)  or else
				(a_value = entity_ref_node_low_level)  or else
				(a_value = entity_node_low_level)  or else
				(a_value = pi_node_low_level)  or else
				(a_value = comment_node_low_level)  or else
				(a_value = document_node_low_level)  or else
				(a_value = document_type_node_low_level)  or else
				(a_value = document_frag_node_low_level)  or else
				(a_value = notation_node_low_level)  or else
				(a_value = html_document_node_low_level)  or else
				(a_value = dtd_node_low_level)  or else
				(a_value = element_decl_low_level)  or else
				(a_value = attribute_decl_low_level)  or else
				(a_value = entity_decl_low_level)  or else
				(a_value = namespace_decl_low_level)  or else
				(a_value = xinclude_start_low_level)  or else
				(a_value = xinclude_end_low_level)  or else
				(a_value = docb_document_node_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_element_node
		do
			value := element_node_low_level
		end

	set_attribute_node
		do
			value := attribute_node_low_level
		end

	set_text_node
		do
			value := text_node_low_level
		end

	set_cdata_section_node
		do
			value := cdata_section_node_low_level
		end

	set_entity_ref_node
		do
			value := entity_ref_node_low_level
		end

	set_entity_node
		do
			value := entity_node_low_level
		end

	set_pi_node
		do
			value := pi_node_low_level
		end

	set_comment_node
		do
			value := comment_node_low_level
		end

	set_document_node
		do
			value := document_node_low_level
		end

	set_document_type_node
		do
			value := document_type_node_low_level
		end

	set_document_frag_node
		do
			value := document_frag_node_low_level
		end

	set_notation_node
		do
			value := notation_node_low_level
		end

	set_html_document_node
		do
			value := html_document_node_low_level
		end

	set_dtd_node
		do
			value := dtd_node_low_level
		end

	set_element_decl
		do
			value := element_decl_low_level
		end

	set_attribute_decl
		do
			value := attribute_decl_low_level
		end

	set_entity_decl
		do
			value := entity_decl_low_level
		end

	set_namespace_decl
		do
			value := namespace_decl_low_level
		end

	set_xinclude_start
		do
			value := xinclude_start_low_level
		end

	set_xinclude_end
		do
			value := xinclude_end_low_level
		end

	set_docb_document_node
		do
			value := docb_document_node_low_level
		end

feature {ANY} -- Queries
	element_node: BOOLEAN
		do
			Result := (value=element_node_low_level)
		end

	attribute_node: BOOLEAN
		do
			Result := (value=attribute_node_low_level)
		end

	text_node: BOOLEAN
		do
			Result := (value=text_node_low_level)
		end

	cdata_section_node: BOOLEAN
		do
			Result := (value=cdata_section_node_low_level)
		end

	entity_ref_node: BOOLEAN
		do
			Result := (value=entity_ref_node_low_level)
		end

	entity_node: BOOLEAN
		do
			Result := (value=entity_node_low_level)
		end

	pi_node: BOOLEAN
		do
			Result := (value=pi_node_low_level)
		end

	comment_node: BOOLEAN
		do
			Result := (value=comment_node_low_level)
		end

	document_node: BOOLEAN
		do
			Result := (value=document_node_low_level)
		end

	document_type_node: BOOLEAN
		do
			Result := (value=document_type_node_low_level)
		end

	document_frag_node: BOOLEAN
		do
			Result := (value=document_frag_node_low_level)
		end

	notation_node: BOOLEAN
		do
			Result := (value=notation_node_low_level)
		end

	html_document_node: BOOLEAN
		do
			Result := (value=html_document_node_low_level)
		end

	dtd_node: BOOLEAN
		do
			Result := (value=dtd_node_low_level)
		end

	element_decl: BOOLEAN
		do
			Result := (value=element_decl_low_level)
		end

	attribute_decl: BOOLEAN
		do
			Result := (value=attribute_decl_low_level)
		end

	entity_decl: BOOLEAN
		do
			Result := (value=entity_decl_low_level)
		end

	namespace_decl: BOOLEAN
		do
			Result := (value=namespace_decl_low_level)
		end

	xinclude_start: BOOLEAN
		do
			Result := (value=xinclude_start_low_level)
		end

	xinclude_end: BOOLEAN
		do
			Result := (value=xinclude_end_low_level)
		end

	docb_document_node: BOOLEAN
		do
			Result := (value=docb_document_node_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	element_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_NODE"
 			}"
 		end

	attribute_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NODE"
 			}"
 		end

	text_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TEXT_NODE"
 			}"
 		end

	cdata_section_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CDATA_SECTION_NODE"
 			}"
 		end

	entity_ref_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_REF_NODE"
 			}"
 		end

	entity_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_NODE"
 			}"
 		end

	pi_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PI_NODE"
 			}"
 		end

	comment_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_COMMENT_NODE"
 			}"
 		end

	document_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_NODE"
 			}"
 		end

	document_type_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_TYPE_NODE"
 			}"
 		end

	document_frag_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCUMENT_FRAG_NODE"
 			}"
 		end

	notation_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NOTATION_NODE"
 			}"
 		end

	html_document_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTML_DOCUMENT_NODE"
 			}"
 		end

	dtd_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NODE"
 			}"
 		end

	element_decl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_DECL"
 			}"
 		end

	attribute_decl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_DECL"
 			}"
 		end

	entity_decl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ENTITY_DECL"
 			}"
 		end

	namespace_decl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NAMESPACE_DECL"
 			}"
 		end

	xinclude_start_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_START"
 			}"
 		end

	xinclude_end_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_END"
 			}"
 		end

	docb_document_node_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DOCB_DOCUMENT_NODE"
 			}"
 		end


end -- class XML_NS_TYPE_ENUM
