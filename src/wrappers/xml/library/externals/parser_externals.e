-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PARSER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_byte_consumed (a_ctxt: POINTER): like long 
               -- xmlByteConsumed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlByteConsumed"
               }"
               end

	xml_cleanup_parser 
               -- xmlCleanupParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupParser"
               }"
               end

	xml_clear_node_info_seq (a_seq: POINTER) 
               -- xmlClearNodeInfoSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlClearNodeInfoSeq"
               }"
               end

	xml_clear_parser_ctxt (a_ctxt: POINTER) 
               -- xmlClearParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlClearParserCtxt"
               }"
               end

	xml_create_doc_parser_ctxt (a_cur: POINTER): POINTER 
               -- xmlCreateDocParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateDocParserCtxt"
               }"
               end

	xml_create_ioparser_ctxt (a_sax: POINTER; an_user_data: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER 
               -- xmlCreateIOParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateIOParserCtxt"
               }"
               end

	xml_create_push_parser_ctxt (a_sax: POINTER; an_user_data: POINTER; a_chunk: POINTER; a_size: INTEGER; a_filename: POINTER): POINTER 
               -- xmlCreatePushParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreatePushParserCtxt"
               }"
               end

	xml_ctxt_read_doc (a_ctxt: POINTER; a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlCtxtReadDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadDoc"
               }"
               end

	xml_ctxt_read_fd (a_ctxt: POINTER; a_fd: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlCtxtReadFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadFd"
               }"
               end

	xml_ctxt_read_file (a_ctxt: POINTER; a_filename: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlCtxtReadFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadFile"
               }"
               end

	xml_ctxt_read_io (a_ctxt: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlCtxtReadIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadIO"
               }"
               end

	xml_ctxt_read_memory (a_ctxt: POINTER; a_buffer: POINTER; a_size: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlCtxtReadMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadMemory"
               }"
               end

	xml_ctxt_reset (a_ctxt: POINTER) 
               -- xmlCtxtReset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReset"
               }"
               end

	xml_ctxt_reset_push (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER; a_filename: POINTER; an_encoding: POINTER): INTEGER 
               -- xmlCtxtResetPush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtResetPush"
               }"
               end

	xml_ctxt_use_options (a_ctxt: POINTER; an_options: INTEGER): INTEGER 
               -- xmlCtxtUseOptions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtUseOptions"
               }"
               end

	xml_free_parser_ctxt (a_ctxt: POINTER) 
               -- xmlFreeParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeParserCtxt"
               }"
               end

	xml_get_external_entity_loader: POINTER 
               -- xmlGetExternalEntityLoader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetExternalEntityLoader"
               }"
               end

	xml_get_feature (a_ctxt: POINTER; a_name: POINTER; a_result: POINTER): INTEGER 
               -- xmlGetFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetFeature"
               }"
               end

	xml_get_features_list (a_len: POINTER; a_result: POINTER): INTEGER 
               -- xmlGetFeaturesList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetFeaturesList"
               }"
               end

	xml_has_feature (a_feature_external: INTEGER): INTEGER 
               -- xmlHasFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasFeature"
               }"
               end

	xml_init_node_info_seq (a_seq: POINTER) 
               -- xmlInitNodeInfoSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitNodeInfoSeq"
               }"
               end

	xml_init_parser 
               -- xmlInitParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitParser"
               }"
               end

	xml_init_parser_ctxt (a_ctxt: POINTER): INTEGER 
               -- xmlInitParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitParserCtxt"
               }"
               end

	xml_ioparse_dtd (a_sax: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER 
               -- xmlIOParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIOParseDTD"
               }"
               end

	xml_keep_blanks_default (a_val: INTEGER): INTEGER 
               -- xmlKeepBlanksDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlKeepBlanksDefault"
               }"
               end

	xml_line_numbers_default (a_val: INTEGER): INTEGER 
               -- xmlLineNumbersDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLineNumbersDefault"
               }"
               end

	xml_load_external_entity (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER 
               -- xmlLoadExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLoadExternalEntity"
               }"
               end

	xml_new_ioinput_stream (a_ctxt: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER 
               -- xmlNewIOInputStream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewIOInputStream"
               }"
               end

	xml_new_parser_ctxt: POINTER 
               -- xmlNewParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewParserCtxt"
               }"
               end

	xml_parse_balanced_chunk_memory (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; a_string: POINTER; a_lst: POINTER): INTEGER 
               -- xmlParseBalancedChunkMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseBalancedChunkMemory"
               }"
               end

	xml_parse_balanced_chunk_memory_recover (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; a_string: POINTER; a_lst: POINTER; a_recover: INTEGER): INTEGER 
               -- xmlParseBalancedChunkMemoryRecover
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseBalancedChunkMemoryRecover"
               }"
               end

	xml_parse_chunk (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER; a_terminate: INTEGER): INTEGER 
               -- xmlParseChunk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseChunk"
               }"
               end

	xml_parse_ctxt_external_entity (a_ctx: POINTER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER 
               -- xmlParseCtxtExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseCtxtExternalEntity"
               }"
               end

	xml_parse_doc (a_cur: POINTER): POINTER 
               -- xmlParseDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDoc"
               }"
               end

	xml_parse_document (a_ctxt: POINTER): INTEGER 
               -- xmlParseDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDocument"
               }"
               end

	xml_parse_dtd (an_external_id: POINTER; a_system_id: POINTER): POINTER 
               -- xmlParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDTD"
               }"
               end

	xml_parse_entity (a_filename: POINTER): POINTER 
               -- xmlParseEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseEntity"
               }"
               end

	xml_parse_ext_parsed_ent (a_ctxt: POINTER): INTEGER 
               -- xmlParseExtParsedEnt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseExtParsedEnt"
               }"
               end

	xml_parse_external_entity (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER 
               -- xmlParseExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseExternalEntity"
               }"
               end

	xml_parse_file (a_filename: POINTER): POINTER 
               -- xmlParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseFile"
               }"
               end

	xml_parse_in_node_context (a_node: POINTER; a_data: POINTER; a_datalen: INTEGER; an_options: INTEGER; a_lst: POINTER): INTEGER 
               -- xmlParseInNodeContext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseInNodeContext"
               }"
               end

	xml_parse_memory (a_buffer: POINTER; a_size: INTEGER): POINTER 
               -- xmlParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseMemory"
               }"
               end

	xml_parser_add_node_info (a_ctxt: POINTER; an_info: POINTER) 
               -- xmlParserAddNodeInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserAddNodeInfo"
               }"
               end

	xml_parser_find_node_info (a_ctxt: POINTER; a_node: POINTER): POINTER 
               -- xmlParserFindNodeInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserFindNodeInfo"
               }"
               end

	xml_parser_find_node_info_index (a_seq: POINTER; a_node: POINTER): like long_unsigned 
               -- xmlParserFindNodeInfoIndex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserFindNodeInfoIndex"
               }"
               end

	xml_parser_input_grow (an_in: POINTER; a_len: INTEGER): INTEGER 
               -- xmlParserInputGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputGrow"
               }"
               end

	xml_parser_input_read (an_in: POINTER; a_len: INTEGER): INTEGER 
               -- xmlParserInputRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputRead"
               }"
               end

	xml_pedantic_parser_default (a_val: INTEGER): INTEGER 
               -- xmlPedanticParserDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPedanticParserDefault"
               }"
               end

	xml_read_doc (a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlReadDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadDoc"
               }"
               end

	xml_read_fd (a_fd: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlReadFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadFd"
               }"
               end

	xml_read_file (an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlReadFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadFile"
               }"
               end

	xml_read_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlReadIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadIO"
               }"
               end

	xml_read_memory (a_buffer: POINTER; a_size: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 
               -- xmlReadMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadMemory"
               }"
               end

	xml_recover_doc (a_cur: POINTER): POINTER 
               -- xmlRecoverDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverDoc"
               }"
               end

	xml_recover_file (a_filename: POINTER): POINTER 
               -- xmlRecoverFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverFile"
               }"
               end

	xml_recover_memory (a_buffer: POINTER; a_size: INTEGER): POINTER 
               -- xmlRecoverMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverMemory"
               }"
               end

	xml_saxparse_doc (a_sax: POINTER; a_cur: POINTER; a_recovery: INTEGER): POINTER 
               -- xmlSAXParseDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseDoc"
               }"
               end

	xml_saxparse_dtd (a_sax: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 
               -- xmlSAXParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseDTD"
               }"
               end

	xml_saxparse_entity (a_sax: POINTER; a_filename: POINTER): POINTER 
               -- xmlSAXParseEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseEntity"
               }"
               end

	xml_saxparse_file (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER): POINTER 
               -- xmlSAXParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseFile"
               }"
               end

	xml_saxparse_file_with_data (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER; a_data: POINTER): POINTER 
               -- xmlSAXParseFileWithData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseFileWithData"
               }"
               end

	xml_saxparse_memory (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER; a_recovery: INTEGER): POINTER 
               -- xmlSAXParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseMemory"
               }"
               end

	xml_saxparse_memory_with_data (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER; a_recovery: INTEGER; a_data: POINTER): POINTER 
               -- xmlSAXParseMemoryWithData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseMemoryWithData"
               }"
               end

	xml_saxuser_parse_file (a_sax: POINTER; an_user_data: POINTER; a_filename: POINTER): INTEGER 
               -- xmlSAXUserParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXUserParseFile"
               }"
               end

	xml_saxuser_parse_memory (a_sax: POINTER; an_user_data: POINTER; a_buffer: POINTER; a_size: INTEGER): INTEGER 
               -- xmlSAXUserParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXUserParseMemory"
               }"
               end

	xml_set_external_entity_loader (a_f: POINTER) 
               -- xmlSetExternalEntityLoader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetExternalEntityLoader"
               }"
               end

	xml_set_feature (a_ctxt: POINTER; a_name: POINTER; a_value: POINTER): INTEGER 
               -- xmlSetFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetFeature"
               }"
               end

	xml_setup_parser_for_buffer (a_ctxt: POINTER; a_buffer: POINTER; a_filename: POINTER) 
               -- xmlSetupParserForBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetupParserForBuffer"
               }"
               end

	xml_stop_parser (a_ctxt: POINTER) 
               -- xmlStopParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStopParser"
               }"
               end

	xml_substitute_entities_default (a_val: INTEGER): INTEGER 
               -- xmlSubstituteEntitiesDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSubstituteEntitiesDefault"
               }"
               end


end -- class PARSER_EXTERNALS
