-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PARSER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_parser_find_node_info_index (a_seq: POINTER; a_node: POINTER): NATURAL_64 is
 		-- xmlParserFindNodeInfoIndex (node at line 84)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserFindNodeInfoIndex"
		}"
		end

	xml_ctxt_read_fd (a_ctxt: POINTER; a_fd: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFd (node at line 148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadFd"
		}"
		end

	xml_init_parser_ctxt (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlInitParserCtxt (node at line 194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitParserCtxt"
		}"
		end

	xml_init_parser is
 		-- xmlInitParser (node at line 455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitParser()"
		}"
		end

	xml_saxparse_file_with_data (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseFileWithData (node at line 578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseFileWithData"
		}"
		end

	xml_saxuser_parse_memory (a_sax: POINTER; an_user_data: POINTER; a_buffer: POINTER; a_size: INTEGER_32): INTEGER_32 is
 		-- xmlSAXUserParseMemory (node at line 643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXUserParseMemory"
		}"
		end

	xml_stop_parser (a_ctxt: POINTER) is
 		-- xmlStopParser (node at line 665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStopParser"
		}"
		end

	xml_parser_find_node_info (a_ctxt: POINTER; a_node: POINTER): POINTER is
 		-- xmlParserFindNodeInfo (node at line 1447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserFindNodeInfo"
		}"
		end

	xml_parser_input_read (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputRead (node at line 1491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputRead"
		}"
		end

	xml_parse_entity (a_filename: POINTER): POINTER is
 		-- xmlParseEntity (node at line 1518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseEntity"
		}"
		end

	xml_parse_balanced_chunk_memory (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseBalancedChunkMemory (node at line 1663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseBalancedChunkMemory"
		}"
		end

	xml_parse_ext_parsed_ent (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseExtParsedEnt (node at line 1695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseExtParsedEnt"
		}"
		end

	xml_parse_ctxt_external_entity (a_ctx: POINTER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseCtxtExternalEntity (node at line 1766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseCtxtExternalEntity"
		}"
		end

	xml_saxparse_memory_with_data (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseMemoryWithData (node at line 2107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseMemoryWithData"
		}"
		end

	xml_ctxt_read_io (a_ctxt: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadIO (node at line 2135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadIO"
		}"
		end

	xml_parse_memory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlParseMemory (node at line 2153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseMemory"
		}"
		end

	xml_new_parser_ctxt: POINTER is
 		-- xmlNewParserCtxt (node at line 2173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewParserCtxt()"
		}"
		end

	xml_ctxt_use_options (a_ctxt: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlCtxtUseOptions (node at line 2216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtUseOptions"
		}"
		end

	xml_load_external_entity (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER is
 		-- xmlLoadExternalEntity (node at line 2297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLoadExternalEntity"
		}"
		end

	xml_parse_in_node_context (a_node: POINTER; a_data: POINTER; a_datalen: INTEGER_32; an_options: INTEGER_32; a_lst: POINTER): INTEGER is
 		-- xmlParseInNodeContext (node at line 2340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseInNodeContext"
		}"
		end

	xml_line_numbers_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlLineNumbersDefault (node at line 2408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLineNumbersDefault"
		}"
		end

	xml_parse_dtd (an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlParseDTD (node at line 2465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDTD"
		}"
		end

	xml_byte_consumed (a_ctxt: POINTER): INTEGER_64 is
 		-- xmlByteConsumed (node at line 2531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlByteConsumed"
		}"
		end

	xml_recover_doc (a_cur: POINTER): POINTER is
 		-- xmlRecoverDoc (node at line 2682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverDoc"
		}"
		end

	xml_cleanup_parser is
 		-- xmlCleanupParser (node at line 2692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupParser()"
		}"
		end

	xml_read_memory (a_buffer: POINTER; a_size: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadMemory (node at line 2765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadMemory"
		}"
		end

	xml_setup_parser_for_buffer (a_ctxt: POINTER; a_buffer: POINTER; a_filename: POINTER) is
 		-- xmlSetupParserForBuffer (node at line 2968)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetupParserForBuffer"
		}"
		end

	xml_get_features_list (a_len: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeaturesList (node at line 3005)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetFeaturesList"
		}"
		end

	xml_parse_doc (a_cur: POINTER): POINTER is
 		-- xmlParseDoc (node at line 3033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDoc"
		}"
		end

	xml_substitute_entities_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlSubstituteEntitiesDefault (node at line 3036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSubstituteEntitiesDefault"
		}"
		end

	xml_ctxt_read_memory (a_ctxt: POINTER; a_buffer: POINTER; a_size: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadMemory (node at line 3109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadMemory"
		}"
		end

	xml_create_ioparser_ctxt (a_sax: POINTER; an_user_data: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlCreateIOParserCtxt (node at line 3165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateIOParserCtxt"
		}"
		end

	xml_parse_file (a_filename: POINTER): POINTER is
 		-- xmlParseFile (node at line 3232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseFile"
		}"
		end

	xml_recover_file (a_filename: POINTER): POINTER is
 		-- xmlRecoverFile (node at line 3319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverFile"
		}"
		end

	xml_get_feature (a_ctxt: POINTER; a_name: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeature (node at line 3363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetFeature"
		}"
		end

	xml_ctxt_reset (a_ctxt: POINTER) is
 		-- xmlCtxtReset (node at line 3520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReset"
		}"
		end

	xml_read_file (an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFile (node at line 3589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadFile"
		}"
		end

	xml_parse_balanced_chunk_memory_recover (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER; a_recover: INTEGER_32): INTEGER_32 is
 		-- xmlParseBalancedChunkMemoryRecover (node at line 3728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseBalancedChunkMemoryRecover"
		}"
		end

	xml_has_feature (a_feature_external: INTEGER): INTEGER_32 is
 		-- xmlHasFeature (node at line 3780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasFeature"
		}"
		end

	xml_init_node_info_seq (a_seq: POINTER) is
 		-- xmlInitNodeInfoSeq (node at line 3812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitNodeInfoSeq"
		}"
		end

	xml_saxparse_file (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseFile (node at line 4109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseFile"
		}"
		end

	xml_ctxt_reset_push (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlCtxtResetPush (node at line 4214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtResetPush"
		}"
		end

	xml_recover_memory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlRecoverMemory (node at line 4228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRecoverMemory"
		}"
		end

	xml_keep_blanks_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlKeepBlanksDefault (node at line 4312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlKeepBlanksDefault"
		}"
		end

	xml_parse_document (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseDocument (node at line 4324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseDocument"
		}"
		end

	xml_pedantic_parser_default (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlPedanticParserDefault (node at line 4382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPedanticParserDefault"
		}"
		end

	xml_clear_parser_ctxt (a_ctxt: POINTER) is
 		-- xmlClearParserCtxt (node at line 4420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlClearParserCtxt"
		}"
		end

	xml_ioparse_dtd (a_sax: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlIOParseDTD (node at line 4430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOParseDTD"
		}"
		end

	xml_create_doc_parser_ctxt (a_cur: POINTER): POINTER is
 		-- xmlCreateDocParserCtxt (node at line 4879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateDocParserCtxt"
		}"
		end

	xml_new_ioinput_stream (a_ctxt: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlNewIOInputStream (node at line 4920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewIOInputStream"
		}"
		end

	xml_clear_node_info_seq (a_seq: POINTER) is
 		-- xmlClearNodeInfoSeq (node at line 4935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlClearNodeInfoSeq"
		}"
		end

	xml_saxuser_parse_file (a_sax: POINTER; an_user_data: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- xmlSAXUserParseFile (node at line 4941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXUserParseFile"
		}"
		end

	xml_parser_add_node_info (a_ctxt: POINTER; an_info: POINTER) is
 		-- xmlParserAddNodeInfo (node at line 5004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserAddNodeInfo"
		}"
		end

	xml_set_feature (a_ctxt: POINTER; a_name: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlSetFeature (node at line 5038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetFeature"
		}"
		end

	xml_read_doc (a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadDoc (node at line 5075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadDoc"
		}"
		end

	xml_parser_input_grow (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputGrow (node at line 5084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputGrow"
		}"
		end

	xml_ctxt_read_doc (a_ctxt: POINTER; a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadDoc (node at line 5121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadDoc"
		}"
		end

	xml_saxparse_dtd (a_sax: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlSAXParseDTD (node at line 5161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseDTD"
		}"
		end

	xml_saxparse_doc (a_sax: POINTER; a_cur: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseDoc (node at line 5246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseDoc"
		}"
		end

	xml_saxparse_memory (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseMemory (node at line 5295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseMemory"
		}"
		end

	xml_free_parser_ctxt (a_ctxt: POINTER) is
 		-- xmlFreeParserCtxt (node at line 5301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeParserCtxt"
		}"
		end

	xml_parse_chunk (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_terminate: INTEGER_32): INTEGER_32 is
 		-- xmlParseChunk (node at line 5315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseChunk"
		}"
		end

	xml_get_external_entity_loader: POINTER is
 		-- xmlGetExternalEntityLoader (node at line 5422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetExternalEntityLoader()"
		}"
		end

	xml_parse_external_entity (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseExternalEntity (node at line 5537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseExternalEntity"
		}"
		end

	xml_read_fd (a_fd: INTEGER_32; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFd (node at line 5651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadFd"
		}"
		end

	xml_read_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadIO (node at line 5717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReadIO"
		}"
		end

	xml_saxparse_entity (a_sax: POINTER; a_filename: POINTER): POINTER is
 		-- xmlSAXParseEntity (node at line 5836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXParseEntity"
		}"
		end

	xml_create_push_parser_ctxt (a_sax: POINTER; an_user_data: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER): POINTER is
 		-- xmlCreatePushParserCtxt (node at line 5863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreatePushParserCtxt"
		}"
		end

	xml_set_external_entity_loader (a_f: POINTER) is
 		-- xmlSetExternalEntityLoader (node at line 5921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetExternalEntityLoader"
		}"
		end

	xml_ctxt_read_file (a_ctxt: POINTER; a_filename: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFile (node at line 5961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtReadFile"
		}"
		end


end -- class PARSER_EXTERNALS
