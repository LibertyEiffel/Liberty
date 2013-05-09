-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class VALID_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_attribute_decl (a_ctxt: POINTER; a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_ns: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER): POINTER is
 		-- xmlAddAttributeDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddAttributeDecl"
		}"
		end

	xml_add_element_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER): POINTER is
 		-- xmlAddElementDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddElementDecl"
		}"
		end

	xml_add_id (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER is
 		-- xmlAddID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddID"
		}"
		end

	xml_add_notation_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlAddNotationDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddNotationDecl"
		}"
		end

	xml_add_ref (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER is
 		-- xmlAddRef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddRef"
		}"
		end

	xml_copy_attribute_table (a_table: POINTER): POINTER is
 		-- xmlCopyAttributeTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyAttributeTable"
		}"
		end

	xml_copy_doc_element_content (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlCopyDocElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDocElementContent"
		}"
		end

	xml_copy_element_content (a_content: POINTER): POINTER is
 		-- xmlCopyElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyElementContent"
		}"
		end

	xml_copy_element_table (a_table: POINTER): POINTER is
 		-- xmlCopyElementTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyElementTable"
		}"
		end

	xml_copy_enumeration (a_cur: POINTER): POINTER is
 		-- xmlCopyEnumeration
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyEnumeration"
		}"
		end

	xml_copy_notation_table (a_table: POINTER): POINTER is
 		-- xmlCopyNotationTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNotationTable"
		}"
		end

	xml_create_enumeration (a_name: POINTER): POINTER is
 		-- xmlCreateEnumeration
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateEnumeration"
		}"
		end

	xml_dump_attribute_decl (a_buf: POINTER; an_attr: POINTER) is
 		-- xmlDumpAttributeDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpAttributeDecl"
		}"
		end

	xml_dump_attribute_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpAttributeTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpAttributeTable"
		}"
		end

	xml_dump_element_decl (a_buf: POINTER; an_elem: POINTER) is
 		-- xmlDumpElementDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpElementDecl"
		}"
		end

	xml_dump_element_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpElementTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpElementTable"
		}"
		end

	xml_dump_notation_decl (a_buf: POINTER; a_nota: POINTER) is
 		-- xmlDumpNotationDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpNotationDecl"
		}"
		end

	xml_dump_notation_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpNotationTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpNotationTable"
		}"
		end

	xml_free_attribute_table (a_table: POINTER) is
 		-- xmlFreeAttributeTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeAttributeTable"
		}"
		end

	xml_free_doc_element_content (a_doc: POINTER; a_cur: POINTER) is
 		-- xmlFreeDocElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDocElementContent"
		}"
		end

	xml_free_element_content (a_cur: POINTER) is
 		-- xmlFreeElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeElementContent"
		}"
		end

	xml_free_element_table (a_table: POINTER) is
 		-- xmlFreeElementTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeElementTable"
		}"
		end

	xml_free_enumeration (a_cur: POINTER) is
 		-- xmlFreeEnumeration
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeEnumeration"
		}"
		end

	xml_free_idtable (a_table: POINTER) is
 		-- xmlFreeIDTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeIDTable"
		}"
		end

	xml_free_notation_table (a_table: POINTER) is
 		-- xmlFreeNotationTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNotationTable"
		}"
		end

	xml_free_ref_table (a_table: POINTER) is
 		-- xmlFreeRefTable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeRefTable"
		}"
		end

	xml_free_valid_ctxt (an_argument_l1983_c7: POINTER) is
 		-- xmlFreeValidCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeValidCtxt"
		}"
		end

	xml_get_dtd_attr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdAttrDesc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdAttrDesc"
		}"
		end

	xml_get_dtd_element_desc (a_dtd: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdElementDesc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdElementDesc"
		}"
		end

	xml_get_dtd_notation_desc (a_dtd: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdNotationDesc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdNotationDesc"
		}"
		end

	xml_get_dtd_qattr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlGetDtdQAttrDesc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdQAttrDesc"
		}"
		end

	xml_get_dtd_qelement_desc (a_dtd: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlGetDtdQElementDesc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdQElementDesc"
		}"
		end

	xml_get_id (a_doc: POINTER; an_id: POINTER): POINTER is
 		-- xmlGetID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetID"
		}"
		end

	xml_get_refs (a_doc: POINTER; an_id: POINTER): POINTER is
 		-- xmlGetRefs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetRefs"
		}"
		end

	xml_is_id (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER is
 		-- xmlIsID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsID"
		}"
		end

	xml_is_mixed_element (a_doc: POINTER; a_name: POINTER): INTEGER is
 		-- xmlIsMixedElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsMixedElement"
		}"
		end

	xml_is_ref (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER is
 		-- xmlIsRef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsRef"
		}"
		end

	xml_new_doc_element_content (a_doc: POINTER; a_name: POINTER; a_type: INTEGER): POINTER is
 		-- xmlNewDocElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocElementContent"
		}"
		end

	xml_new_element_content (a_name: POINTER; a_type: INTEGER): POINTER is
 		-- xmlNewElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewElementContent"
		}"
		end

	xml_new_valid_ctxt: POINTER is
 		-- xmlNewValidCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewValidCtxt()"
		}"
		end

	xml_remove_id (a_doc: POINTER; an_attr: POINTER): INTEGER is
 		-- xmlRemoveID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveID"
		}"
		end

	xml_remove_ref (a_doc: POINTER; an_attr: POINTER): INTEGER is
 		-- xmlRemoveRef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveRef"
		}"
		end

	xml_snprintf_element_content (a_buf: POINTER; a_size: INTEGER; a_content: POINTER; an_englob: INTEGER) is
 		-- xmlSnprintfElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSnprintfElementContent"
		}"
		end

	xml_sprintf_element_content (a_buf: POINTER; a_content: POINTER; an_englob: INTEGER) is
 		-- xmlSprintfElementContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSprintfElementContent"
		}"
		end

	xml_valid_build_content_model (a_ctxt: POINTER; an_elem: POINTER): INTEGER is
 		-- xmlValidBuildContentModel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidBuildContentModel"
		}"
		end

	xml_valid_ctxt_normalize_attribute_value (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlValidCtxtNormalizeAttributeValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidCtxtNormalizeAttributeValue"
		}"
		end

	xml_valid_get_potential_children (a_ctree: POINTER; a_names: POINTER; a_len: POINTER; a_max: INTEGER): INTEGER is
 		-- xmlValidGetPotentialChildren
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidGetPotentialChildren"
		}"
		end

	xml_valid_get_valid_elements (a_prev: POINTER; a_next: POINTER; a_names: POINTER; a_max: INTEGER): INTEGER is
 		-- xmlValidGetValidElements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidGetValidElements"
		}"
		end

	xml_valid_normalize_attribute_value (a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlValidNormalizeAttributeValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidNormalizeAttributeValue"
		}"
		end

	xml_validate_attribute_decl (a_ctxt: POINTER; a_doc: POINTER; an_attr: POINTER): INTEGER is
 		-- xmlValidateAttributeDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateAttributeDecl"
		}"
		end

	xml_validate_attribute_value (a_type: INTEGER; a_value: POINTER): INTEGER is
 		-- xmlValidateAttributeValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateAttributeValue"
		}"
		end

	xml_validate_document (a_ctxt: POINTER; a_doc: POINTER): INTEGER is
 		-- xmlValidateDocument
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDocument"
		}"
		end

	xml_validate_document_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER is
 		-- xmlValidateDocumentFinal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDocumentFinal"
		}"
		end

	xml_validate_dtd (a_ctxt: POINTER; a_doc: POINTER; a_dtd: POINTER): INTEGER is
 		-- xmlValidateDtd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDtd"
		}"
		end

	xml_validate_dtd_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER is
 		-- xmlValidateDtdFinal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDtdFinal"
		}"
		end

	xml_validate_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER is
 		-- xmlValidateElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateElement"
		}"
		end

	xml_validate_element_decl (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER is
 		-- xmlValidateElementDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateElementDecl"
		}"
		end

	xml_validate_name_value (a_value: POINTER): INTEGER is
 		-- xmlValidateNameValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNameValue"
		}"
		end

	xml_validate_names_value (a_value: POINTER): INTEGER is
 		-- xmlValidateNamesValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNamesValue"
		}"
		end

	xml_validate_nmtoken_value (a_value: POINTER): INTEGER is
 		-- xmlValidateNmtokenValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNmtokenValue"
		}"
		end

	xml_validate_nmtokens_value (a_value: POINTER): INTEGER is
 		-- xmlValidateNmtokensValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNmtokensValue"
		}"
		end

	xml_validate_notation_decl (a_ctxt: POINTER; a_doc: POINTER; a_nota: POINTER): INTEGER is
 		-- xmlValidateNotationDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNotationDecl"
		}"
		end

	xml_validate_notation_use (a_ctxt: POINTER; a_doc: POINTER; a_notation_name: POINTER): INTEGER is
 		-- xmlValidateNotationUse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNotationUse"
		}"
		end

	xml_validate_one_attribute (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; an_attr: POINTER; a_value: POINTER): INTEGER is
 		-- xmlValidateOneAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneAttribute"
		}"
		end

	xml_validate_one_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER is
 		-- xmlValidateOneElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneElement"
		}"
		end

	xml_validate_one_namespace (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_prefix: POINTER; a_ns: POINTER; a_value: POINTER): INTEGER is
 		-- xmlValidateOneNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneNamespace"
		}"
		end

	xml_validate_pop_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER is
 		-- xmlValidatePopElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePopElement"
		}"
		end

	xml_validate_push_cdata (a_ctxt: POINTER; a_data: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlValidatePushCData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePushCData"
		}"
		end

	xml_validate_push_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER is
 		-- xmlValidatePushElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePushElement"
		}"
		end

	xml_validate_root (a_ctxt: POINTER; a_doc: POINTER): INTEGER is
 		-- xmlValidateRoot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateRoot"
		}"
		end


end -- class VALID_EXTERNALS
