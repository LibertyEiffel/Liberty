-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class VALID_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_add_attribute_decl (a_ctxt: POINTER; a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_ns: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER): POINTER is
 		-- xmlAddAttributeDecl (node at line 50)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddAttributeDecl"
		}"
		end

	xml_free_idtable (a_table: POINTER) is
 		-- xmlFreeIDTable (node at line 296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeIDTable"
		}"
		end

	xml_free_element_table (a_table: POINTER) is
 		-- xmlFreeElementTable (node at line 457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeElementTable"
		}"
		end

	xml_copy_doc_element_content (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlCopyDocElementContent (node at line 502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDocElementContent"
		}"
		end

	xml_new_element_content (a_name: POINTER; a_type: INTEGER): POINTER is
 		-- xmlNewElementContent (node at line 1565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewElementContent"
		}"
		end

	xml_validate_notation_use (a_ctxt: POINTER; a_doc: POINTER; a_notation_name: POINTER): INTEGER_32 is
 		-- xmlValidateNotationUse (node at line 1646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNotationUse"
		}"
		end

	xml_create_enumeration (a_name: POINTER): POINTER is
 		-- xmlCreateEnumeration (node at line 1701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateEnumeration"
		}"
		end

	xml_validate_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER_32 is
 		-- xmlValidateElement (node at line 1714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateElement"
		}"
		end

	xml_add_element_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER): POINTER is
 		-- xmlAddElementDecl (node at line 1724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddElementDecl"
		}"
		end

	xml_free_doc_element_content (a_doc: POINTER; a_cur: POINTER) is
 		-- xmlFreeDocElementContent (node at line 1731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDocElementContent"
		}"
		end

	xml_copy_element_table (a_table: POINTER): POINTER is
 		-- xmlCopyElementTable (node at line 1780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyElementTable"
		}"
		end

	xml_validate_notation_decl (a_ctxt: POINTER; a_doc: POINTER; a_nota: POINTER): INTEGER_32 is
 		-- xmlValidateNotationDecl (node at line 1794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNotationDecl"
		}"
		end

	xml_validate_dtd_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER_32 is
 		-- xmlValidateDtdFinal (node at line 1854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDtdFinal"
		}"
		end

	xml_new_doc_element_content (a_doc: POINTER; a_name: POINTER; a_type: INTEGER): POINTER is
 		-- xmlNewDocElementContent (node at line 1909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocElementContent"
		}"
		end

	xml_free_valid_ctxt (an_argument_l1950_c7: POINTER) is
 		-- xmlFreeValidCtxt (node at line 1949)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeValidCtxt"
		}"
		end

	xml_validate_one_attribute (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; an_attr: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlValidateOneAttribute (node at line 2188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneAttribute"
		}"
		end

	xml_valid_get_potential_children (a_ctree: POINTER; a_names: POINTER; a_len: POINTER; a_max: INTEGER_32): INTEGER_32 is
 		-- xmlValidGetPotentialChildren (node at line 2246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidGetPotentialChildren"
		}"
		end

	xml_sprintf_element_content (a_buf: POINTER; a_content: POINTER; an_englob: INTEGER_32) is
 		-- xmlSprintfElementContent (node at line 2435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSprintfElementContent"
		}"
		end

	xml_add_notation_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlAddNotationDecl (node at line 2559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddNotationDecl"
		}"
		end

	xml_free_notation_table (a_table: POINTER) is
 		-- xmlFreeNotationTable (node at line 2639)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNotationTable"
		}"
		end

	xml_validate_nmtokens_value (a_value: POINTER): INTEGER_32 is
 		-- xmlValidateNmtokensValue (node at line 2719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNmtokensValue"
		}"
		end

	xml_free_ref_table (a_table: POINTER) is
 		-- xmlFreeRefTable (node at line 2758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeRefTable"
		}"
		end

	xml_validate_root (a_ctxt: POINTER; a_doc: POINTER): INTEGER_32 is
 		-- xmlValidateRoot (node at line 2810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateRoot"
		}"
		end

	xml_validate_pop_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER_32 is
 		-- xmlValidatePopElement (node at line 2882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePopElement"
		}"
		end

	xml_free_element_content (a_cur: POINTER) is
 		-- xmlFreeElementContent (node at line 2909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeElementContent"
		}"
		end

	xml_is_mixed_element (a_doc: POINTER; a_name: POINTER): INTEGER_32 is
 		-- xmlIsMixedElement (node at line 2978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsMixedElement"
		}"
		end

	xml_add_id (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER is
 		-- xmlAddID (node at line 3073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddID"
		}"
		end

	xml_get_dtd_element_desc (a_dtd: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdElementDesc (node at line 3124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdElementDesc"
		}"
		end

	xml_get_dtd_qattr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlGetDtdQAttrDesc (node at line 3178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdQAttrDesc"
		}"
		end

	xml_validate_one_namespace (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_prefix: POINTER; a_ns: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlValidateOneNamespace (node at line 3211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneNamespace"
		}"
		end

	xml_validate_push_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER_32 is
 		-- xmlValidatePushElement (node at line 3313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePushElement"
		}"
		end

	xml_is_ref (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER_32 is
 		-- xmlIsRef (node at line 3433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsRef"
		}"
		end

	xml_free_enumeration (a_cur: POINTER) is
 		-- xmlFreeEnumeration (node at line 3554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeEnumeration"
		}"
		end

	xml_is_id (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER_32 is
 		-- xmlIsID (node at line 3565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsID"
		}"
		end

	xml_dump_notation_decl (a_buf: POINTER; a_nota: POINTER) is
 		-- xmlDumpNotationDecl (node at line 3636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpNotationDecl"
		}"
		end

	xml_new_valid_ctxt: POINTER is
 		-- xmlNewValidCtxt (node at line 3857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewValidCtxt()"
		}"
		end

	xml_validate_attribute_value (a_type: INTEGER; a_value: POINTER): INTEGER_32 is
 		-- xmlValidateAttributeValue (node at line 3882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateAttributeValue"
		}"
		end

	xml_validate_element_decl (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER_32 is
 		-- xmlValidateElementDecl (node at line 3932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateElementDecl"
		}"
		end

	xml_valid_get_valid_elements (a_prev: POINTER; a_next: POINTER; a_names: POINTER; a_max: INTEGER_32): INTEGER_32 is
 		-- xmlValidGetValidElements (node at line 4061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidGetValidElements"
		}"
		end

	xml_dump_element_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpElementTable (node at line 4072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpElementTable"
		}"
		end

	xml_add_ref (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER is
 		-- xmlAddRef (node at line 4124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddRef"
		}"
		end

	xml_get_refs (a_doc: POINTER; an_id: POINTER): POINTER is
 		-- xmlGetRefs (node at line 4137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetRefs"
		}"
		end

	xml_valid_ctxt_normalize_attribute_value (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlValidCtxtNormalizeAttributeValue (node at line 4298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidCtxtNormalizeAttributeValue"
		}"
		end

	xml_validate_dtd (a_ctxt: POINTER; a_doc: POINTER; a_dtd: POINTER): INTEGER_32 is
 		-- xmlValidateDtd (node at line 4352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDtd"
		}"
		end

	xml_validate_document (a_ctxt: POINTER; a_doc: POINTER): INTEGER_32 is
 		-- xmlValidateDocument (node at line 4501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDocument"
		}"
		end

	xml_validate_name_value (a_value: POINTER): INTEGER_32 is
 		-- xmlValidateNameValue (node at line 4515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNameValue"
		}"
		end

	xml_validate_document_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER_32 is
 		-- xmlValidateDocumentFinal (node at line 4529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateDocumentFinal"
		}"
		end

	xml_dump_attribute_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpAttributeTable (node at line 4547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpAttributeTable"
		}"
		end

	xml_dump_element_decl (a_buf: POINTER; an_elem: POINTER) is
 		-- xmlDumpElementDecl (node at line 4555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpElementDecl"
		}"
		end

	xml_get_dtd_notation_desc (a_dtd: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdNotationDesc (node at line 4638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdNotationDesc"
		}"
		end

	xml_validate_nmtoken_value (a_value: POINTER): INTEGER_32 is
 		-- xmlValidateNmtokenValue (node at line 4664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNmtokenValue"
		}"
		end

	xml_get_id (a_doc: POINTER; an_id: POINTER): POINTER is
 		-- xmlGetID (node at line 4678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetID"
		}"
		end

	xml_get_dtd_qelement_desc (a_dtd: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlGetDtdQElementDesc (node at line 4682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdQElementDesc"
		}"
		end

	xml_snprintf_element_content (a_buf: POINTER; a_size: INTEGER_32; a_content: POINTER; an_englob: INTEGER_32) is
 		-- xmlSnprintfElementContent (node at line 4783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSnprintfElementContent"
		}"
		end

	xml_validate_push_cdata (a_ctxt: POINTER; a_data: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlValidatePushCData (node at line 4830)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidatePushCData"
		}"
		end

	xml_remove_id (a_doc: POINTER; an_attr: POINTER): INTEGER_32 is
 		-- xmlRemoveID (node at line 4882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveID"
		}"
		end

	xml_dump_attribute_decl (a_buf: POINTER; an_attr: POINTER) is
 		-- xmlDumpAttributeDecl (node at line 4898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpAttributeDecl"
		}"
		end

	xml_validate_one_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER_32 is
 		-- xmlValidateOneElement (node at line 4907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateOneElement"
		}"
		end

	xml_copy_notation_table (a_table: POINTER): POINTER is
 		-- xmlCopyNotationTable (node at line 4988)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNotationTable"
		}"
		end

	xml_valid_build_content_model (a_ctxt: POINTER; an_elem: POINTER): INTEGER_32 is
 		-- xmlValidBuildContentModel (node at line 5142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidBuildContentModel"
		}"
		end

	xml_copy_attribute_table (a_table: POINTER): POINTER is
 		-- xmlCopyAttributeTable (node at line 5176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyAttributeTable"
		}"
		end

	xml_valid_normalize_attribute_value (a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlValidNormalizeAttributeValue (node at line 5321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidNormalizeAttributeValue"
		}"
		end

	xml_get_dtd_attr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdAttrDesc (node at line 5328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdAttrDesc"
		}"
		end

	xml_remove_ref (a_doc: POINTER; an_attr: POINTER): INTEGER_32 is
 		-- xmlRemoveRef (node at line 5333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveRef"
		}"
		end

	xml_validate_names_value (a_value: POINTER): INTEGER_32 is
 		-- xmlValidateNamesValue (node at line 5559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNamesValue"
		}"
		end

	xml_validate_attribute_decl (a_ctxt: POINTER; a_doc: POINTER; an_attr: POINTER): INTEGER_32 is
 		-- xmlValidateAttributeDecl (node at line 5562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateAttributeDecl"
		}"
		end

	xml_copy_enumeration (a_cur: POINTER): POINTER is
 		-- xmlCopyEnumeration (node at line 5603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyEnumeration"
		}"
		end

	xml_dump_notation_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpNotationTable (node at line 5712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpNotationTable"
		}"
		end

	xml_free_attribute_table (a_table: POINTER) is
 		-- xmlFreeAttributeTable (node at line 5734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeAttributeTable"
		}"
		end

	xml_copy_element_content (a_content: POINTER): POINTER is
 		-- xmlCopyElementContent (node at line 6020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyElementContent"
		}"
		end


end -- class VALID_EXTERNALS
