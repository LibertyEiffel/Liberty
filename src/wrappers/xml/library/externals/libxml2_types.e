-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class LIBXML2_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       xml_rmutex_ptr: POINTER
               -- typedef xmlRMutexPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_mutex_ptr: POINTER
               -- typedef xmlMutexPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_global_state_ptr: POINTER
               -- typedef xmlGlobalStatePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_deregister_node_func: POINTER
               -- typedef xmlDeregisterNodeFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_register_node_func: POINTER
               -- typedef xmlRegisterNodeFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_buffer_create_filename_func: POINTER
               -- typedef xmlOutputBufferCreateFilenameFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_buffer_create_filename_func: POINTER
               -- typedef xmlParserInputBufferCreateFilenameFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_strdup_func: POINTER
               -- typedef xmlStrdupFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_realloc_func: POINTER
               -- typedef xmlReallocFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_malloc_func: POINTER
               -- typedef xmlMallocFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_free_func: POINTER
               -- typedef xmlFreeFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_handler_ptr: POINTER
               -- typedef xlinkHandlerPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_extended_link_set_funk: POINTER
               -- typedef xlinkExtendedLinkSetFunk
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_extended_link_funk: POINTER
               -- typedef xlinkExtendedLinkFunk
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_simple_link_funk: POINTER
               -- typedef xlinkSimpleLinkFunk
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_node_detect_func: POINTER
               -- typedef xlinkNodeDetectFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_title: POINTER
               -- typedef xlinkTitle
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_role: POINTER
               -- typedef xlinkRole
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_href: POINTER
               -- typedef xlinkHRef
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_close_callback: POINTER
               -- typedef xmlOutputCloseCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_write_callback: POINTER
               -- typedef xmlOutputWriteCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_open_callback: POINTER
               -- typedef xmlOutputOpenCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_match_callback: POINTER
               -- typedef xmlOutputMatchCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_close_callback: POINTER
               -- typedef xmlInputCloseCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_read_callback: POINTER
               -- typedef xmlInputReadCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_open_callback: POINTER
               -- typedef xmlInputOpenCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_match_callback: POINTER
               -- typedef xmlInputMatchCallback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_handler_ptr: POINTER
               -- typedef xmlCharEncodingHandlerPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_output_func: POINTER
               -- typedef xmlCharEncodingOutputFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_input_func: POINTER
               -- typedef xmlCharEncodingInputFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_external_entity_loader: POINTER
               -- typedef xmlExternalEntityLoader
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxhandler_v1ptr: POINTER
               -- typedef xmlSAXHandlerV1Ptr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_element_ns_sax2func: POINTER
               -- typedef endElementNsSAX2Func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_element_ns_sax2func: POINTER
               -- typedef startElementNsSAX2Func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       has_external_subset_saxfunc: POINTER
               -- typedef hasExternalSubsetSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       has_internal_subset_saxfunc: POINTER
               -- typedef hasInternalSubsetSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       is_standalone_saxfunc: POINTER
               -- typedef isStandaloneSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fatal_error_saxfunc: POINTER
               -- typedef fatalErrorSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       error_saxfunc: POINTER
               -- typedef errorSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       warning_saxfunc: POINTER
               -- typedef warningSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       cdata_block_saxfunc: POINTER
               -- typedef cdataBlockSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       comment_saxfunc: POINTER
               -- typedef commentSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       processing_instruction_saxfunc: POINTER
               -- typedef processingInstructionSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ignorable_whitespace_saxfunc: POINTER
               -- typedef ignorableWhitespaceSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       characters_saxfunc: POINTER
               -- typedef charactersSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       reference_saxfunc: POINTER
               -- typedef referenceSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       attribute_saxfunc: POINTER
               -- typedef attributeSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_element_saxfunc: POINTER
               -- typedef endElementSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_element_saxfunc: POINTER
               -- typedef startElementSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_document_saxfunc: POINTER
               -- typedef endDocumentSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_document_saxfunc: POINTER
               -- typedef startDocumentSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       set_document_locator_saxfunc: POINTER
               -- typedef setDocumentLocatorSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       unparsed_entity_decl_saxfunc: POINTER
               -- typedef unparsedEntityDeclSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       element_decl_saxfunc: POINTER
               -- typedef elementDeclSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       attribute_decl_saxfunc: POINTER
               -- typedef attributeDeclSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       notation_decl_saxfunc: POINTER
               -- typedef notationDeclSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       entity_decl_saxfunc: POINTER
               -- typedef entityDeclSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       get_parameter_entity_saxfunc: POINTER
               -- typedef getParameterEntitySAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       get_entity_saxfunc: POINTER
               -- typedef getEntitySAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       external_subset_saxfunc: POINTER
               -- typedef externalSubsetSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       internal_subset_saxfunc: POINTER
               -- typedef internalSubsetSAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       resolve_entity_saxfunc: POINTER
               -- typedef resolveEntitySAXFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_node_info_seq_ptr: POINTER
               -- typedef xmlParserNodeInfoSeqPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_node_info_ptr: POINTER
               -- typedef xmlParserNodeInfoPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_deallocate: POINTER
               -- typedef xmlParserInputDeallocate
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_entities_table_ptr: POINTER
               -- typedef xmlEntitiesTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ref_table_ptr: POINTER
               -- typedef xmlRefTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_idtable_ptr: POINTER
               -- typedef xmlIDTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attribute_table_ptr: POINTER
               -- typedef xmlAttributeTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_table_ptr: POINTER
               -- typedef xmlElementTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_notation_table_ptr: POINTER
               -- typedef xmlNotationTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_valid_ctxt_ptr: POINTER
               -- typedef xmlValidCtxtPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_validity_warning_func: POINTER
               -- typedef xmlValidityWarningFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_validity_error_func: POINTER
               -- typedef xmlValidityErrorFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_valid_state_ptr: POINTER
               -- typedef xmlValidStatePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_automata_state_ptr: POINTER
               -- typedef xmlAutomataStatePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_automata_ptr: POINTER
               -- typedef xmlAutomataPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_walker: POINTER
               -- typedef xmlListWalker
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_data_compare: POINTER
               -- typedef xmlListDataCompare
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_deallocator: POINTER
               -- typedef xmlListDeallocator
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_ptr: POINTER
               -- typedef xmlListPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_link_ptr: POINTER
               -- typedef xmlLinkPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_structured_error_func: POINTER
               -- typedef xmlStructuredErrorFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_generic_error_func: POINTER
               -- typedef xmlGenericErrorFunc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_error_ptr: POINTER
               -- typedef xmlErrorPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_scanner_full: POINTER
               -- typedef xmlHashScannerFull
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_scanner: POINTER
               -- typedef xmlHashScanner
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_copier: POINTER
               -- typedef xmlHashCopier
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_deallocator: POINTER
               -- typedef xmlHashDeallocator
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_table_ptr: POINTER
               -- typedef xmlHashTablePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_domwrap_acquire_ns_function: POINTER
               -- typedef xmlDOMWrapAcquireNsFunction
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_domwrap_ctxt_ptr: POINTER
               -- typedef xmlDOMWrapCtxtPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_doc_ptr: POINTER
               -- typedef xmlDocPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_node_ptr: POINTER
               -- typedef xmlNodePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ref_ptr: POINTER
               -- typedef xmlRefPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_idptr: POINTER
               -- typedef xmlIDPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attr_ptr: POINTER
               -- typedef xmlAttrPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_dtd_ptr: POINTER
               -- typedef xmlDtdPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ns_ptr: POINTER
               -- typedef xmlNsPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_ptr: POINTER
               -- typedef xmlElementPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_exp_node_ptr: POINTER
               -- typedef xmlExpNodePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_exp_ctxt_ptr: POINTER
               -- typedef xmlExpCtxtPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_reg_exec_callbacks: POINTER
               -- typedef xmlRegExecCallbacks
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_dict_ptr: POINTER
               -- typedef xmlDictPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_reg_exec_ctxt_ptr: POINTER
               -- typedef xmlRegExecCtxtPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_regexp_ptr: POINTER
               -- typedef xmlRegexpPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_content_ptr: POINTER
               -- typedef xmlElementContentPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attribute_ptr: POINTER
               -- typedef xmlAttributePtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_enumeration_ptr: POINTER
               -- typedef xmlEnumerationPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_notation_ptr: POINTER
               -- typedef xmlNotationPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_buf_ptr: POINTER
               -- typedef xmlBufPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_buffer_ptr: POINTER
               -- typedef xmlBufferPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_entity_ptr: POINTER
               -- typedef xmlEntityPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxhandler_ptr: POINTER
               -- typedef xmlSAXHandlerPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxlocator_ptr: POINTER
               -- typedef xmlSAXLocatorPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_ctxt_ptr: POINTER
               -- typedef xmlParserCtxtPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_ptr: POINTER
               -- typedef xmlParserInputPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_buffer_ptr: POINTER
               -- typedef xmlOutputBufferPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_buffer_ptr: POINTER
               -- typedef xmlParserInputBufferPtr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char: CHARACTER
               -- typedef xmlChar
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
