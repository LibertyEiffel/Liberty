-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LIBXML2_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {WRAPPER_HANDLER} -- C type definitions (typedefs)
       xml_rmutex_ptr: POINTER
               -- typedef xmlRMutexPtr from /usr/include/libxml2/libxml/threads.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_mutex_ptr: POINTER
               -- typedef xmlMutexPtr from /usr/include/libxml2/libxml/threads.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_global_state_ptr: POINTER
               -- typedef xmlGlobalStatePtr from /usr/include/libxml2/libxml/globals.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_deregister_node_func: POINTER
               -- typedef xmlDeregisterNodeFunc from /usr/include/libxml2/libxml/globals.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_register_node_func: POINTER
               -- typedef xmlRegisterNodeFunc from /usr/include/libxml2/libxml/globals.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_buffer_create_filename_func: POINTER
               -- typedef xmlOutputBufferCreateFilenameFunc from /usr/include/libxml2/libxml/globals.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_buffer_create_filename_func: POINTER
               -- typedef xmlParserInputBufferCreateFilenameFunc from /usr/include/libxml2/libxml/globals.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_strdup_func: POINTER
               -- typedef xmlStrdupFunc from /usr/include/libxml2/libxml/xmlmemory.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_realloc_func: POINTER
               -- typedef xmlReallocFunc from /usr/include/libxml2/libxml/xmlmemory.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_malloc_func: POINTER
               -- typedef xmlMallocFunc from /usr/include/libxml2/libxml/xmlmemory.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_free_func: POINTER
               -- typedef xmlFreeFunc from /usr/include/libxml2/libxml/xmlmemory.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_handler_ptr: POINTER
               -- typedef xlinkHandlerPtr from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_extended_link_set_funk: POINTER
               -- typedef xlinkExtendedLinkSetFunk from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_extended_link_funk: POINTER
               -- typedef xlinkExtendedLinkFunk from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_simple_link_funk: POINTER
               -- typedef xlinkSimpleLinkFunk from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_node_detect_func: POINTER
               -- typedef xlinkNodeDetectFunc from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_title: POINTER
               -- typedef xlinkTitle from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_role: POINTER
               -- typedef xlinkRole from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xlink_href: POINTER
               -- typedef xlinkHRef from /usr/include/libxml2/libxml/xlink.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_close_callback: POINTER
               -- typedef xmlOutputCloseCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_write_callback: POINTER
               -- typedef xmlOutputWriteCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_open_callback: POINTER
               -- typedef xmlOutputOpenCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_match_callback: POINTER
               -- typedef xmlOutputMatchCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_close_callback: POINTER
               -- typedef xmlInputCloseCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_read_callback: POINTER
               -- typedef xmlInputReadCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_open_callback: POINTER
               -- typedef xmlInputOpenCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_input_match_callback: POINTER
               -- typedef xmlInputMatchCallback from /usr/include/libxml2/libxml/xmlIO.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_handler_ptr: POINTER
               -- typedef xmlCharEncodingHandlerPtr from /usr/include/libxml2/libxml/encoding.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_output_func: POINTER
               -- typedef xmlCharEncodingOutputFunc from /usr/include/libxml2/libxml/encoding.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char_encoding_input_func: POINTER
               -- typedef xmlCharEncodingInputFunc from /usr/include/libxml2/libxml/encoding.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_external_entity_loader: POINTER
               -- typedef xmlExternalEntityLoader from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxhandler_v1ptr: POINTER
               -- typedef xmlSAXHandlerV1Ptr from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_element_ns_sax2func: POINTER
               -- typedef endElementNsSAX2Func from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_element_ns_sax2func: POINTER
               -- typedef startElementNsSAX2Func from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       has_external_subset_saxfunc: POINTER
               -- typedef hasExternalSubsetSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       has_internal_subset_saxfunc: POINTER
               -- typedef hasInternalSubsetSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       is_standalone_saxfunc: POINTER
               -- typedef isStandaloneSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       fatal_error_saxfunc: POINTER
               -- typedef fatalErrorSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       error_saxfunc: POINTER
               -- typedef errorSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       warning_saxfunc: POINTER
               -- typedef warningSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       cdata_block_saxfunc: POINTER
               -- typedef cdataBlockSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       comment_saxfunc: POINTER
               -- typedef commentSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       processing_instruction_saxfunc: POINTER
               -- typedef processingInstructionSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ignorable_whitespace_saxfunc: POINTER
               -- typedef ignorableWhitespaceSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       characters_saxfunc: POINTER
               -- typedef charactersSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       reference_saxfunc: POINTER
               -- typedef referenceSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       attribute_saxfunc: POINTER
               -- typedef attributeSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_element_saxfunc: POINTER
               -- typedef endElementSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_element_saxfunc: POINTER
               -- typedef startElementSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       end_document_saxfunc: POINTER
               -- typedef endDocumentSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       start_document_saxfunc: POINTER
               -- typedef startDocumentSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       set_document_locator_saxfunc: POINTER
               -- typedef setDocumentLocatorSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       unparsed_entity_decl_saxfunc: POINTER
               -- typedef unparsedEntityDeclSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       element_decl_saxfunc: POINTER
               -- typedef elementDeclSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       attribute_decl_saxfunc: POINTER
               -- typedef attributeDeclSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       notation_decl_saxfunc: POINTER
               -- typedef notationDeclSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       entity_decl_saxfunc: POINTER
               -- typedef entityDeclSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       get_parameter_entity_saxfunc: POINTER
               -- typedef getParameterEntitySAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       get_entity_saxfunc: POINTER
               -- typedef getEntitySAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       external_subset_saxfunc: POINTER
               -- typedef externalSubsetSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       internal_subset_saxfunc: POINTER
               -- typedef internalSubsetSAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       resolve_entity_saxfunc: POINTER
               -- typedef resolveEntitySAXFunc from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_node_info_seq_ptr: POINTER
               -- typedef xmlParserNodeInfoSeqPtr from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_node_info_ptr: POINTER
               -- typedef xmlParserNodeInfoPtr from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_deallocate: POINTER
               -- typedef xmlParserInputDeallocate from /usr/include/libxml2/libxml/parser.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_entities_table_ptr: POINTER
               -- typedef xmlEntitiesTablePtr from /usr/include/libxml2/libxml/entities.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ref_table_ptr: POINTER
               -- typedef xmlRefTablePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_idtable_ptr: POINTER
               -- typedef xmlIDTablePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attribute_table_ptr: POINTER
               -- typedef xmlAttributeTablePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_table_ptr: POINTER
               -- typedef xmlElementTablePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_notation_table_ptr: POINTER
               -- typedef xmlNotationTablePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_valid_ctxt_ptr: POINTER
               -- typedef xmlValidCtxtPtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_validity_warning_func: POINTER
               -- typedef xmlValidityWarningFunc from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_validity_error_func: POINTER
               -- typedef xmlValidityErrorFunc from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_valid_state_ptr: POINTER
               -- typedef xmlValidStatePtr from /usr/include/libxml2/libxml/valid.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_automata_state_ptr: POINTER
               -- typedef xmlAutomataStatePtr from /usr/include/libxml2/libxml/xmlautomata.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_automata_ptr: POINTER
               -- typedef xmlAutomataPtr from /usr/include/libxml2/libxml/xmlautomata.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_walker: POINTER
               -- typedef xmlListWalker from /usr/include/libxml2/libxml/list.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_data_compare: POINTER
               -- typedef xmlListDataCompare from /usr/include/libxml2/libxml/list.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_deallocator: POINTER
               -- typedef xmlListDeallocator from /usr/include/libxml2/libxml/list.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_list_ptr: POINTER
               -- typedef xmlListPtr from /usr/include/libxml2/libxml/list.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_link_ptr: POINTER
               -- typedef xmlLinkPtr from /usr/include/libxml2/libxml/list.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_structured_error_func: POINTER
               -- typedef xmlStructuredErrorFunc from /usr/include/libxml2/libxml/xmlerror.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_generic_error_func: POINTER
               -- typedef xmlGenericErrorFunc from /usr/include/libxml2/libxml/xmlerror.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_error_ptr: POINTER
               -- typedef xmlErrorPtr from /usr/include/libxml2/libxml/xmlerror.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_scanner_full: POINTER
               -- typedef xmlHashScannerFull from /usr/include/libxml2/libxml/hash.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_scanner: POINTER
               -- typedef xmlHashScanner from /usr/include/libxml2/libxml/hash.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_copier: POINTER
               -- typedef xmlHashCopier from /usr/include/libxml2/libxml/hash.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_deallocator: POINTER
               -- typedef xmlHashDeallocator from /usr/include/libxml2/libxml/hash.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_hash_table_ptr: POINTER
               -- typedef xmlHashTablePtr from /usr/include/libxml2/libxml/hash.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_domwrap_acquire_ns_function: POINTER
               -- typedef xmlDOMWrapAcquireNsFunction from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_domwrap_ctxt_ptr: POINTER
               -- typedef xmlDOMWrapCtxtPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_doc_ptr: POINTER
               -- typedef xmlDocPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_node_ptr: POINTER
               -- typedef xmlNodePtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ref_ptr: POINTER
               -- typedef xmlRefPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_idptr: POINTER
               -- typedef xmlIDPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attr_ptr: POINTER
               -- typedef xmlAttrPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_dtd_ptr: POINTER
               -- typedef xmlDtdPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_ns_ptr: POINTER
               -- typedef xmlNsPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_ptr: POINTER
               -- typedef xmlElementPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_exp_node_ptr: POINTER
               -- typedef xmlExpNodePtr from /usr/include/libxml2/libxml/xmlregexp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_exp_ctxt_ptr: POINTER
               -- typedef xmlExpCtxtPtr from /usr/include/libxml2/libxml/xmlregexp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_reg_exec_callbacks: POINTER
               -- typedef xmlRegExecCallbacks from /usr/include/libxml2/libxml/xmlregexp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_dict_ptr: POINTER
               -- typedef xmlDictPtr from /usr/include/libxml2/libxml/dict.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_reg_exec_ctxt_ptr: POINTER
               -- typedef xmlRegExecCtxtPtr from /usr/include/libxml2/libxml/xmlregexp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_regexp_ptr: POINTER
               -- typedef xmlRegexpPtr from /usr/include/libxml2/libxml/xmlregexp.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_element_content_ptr: POINTER
               -- typedef xmlElementContentPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_attribute_ptr: POINTER
               -- typedef xmlAttributePtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_enumeration_ptr: POINTER
               -- typedef xmlEnumerationPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_notation_ptr: POINTER
               -- typedef xmlNotationPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_buf_ptr: POINTER
               -- typedef xmlBufPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_buffer_ptr: POINTER
               -- typedef xmlBufferPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_entity_ptr: POINTER
               -- typedef xmlEntityPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxhandler_ptr: POINTER
               -- typedef xmlSAXHandlerPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_saxlocator_ptr: POINTER
               -- typedef xmlSAXLocatorPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_ctxt_ptr: POINTER
               -- typedef xmlParserCtxtPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_ptr: POINTER
               -- typedef xmlParserInputPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_output_buffer_ptr: POINTER
               -- typedef xmlOutputBufferPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_parser_input_buffer_ptr: POINTER
               -- typedef xmlParserInputBufferPtr from /usr/include/libxml2/libxml/tree.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       xml_char: CHARACTER
               -- typedef xmlChar from /usr/include/libxml2/libxml/xmlstring.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
