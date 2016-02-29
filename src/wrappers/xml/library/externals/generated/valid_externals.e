-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class VALID_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_attribute_decl (a_ctxt: POINTER; a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_ns: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER): POINTER 

		-- function xmlAddAttributeDecl (in 242 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlAddAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddAttributeDecl"
               }"
               end

	xml_add_element_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER): POINTER 

		-- function xmlAddElementDecl (in 210 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlAddElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddElementDecl"
               }"
               end

	xml_add_id (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER 

		-- function xmlAddID (in 268 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlAddID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddID"
               }"
               end

	xml_add_notation_decl (a_ctxt: POINTER; a_dtd: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlAddNotationDecl (in 154 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlAddNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddNotationDecl"
               }"
               end

	xml_add_ref (a_ctxt: POINTER; a_doc: POINTER; a_value: POINTER; an_attr: POINTER): POINTER 

		-- function xmlAddRef (in 287 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlAddRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddRef"
               }"
               end

	xml_copy_attribute_table (a_table: POINTER): POINTER 

		-- function xmlCopyAttributeTable (in 253 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyAttributeTable"
               }"
               end

	xml_copy_doc_element_content (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlCopyDocElementContent (in 189 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDocElementContent"
               }"
               end

	xml_copy_element_content (a_content: POINTER): POINTER 

		-- function xmlCopyElementContent (in 180 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyElementContent"
               }"
               end

	xml_copy_element_table (a_table: POINTER): POINTER 

		-- function xmlCopyElementTable (in 217 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyElementTable"
               }"
               end

	xml_copy_enumeration (a_cur: POINTER): POINTER 

		-- function xmlCopyEnumeration (in 237 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyEnumeration"
               }"
               end

	xml_copy_notation_table (a_table: POINTER): POINTER 

		-- function xmlCopyNotationTable (in 161 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCopyNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNotationTable"
               }"
               end

	xml_create_enumeration (a_name: POINTER): POINTER 

		-- function xmlCreateEnumeration (in 232 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlCreateEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateEnumeration"
               }"
               end

	xml_dump_attribute_decl (a_buf: POINTER; an_attr: POINTER) 

		-- function xmlDumpAttributeDecl (in 262 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpAttributeDecl"
               }"
               end

	xml_dump_attribute_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpAttributeTable (in 259 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpAttributeTable"
               }"
               end

	xml_dump_element_decl (a_buf: POINTER; an_elem: POINTER) 

		-- function xmlDumpElementDecl (in 226 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpElementDecl"
               }"
               end

	xml_dump_element_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpElementTable (in 223 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpElementTable"
               }"
               end

	xml_dump_notation_decl (a_buf: POINTER; a_nota: POINTER) 

		-- function xmlDumpNotationDecl (in 167 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpNotationDecl"
               }"
               end

	xml_dump_notation_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpNotationTable (in 170 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlDumpNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpNotationTable"
               }"
               end

	xml_free_attribute_table (a_table: POINTER) 

		-- function xmlFreeAttributeTable (in 256 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeAttributeTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeAttributeTable"
               }"
               end

	xml_free_doc_element_content (a_doc: POINTER; a_cur: POINTER) 

		-- function xmlFreeDocElementContent (in 192 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDocElementContent"
               }"
               end

	xml_free_element_content (a_cur: POINTER) 

		-- function xmlFreeElementContent (in 182 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeElementContent"
               }"
               end

	xml_free_element_table (a_table: POINTER) 

		-- function xmlFreeElementTable (in 220 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeElementTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeElementTable"
               }"
               end

	xml_free_enumeration (a_cur: POINTER) 

		-- function xmlFreeEnumeration (in 234 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeEnumeration
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeEnumeration"
               }"
               end

	xml_free_idtable (a_table: POINTER) 

		-- function xmlFreeIDTable (in 273 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeIDTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeIDTable"
               }"
               end

	xml_free_notation_table (a_table: POINTER) 

		-- function xmlFreeNotationTable (in 164 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeNotationTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNotationTable"
               }"
               end

	xml_free_ref_table (a_table: POINTER) 

		-- function xmlFreeRefTable (in 292 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeRefTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeRefTable"
               }"
               end

	xml_free_valid_ctxt (an_argument_l3105_c7: POINTER) 

		-- function xmlFreeValidCtxt (in 312 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlFreeValidCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeValidCtxt"
               }"
               end

	xml_get_dtd_attr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdAttrDesc (in 390 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetDtdAttrDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdAttrDesc"
               }"
               end

	xml_get_dtd_element_desc (a_dtd: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdElementDesc (in 406 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetDtdElementDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdElementDesc"
               }"
               end

	xml_get_dtd_notation_desc (a_dtd: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdNotationDesc (in 399 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetDtdNotationDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdNotationDesc"
               }"
               end

	xml_get_dtd_qattr_desc (a_dtd: POINTER; an_elem: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlGetDtdQAttrDesc (in 394 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetDtdQAttrDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdQAttrDesc"
               }"
               end

	xml_get_dtd_qelement_desc (a_dtd: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlGetDtdQElementDesc (in 402 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetDtdQElementDesc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdQElementDesc"
               }"
               end

	xml_get_id (a_doc: POINTER; an_id: POINTER): POINTER 

		-- function xmlGetID (in 275 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetID"
               }"
               end

	xml_get_refs (a_doc: POINTER; an_id: POINTER): POINTER 

		-- function xmlGetRefs (in 301 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlGetRefs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetRefs"
               }"
               end

	xml_is_id (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlIsID (in 278 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlIsID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsID"
               }"
               end

	xml_is_mixed_element (a_doc: POINTER; a_name: POINTER): INTEGER 

		-- function xmlIsMixedElement (in 387 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlIsMixedElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsMixedElement"
               }"
               end

	xml_is_ref (a_doc: POINTER; an_elem: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlIsRef (in 294 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlIsRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsRef"
               }"
               end

	xml_new_doc_element_content (a_doc: POINTER; a_name: POINTER; a_type: INTEGER): POINTER 

		-- function xmlNewDocElementContent (in 185 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlNewDocElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocElementContent"
               }"
               end

	xml_new_element_content (a_name: POINTER; a_type: INTEGER): POINTER 

		-- function xmlNewElementContent (in 177 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlNewElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewElementContent"
               }"
               end

	xml_new_valid_ctxt: POINTER 

		-- function xmlNewValidCtxt (in 310 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlNewValidCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewValidCtxt"
               }"
               end

	xml_remove_id (a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlRemoveID (in 282 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlRemoveID
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveID"
               }"
               end

	xml_remove_ref (a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlRemoveRef (in 298 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlRemoveRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveRef"
               }"
               end

	xml_snprintf_element_content (a_buf: POINTER; a_size: INTEGER; a_content: POINTER; an_englob: INTEGER) 

		-- function xmlSnprintfElementContent (in 195 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlSnprintfElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSnprintfElementContent"
               }"
               end

	xml_sprintf_element_content (a_buf: POINTER; a_content: POINTER; an_englob: INTEGER) 

		-- function xmlSprintfElementContent (in 202 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlSprintfElementContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSprintfElementContent"
               }"
               end

	xml_valid_build_content_model (a_ctxt: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidBuildContentModel (in 436 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidBuildContentModel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidBuildContentModel"
               }"
               end

	xml_valid_ctxt_normalize_attribute_value (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlValidCtxtNormalizeAttributeValue (in 327 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidCtxtNormalizeAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidCtxtNormalizeAttributeValue"
               }"
               end

	xml_valid_get_potential_children (a_ctree: POINTER; a_names: POINTER; a_len: POINTER; a_max: INTEGER): INTEGER 

		-- function xmlValidGetPotentialChildren (in 412 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidGetPotentialChildren
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidGetPotentialChildren"
               }"
               end

	xml_valid_get_valid_elements (a_prev: POINTER; a_next: POINTER; a_names: POINTER; a_max: INTEGER): INTEGER 

		-- function xmlValidGetValidElements (in 418 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidGetValidElements
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidGetValidElements"
               }"
               end

	xml_valid_normalize_attribute_value (a_doc: POINTER; an_elem: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlValidNormalizeAttributeValue (in 322 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidNormalizeAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidNormalizeAttributeValue"
               }"
               end

	xml_validate_attribute_decl (a_ctxt: POINTER; a_doc: POINTER; an_attr: POINTER): INTEGER 

		-- function xmlValidateAttributeDecl (in 333 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateAttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateAttributeDecl"
               }"
               end

	xml_validate_attribute_value (a_type: INTEGER; a_value: POINTER): INTEGER 

		-- function xmlValidateAttributeValue (in 337 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateAttributeValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateAttributeValue"
               }"
               end

	xml_validate_document (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDocument (in 351 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDocument"
               }"
               end

	xml_validate_document_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDocumentFinal (in 375 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateDocumentFinal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDocumentFinal"
               }"
               end

	xml_validate_dtd (a_ctxt: POINTER; a_doc: POINTER; a_dtd: POINTER): INTEGER 

		-- function xmlValidateDtd (in 344 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDtd"
               }"
               end

	xml_validate_dtd_final (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateDtdFinal (in 348 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateDtdFinal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateDtdFinal"
               }"
               end

	xml_validate_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateElement (in 354 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateElement"
               }"
               end

	xml_validate_element_decl (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateElementDecl (in 318 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateElementDecl"
               }"
               end

	xml_validate_name_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNameValue (in 423 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNameValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNameValue"
               }"
               end

	xml_validate_names_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNamesValue (in 425 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNamesValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNamesValue"
               }"
               end

	xml_validate_nmtoken_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNmtokenValue (in 427 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNmtokenValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNmtokenValue"
               }"
               end

	xml_validate_nmtokens_value (a_value: POINTER): INTEGER 

		-- function xmlValidateNmtokensValue (in 429 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNmtokensValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNmtokensValue"
               }"
               end

	xml_validate_notation_decl (a_ctxt: POINTER; a_doc: POINTER; a_nota: POINTER): INTEGER 

		-- function xmlValidateNotationDecl (in 340 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNotationDecl"
               }"
               end

	xml_validate_notation_use (a_ctxt: POINTER; a_doc: POINTER; a_notation_name: POINTER): INTEGER 

		-- function xmlValidateNotationUse (in 381 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateNotationUse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNotationUse"
               }"
               end

	xml_validate_one_attribute (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; an_attr: POINTER; a_value: POINTER): INTEGER 

		-- function xmlValidateOneAttribute (in 362 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateOneAttribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneAttribute"
               }"
               end

	xml_validate_one_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER): INTEGER 

		-- function xmlValidateOneElement (in 358 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateOneElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneElement"
               }"
               end

	xml_validate_one_namespace (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_prefix: POINTER; a_ns: POINTER; a_value: POINTER): INTEGER 

		-- function xmlValidateOneNamespace (in 368 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateOneNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateOneNamespace"
               }"
               end

	xml_validate_pop_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER 

		-- function xmlValidatePopElement (in 449 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidatePopElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePopElement"
               }"
               end

	xml_validate_push_cdata (a_ctxt: POINTER; a_data: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlValidatePushCData (in 445 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidatePushCData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePushCData"
               }"
               end

	xml_validate_push_element (a_ctxt: POINTER; a_doc: POINTER; an_elem: POINTER; a_qname: POINTER): INTEGER 

		-- function xmlValidatePushElement (in 440 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidatePushElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidatePushElement"
               }"
               end

	xml_validate_root (a_ctxt: POINTER; a_doc: POINTER): INTEGER 

		-- function xmlValidateRoot (in 315 at line /usr/include/libxml2/libxml/valid.h)i
               -- xmlValidateRoot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateRoot"
               }"
               end


end -- class VALID_EXTERNALS
