-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PARSER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_byte_consumed (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlByteConsumed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlByteConsumed"
		}"
		end

	xml_cleanup_parser is
 		-- xmlCleanupParser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupParser()"
		}"
		end

	xml_clear_node_info_seq (a_seq: POINTER) is
 		-- xmlClearNodeInfoSeq
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlClearNodeInfoSeq"
		}"
		end

	xml_clear_parser_ctxt (a_ctxt: POINTER) is
 		-- xmlClearParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlClearParserCtxt"
		}"
		end

	xml_create_doc_parser_ctxt (a_cur: POINTER): POINTER is
 		-- xmlCreateDocParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateDocParserCtxt"
		}"
		end

	xml_create_ioparser_ctxt (a_sax: POINTER; an_user_data: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlCreateIOParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateIOParserCtxt"
		}"
		end

	xml_create_push_parser_ctxt (a_sax: POINTER; an_user_data: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER): POINTER is
 		-- xmlCreatePushParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreatePushParserCtxt"
		}"
		end

	xml_ctxt_read_doc (a_ctxt: POINTER; a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadDoc"
		}"
		end

	xml_ctxt_read_fd (a_ctxt: POINTER; a_fd: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadFd"
		}"
		end

	xml_ctxt_read_file (a_ctxt: POINTER; a_filename: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadFile"
		}"
		end

	xml_ctxt_read_io (a_ctxt: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadIO
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadIO"
		}"
		end

	xml_ctxt_read_memory (a_ctxt: POINTER; a_buffer: POINTER; a_size: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadMemory"
		}"
		end

	xml_ctxt_reset (a_ctxt: POINTER) is
 		-- xmlCtxtReset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReset"
		}"
		end

	xml_ctxt_reset_push (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlCtxtResetPush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtResetPush"
		}"
		end

	xml_ctxt_use_options (a_ctxt: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlCtxtUseOptions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtUseOptions"
		}"
		end

	xml_free_parser_ctxt (a_ctxt: POINTER) is
 		-- xmlFreeParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeParserCtxt"
		}"
		end

	xml_get_external_entity_loader: POINTER is
 		-- xmlGetExternalEntityLoader
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetExternalEntityLoader()"
		}"
		end

	xml_get_feature (a_ctxt: POINTER; a_name: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeature
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetFeature"
		}"
		end

	xml_get_features_list (a_len: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeaturesList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetFeaturesList"
		}"
		end

	xml_has_feature (a_feature_external: INTEGER): INTEGER_32 is
 		-- xmlHasFeature
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasFeature"
		}"
		end

	xml_init_node_info_seq (a_seq: POINTER) is
 		-- xmlInitNodeInfoSeq
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitNodeInfoSeq"
		}"
		end

	xml_init_parser is
 		-- xmlInitParser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitParser()"
		}"
		end

	xml_init_parser_ctxt (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlInitParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitParserCtxt"
		}"
		end

	xml_ioparse_dtd (a_sax: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlIOParseDTD
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOParseDTD"
		}"
		end

	xml_keep_blanks_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlKeepBlanksDefault
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlKeepBlanksDefault"
		}"
		end

	xml_line_numbers_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlLineNumbersDefault
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLineNumbersDefault"
		}"
		end

	xml_load_external_entity (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER is
 		-- xmlLoadExternalEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLoadExternalEntity"
		}"
		end

	xml_new_ioinput_stream (a_ctxt: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlNewIOInputStream
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewIOInputStream"
		}"
		end

	xml_new_parser_ctxt: POINTER is
 		-- xmlNewParserCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewParserCtxt()"
		}"
		end

	xml_parse_balanced_chunk_memory (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseBalancedChunkMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseBalancedChunkMemory"
		}"
		end

	xml_parse_balanced_chunk_memory_recover (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER; a_recover: INTEGER_32): INTEGER_32 is
 		-- xmlParseBalancedChunkMemoryRecover
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseBalancedChunkMemoryRecover"
		}"
		end

	xml_parse_chunk (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_terminate: INTEGER_32): INTEGER_32 is
 		-- xmlParseChunk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseChunk"
		}"
		end

	xml_parse_ctxt_external_entity (a_ctx: POINTER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseCtxtExternalEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseCtxtExternalEntity"
		}"
		end

	xml_parse_doc (a_cur: POINTER): POINTER is
 		-- xmlParseDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDoc"
		}"
		end

	xml_parse_document (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseDocument
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDocument"
		}"
		end

	xml_parse_dtd (an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlParseDTD
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDTD"
		}"
		end

	xml_parse_entity (a_filename: POINTER): POINTER is
 		-- xmlParseEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseEntity"
		}"
		end

	xml_parse_ext_parsed_ent (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseExtParsedEnt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseExtParsedEnt"
		}"
		end

	xml_parse_external_entity (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseExternalEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseExternalEntity"
		}"
		end

	xml_parse_file (a_filename: POINTER): POINTER is
 		-- xmlParseFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseFile"
		}"
		end

	xml_parse_in_node_context (a_node: POINTER; a_data: POINTER; a_datalen: INTEGER_32; an_options: INTEGER_32; a_lst: POINTER): INTEGER is
 		-- xmlParseInNodeContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseInNodeContext"
		}"
		end

	xml_parse_memory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlParseMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseMemory"
		}"
		end

	xml_parser_add_node_info (a_ctxt: POINTER; an_info: POINTER) is
 		-- xmlParserAddNodeInfo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserAddNodeInfo"
		}"
		end

	xml_parser_find_node_info (a_ctxt: POINTER; a_node: POINTER): POINTER is
 		-- xmlParserFindNodeInfo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserFindNodeInfo"
		}"
		end

	xml_parser_find_node_info_index (a_seq: POINTER; a_node: POINTER): NATURAL_32 is
 		-- xmlParserFindNodeInfoIndex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserFindNodeInfoIndex"
		}"
		end

	xml_parser_input_grow (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputGrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputGrow"
		}"
		end

	xml_parser_input_read (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputRead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputRead"
		}"
		end

	xml_pedantic_parser_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlPedanticParserDefault
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPedanticParserDefault"
		}"
		end

	xml_read_doc (a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadDoc"
		}"
		end

	xml_read_fd (a_fd: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadFd"
		}"
		end

	xml_read_file (an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadFile"
		}"
		end

	xml_read_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadIO
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadIO"
		}"
		end

	xml_read_memory (a_buffer: POINTER; a_size: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadMemory"
		}"
		end

	xml_recover_doc (a_cur: POINTER): POINTER is
 		-- xmlRecoverDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverDoc"
		}"
		end

	xml_recover_file (a_filename: POINTER): POINTER is
 		-- xmlRecoverFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverFile"
		}"
		end

	xml_recover_memory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlRecoverMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverMemory"
		}"
		end

	xml_saxparse_doc (a_sax: POINTER; a_cur: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseDoc"
		}"
		end

	xml_saxparse_dtd (a_sax: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlSAXParseDTD
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseDTD"
		}"
		end

	xml_saxparse_entity (a_sax: POINTER; a_filename: POINTER): POINTER is
 		-- xmlSAXParseEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseEntity"
		}"
		end

	xml_saxparse_file (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseFile"
		}"
		end

	xml_saxparse_file_with_data (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseFileWithData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseFileWithData"
		}"
		end

	xml_saxparse_memory (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseMemory"
		}"
		end

	xml_saxparse_memory_with_data (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseMemoryWithData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseMemoryWithData"
		}"
		end

	xml_saxuser_parse_file (a_sax: POINTER; an_user_data: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- xmlSAXUserParseFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXUserParseFile"
		}"
		end

	xml_saxuser_parse_memory (a_sax: POINTER; an_user_data: POINTER; a_buffer: POINTER; a_size: INTEGER_32): INTEGER_32 is
 		-- xmlSAXUserParseMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXUserParseMemory"
		}"
		end

	xml_set_external_entity_loader (a_f: POINTER) is
 		-- xmlSetExternalEntityLoader
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetExternalEntityLoader"
		}"
		end

	xml_set_feature (a_ctxt: POINTER; a_name: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlSetFeature
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetFeature"
		}"
		end

	xml_setup_parser_for_buffer (a_ctxt: POINTER; a_buffer: POINTER; a_filename: POINTER) is
 		-- xmlSetupParserForBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetupParserForBuffer"
		}"
		end

	xml_stop_parser (a_ctxt: POINTER) is
 		-- xmlStopParser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStopParser"
		}"
		end

	xml_substitute_entities_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlSubstituteEntitiesDefault
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSubstituteEntitiesDefault"
		}"
		end


end -- class PARSER_EXTERNALS
