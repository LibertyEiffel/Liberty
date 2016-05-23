-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class VALID_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_attribute_decl (a_ctxt: POINTER; a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_ns: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER): POINTER 

		-- function xmlAddAttributeDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlAddAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddAttributeDecl"
               }"
               end

	xml_add_element_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER): POINTER 

		-- function xmlAddElementDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlAddElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddElementDecl"
               }"
               end

	xml_add_id (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER 

		-- function xmlAddID (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlAddID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddID"
               }"
               end

	xml_add_notation_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlAddNotationDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlAddNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddNotationDecl"
               }"
               end

	xml_add_ref (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER 

		-- function xmlAddRef (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlAddRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddRef"
               }"
               end

	xml_copy_attribute_table (a_table: POINTER): POINTER 

		-- function xmlCopyAttributeTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyAttributeTable"
               }"
               end

	xml_copy_doc_element_content (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlCopyDocElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDocElementContent"
               }"
               end

	xml_copy_element_content (a_content: POINTER): POINTER 

		-- function xmlCopyElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyElementContent"
               }"
               end

	xml_copy_element_table (a_table: POINTER): POINTER 

		-- function xmlCopyElementTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyElementTable"
               }"
               end

	xml_copy_enumeration (a_cur: POINTER): POINTER 

		-- function xmlCopyEnumeration (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyEnumeration"
               }"
               end

	xml_copy_notation_table (a_table: POINTER): POINTER 

		-- function xmlCopyNotationTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCopyNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNotationTable"
               }"
               end

	xml_create_enumeration (a_name: POINTER): POINTER 

		-- function xmlCreateEnumeration (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlCreateEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateEnumeration"
               }"
               end

	xml_dump_attribute_decl (a_buf: POINTER; an_attr: POINTER) 

		-- function xmlDumpAttributeDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpAttributeDecl"
               }"
               end

	xml_dump_attribute_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpAttributeTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpAttributeTable"
               }"
               end

	xml_dump_element_decl (a_buf: POINTER; an_elem: POINTER) 

		-- function xmlDumpElementDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpElementDecl"
               }"
               end

	xml_dump_element_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpElementTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpElementTable"
               }"
               end

	xml_dump_notation_decl (a_buf: POINTER; a_nota: POINTER) 

		-- function xmlDumpNotationDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpNotationDecl"
               }"
               end

	xml_dump_notation_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpNotationTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlDumpNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpNotationTable"
               }"
               end

	xml_free_attribute_table (a_table: POINTER) 

		-- function xmlFreeAttributeTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeAttributeTable"
               }"
               end

	xml_free_doc_element_content (a_doc: POINTER; a_cur: POINTER) 

		-- function xmlFreeDocElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDocElementContent"
               }"
               end

	xml_free_element_content (a_cur: POINTER) 

		-- function xmlFreeElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeElementContent"
               }"
               end

	xml_free_element_table (a_table: POINTER) 

		-- function xmlFreeElementTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeElementTable"
               }"
               end

	xml_free_enumeration (a_cur: POINTER) 

		-- function xmlFreeEnumeration (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeEnumeration"
               }"
               end

	xml_free_idtable (a_table: POINTER) 

		-- function xmlFreeIDTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeIDTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeIDTable"
               }"
               end

	xml_free_notation_table (a_table: POINTER) 

		-- function xmlFreeNotationTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNotationTable"
               }"
               end

	xml_free_ref_table (a_table: POINTER) 

		-- function xmlFreeRefTable (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeRefTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeRefTable"
               }"
               end

	xml_free_valid_ctxt (an_argument_l3105_c7: POINTER) 

		-- function xmlFreeValidCtxt (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlFreeValidCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeValidCtxt"
               }"
               end

	xml_get_dtd_attr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdAttrDesc (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetDtdAttrDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdAttrDesc"
               }"
               end

	xml_get_dtd_element_desc (a_dtd: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdElementDesc (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetDtdElementDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdElementDesc"
               }"
               end

	xml_get_dtd_notation_desc (a_dtd: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdNotationDesc (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetDtdNotationDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdNotationDesc"
               }"
               end

	xml_get_dtd_qattr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlGetDtdQAttrDesc (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetDtdQAttrDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdQAttrDesc"
               }"
               end

	xml_get_dtd_qelement_desc (a_dtd: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlGetDtdQElementDesc (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetDtdQElementDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdQElementDesc"
               }"
               end

	xml_get_id (a_doc: POINTER; an_id: POINTER): POINTER 

		-- function xmlGetID (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetID"
               }"
               end

	xml_get_refs (a_doc: POINTER; an_id: POINTER): POINTER 

		-- function xmlGetRefs (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlGetRefs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetRefs"
               }"
               end

	xml_is_id (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlIsID (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlIsID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsID"
               }"
               end

	xml_is_mixed_element (a_doc: POINTER; a_name: POINTER): INTEGER 

		-- function xmlIsMixedElement (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlIsMixedElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsMixedElement"
               }"
               end

	xml_is_ref (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlIsRef (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlIsRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsRef"
               }"
               end

	xml_new_doc_element_content (a_doc: POINTER; a_name: POINTER; a_type: INTEGER): POINTER 

		-- function xmlNewDocElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlNewDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocElementContent"
               }"
               end

	xml_new_element_content (a_name: POINTER; a_type: INTEGER): POINTER 

		-- function xmlNewElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlNewElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewElementContent"
               }"
               end

	xml_new_valid_ctxt: POINTER 

		-- function xmlNewValidCtxt (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlNewValidCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewValidCtxt"
               }"
               end

	xml_remove_id (a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlRemoveID (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlRemoveID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveID"
               }"
               end

	xml_remove_ref (a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlRemoveRef (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlRemoveRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveRef"
               }"
               end

	xml_snprintf_element_content (a_buf: POINTER; a_size: INTEGER; a_content: POINTER; an_englob: INTEGER) 

		-- function xmlSnprintfElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlSnprintfElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSnprintfElementContent"
               }"
               end

	xml_sprintf_element_content (a_buf: POINTER; a_content: POINTER; an_englob: INTEGER) 

		-- function xmlSprintfElementContent (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlSprintfElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSprintfElementContent"
               }"
               end

	xml_valid_build_content_model (a_ctxt: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidBuildContentModel (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidBuildContentModel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidBuildContentModel"
               }"
               end

	xml_valid_ctxt_normalize_attribute_value (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlValidCtxtNormalizeAttributeValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidCtxtNormalizeAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidCtxtNormalizeAttributeValue"
               }"
               end

	xml_valid_get_potential_children (a_ctree: POINTER; a_names: POINTER; a_len: POINTER; a_max: INTEGER): INTEGER 

		-- function xmlValidGetPotentialChildren (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidGetPotentialChildren
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidGetPotentialChildren"
               }"
               end

	xml_valid_get_valid_elements (a_prev: POINTER; a_next: POINTER; a_names: POINTER; a_max: INTEGER): INTEGER 

		-- function xmlValidGetValidElements (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidGetValidElements
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidGetValidElements"
               }"
               end

	xml_valid_normalize_attribute_value (a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlValidNormalizeAttributeValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidNormalizeAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidNormalizeAttributeValue"
               }"
               end

	xml_validate_attribute_decl (a_ctxt: POINTER; a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlValidateAttributeDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateAttributeDecl"
               }"
               end

	xml_validate_attribute_value (a_type: INTEGER; a_value: POINTER): INTEGER 

		-- function xmlValidateAttributeValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateAttributeValue"
               }"
               end

	xml_validate_document (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDocument (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDocument"
               }"
               end

	xml_validate_document_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDocumentFinal (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateDocumentFinal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDocumentFinal"
               }"
               end

	xml_validate_dtd (a_ctxt: POINTER; a_doc: POINTER; a_dtd: POINTER): INTEGER 

		-- function xmlValidateDtd (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDtd"
               }"
               end

	xml_validate_dtd_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDtdFinal (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateDtdFinal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDtdFinal"
               }"
               end

	xml_validate_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateElement (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateElement"
               }"
               end

	xml_validate_element_decl (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateElementDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateElementDecl"
               }"
               end

	xml_validate_name_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNameValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNameValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNameValue"
               }"
               end

	xml_validate_names_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNamesValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNamesValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNamesValue"
               }"
               end

	xml_validate_nmtoken_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNmtokenValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNmtokenValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNmtokenValue"
               }"
               end

	xml_validate_nmtokens_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNmtokensValue (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNmtokensValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNmtokensValue"
               }"
               end

	xml_validate_notation_decl (a_ctxt: POINTER; a_doc: POINTER; a_nota: POINTER): INTEGER 

		-- function xmlValidateNotationDecl (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNotationDecl"
               }"
               end

	xml_validate_notation_use (a_ctxt: POINTER; a_doc: POINTER; a_notation_name: POINTER): INTEGER 

		-- function xmlValidateNotationUse (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateNotationUse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNotationUse"
               }"
               end

	xml_validate_one_attribute (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; an_attr: POINTER; a_value: POINTER): INTEGER 

		-- function xmlValidateOneAttribute (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateOneAttribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneAttribute"
               }"
               end

	xml_validate_one_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateOneElement (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateOneElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneElement"
               }"
               end

	xml_validate_one_namespace (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_prefix: POINTER; a_ns: POINTER; a_value: POINTER): INTEGER 

		-- function xmlValidateOneNamespace (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateOneNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneNamespace"
               }"
               end

	xml_validate_pop_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER 

		-- function xmlValidatePopElement (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidatePopElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePopElement"
               }"
               end

	xml_validate_push_cdata (a_ctxt: POINTER; a_data: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlValidatePushCData (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidatePushCData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePushCData"
               }"
               end

	xml_validate_push_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER 

		-- function xmlValidatePushElement (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidatePushElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePushElement"
               }"
               end

	xml_validate_root (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateRoot (in `/usr/include/libxml2/libxml/valid.h')
               -- xmlValidateRoot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateRoot"
               }"
               end


end -- class VALID_EXTERNALS
