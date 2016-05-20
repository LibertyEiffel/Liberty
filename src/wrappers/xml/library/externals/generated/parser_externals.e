-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PARSER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_byte_consumed (a_ctxt: POINTER): like long 

		-- function xmlByteConsumed (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlByteConsumed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlByteConsumed"
               }"
               end

	xml_cleanup_parser 

		-- function xmlCleanupParser (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCleanupParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupParser"
               }"
               end

	xml_clear_node_info_seq (a_seq: POINTER) 

		-- function xmlClearNodeInfoSeq (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlClearNodeInfoSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlClearNodeInfoSeq"
               }"
               end

	xml_clear_parser_ctxt (a_ctxt: POINTER) 

		-- function xmlClearParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlClearParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlClearParserCtxt"
               }"
               end

	xml_create_doc_parser_ctxt (a_cur: POINTER): POINTER 

		-- function xmlCreateDocParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCreateDocParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateDocParserCtxt"
               }"
               end

	xml_create_ioparser_ctxt (a_sax: POINTER; an_user_data: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER 

		-- function xmlCreateIOParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCreateIOParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateIOParserCtxt"
               }"
               end

	xml_create_push_parser_ctxt (a_sax: POINTER; an_user_data: POINTER; a_chunk: POINTER; a_size: INTEGER; a_filename: POINTER): POINTER 

		-- function xmlCreatePushParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCreatePushParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreatePushParserCtxt"
               }"
               end

	xml_ctxt_read_doc (a_ctxt: POINTER; a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlCtxtReadDoc (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReadDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadDoc"
               }"
               end

	xml_ctxt_read_fd (a_ctxt: POINTER; a_fd: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlCtxtReadFd (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReadFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadFd"
               }"
               end

	xml_ctxt_read_file (a_ctxt: POINTER; a_filename: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlCtxtReadFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReadFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadFile"
               }"
               end

	xml_ctxt_read_io (a_ctxt: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlCtxtReadIO (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReadIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadIO"
               }"
               end

	xml_ctxt_read_memory (a_ctxt: POINTER; a_buffer: POINTER; a_size: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlCtxtReadMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReadMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReadMemory"
               }"
               end

	xml_ctxt_reset (a_ctxt: POINTER) 

		-- function xmlCtxtReset (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtReset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtReset"
               }"
               end

	xml_ctxt_reset_push (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER; a_filename: POINTER; an_encoding: POINTER): INTEGER 

		-- function xmlCtxtResetPush (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtResetPush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtResetPush"
               }"
               end

	xml_ctxt_use_options (a_ctxt: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlCtxtUseOptions (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlCtxtUseOptions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtUseOptions"
               }"
               end

	xml_free_parser_ctxt (a_ctxt: POINTER) 

		-- function xmlFreeParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlFreeParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeParserCtxt"
               }"
               end

	xml_get_external_entity_loader: POINTER 

		-- function xmlGetExternalEntityLoader (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlGetExternalEntityLoader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetExternalEntityLoader"
               }"
               end

	xml_get_feature (a_ctxt: POINTER; a_name: POINTER; a_result: POINTER): INTEGER 

		-- function xmlGetFeature (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlGetFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetFeature"
               }"
               end

	xml_get_features_list (a_len: POINTER; a_result: POINTER): INTEGER 

		-- function xmlGetFeaturesList (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlGetFeaturesList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetFeaturesList"
               }"
               end

	xml_has_feature (a_feature_external: INTEGER): INTEGER 

		-- function xmlHasFeature (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlHasFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasFeature"
               }"
               end

	xml_init_node_info_seq (a_seq: POINTER) 

		-- function xmlInitNodeInfoSeq (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlInitNodeInfoSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitNodeInfoSeq"
               }"
               end

	xml_init_parser 

		-- function xmlInitParser (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlInitParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitParser"
               }"
               end

	xml_init_parser_ctxt (a_ctxt: POINTER): INTEGER 

		-- function xmlInitParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlInitParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitParserCtxt"
               }"
               end

	xml_ioparse_dtd (a_sax: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER 

		-- function xmlIOParseDTD (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlIOParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIOParseDTD"
               }"
               end

	xml_keep_blanks_default (a_val: INTEGER): INTEGER 

		-- function xmlKeepBlanksDefault (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlKeepBlanksDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlKeepBlanksDefault"
               }"
               end

	xml_line_numbers_default (a_val: INTEGER): INTEGER 

		-- function xmlLineNumbersDefault (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlLineNumbersDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLineNumbersDefault"
               }"
               end

	xml_load_external_entity (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER 

		-- function xmlLoadExternalEntity (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlLoadExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLoadExternalEntity"
               }"
               end

	xml_new_ioinput_stream (a_ctxt: POINTER; an_input: POINTER; an_enc: INTEGER): POINTER 

		-- function xmlNewIOInputStream (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlNewIOInputStream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewIOInputStream"
               }"
               end

	xml_new_parser_ctxt: POINTER 

		-- function xmlNewParserCtxt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlNewParserCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewParserCtxt"
               }"
               end

	xml_parse_balanced_chunk_memory (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; a_string: POINTER; a_lst: POINTER): INTEGER 

		-- function xmlParseBalancedChunkMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseBalancedChunkMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseBalancedChunkMemory"
               }"
               end

	xml_parse_balanced_chunk_memory_recover (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; a_string: POINTER; a_lst: POINTER; a_recover: INTEGER): INTEGER 

		-- function xmlParseBalancedChunkMemoryRecover (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseBalancedChunkMemoryRecover
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseBalancedChunkMemoryRecover"
               }"
               end

	xml_parse_chunk (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER; a_terminate: INTEGER): INTEGER 

		-- function xmlParseChunk (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseChunk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseChunk"
               }"
               end

	xml_parse_ctxt_external_entity (a_ctx: POINTER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER 

		-- function xmlParseCtxtExternalEntity (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseCtxtExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseCtxtExternalEntity"
               }"
               end

	xml_parse_doc (a_cur: POINTER): POINTER 

		-- function xmlParseDoc (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDoc"
               }"
               end

	xml_parse_document (a_ctxt: POINTER): INTEGER 

		-- function xmlParseDocument (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDocument"
               }"
               end

	xml_parse_dtd (an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlParseDTD (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseDTD"
               }"
               end

	xml_parse_entity (a_filename: POINTER): POINTER 

		-- function xmlParseEntity (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseEntity"
               }"
               end

	xml_parse_ext_parsed_ent (a_ctxt: POINTER): INTEGER 

		-- function xmlParseExtParsedEnt (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseExtParsedEnt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseExtParsedEnt"
               }"
               end

	xml_parse_external_entity (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER; an_url: POINTER; an_id: POINTER; a_lst: POINTER): INTEGER 

		-- function xmlParseExternalEntity (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseExternalEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseExternalEntity"
               }"
               end

	xml_parse_file (a_filename: POINTER): POINTER 

		-- function xmlParseFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseFile"
               }"
               end

	xml_parse_in_node_context (a_node: POINTER; a_data: POINTER; a_datalen: INTEGER; an_options: INTEGER; a_lst: POINTER): INTEGER 

		-- function xmlParseInNodeContext (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseInNodeContext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseInNodeContext"
               }"
               end

	xml_parse_memory (a_buffer: POINTER; a_size: INTEGER): POINTER 

		-- function xmlParseMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseMemory"
               }"
               end

	xml_parser_add_node_info (a_ctxt: POINTER; an_info: POINTER) 

		-- function xmlParserAddNodeInfo (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParserAddNodeInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserAddNodeInfo"
               }"
               end

	xml_parser_find_node_info (a_ctxt: POINTER; a_node: POINTER): POINTER 

		-- function xmlParserFindNodeInfo (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParserFindNodeInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserFindNodeInfo"
               }"
               end

	xml_parser_find_node_info_index (a_seq: POINTER; a_node: POINTER): like long_unsigned 

		-- function xmlParserFindNodeInfoIndex (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParserFindNodeInfoIndex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserFindNodeInfoIndex"
               }"
               end

	xml_parser_input_grow (an_in: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlParserInputGrow (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParserInputGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputGrow"
               }"
               end

	xml_parser_input_read (an_in: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlParserInputRead (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlParserInputRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputRead"
               }"
               end

	xml_pedantic_parser_default (a_val: INTEGER): INTEGER 

		-- function xmlPedanticParserDefault (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlPedanticParserDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPedanticParserDefault"
               }"
               end

	xml_read_doc (a_cur: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlReadDoc (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlReadDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadDoc"
               }"
               end

	xml_read_fd (a_fd: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlReadFd (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlReadFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadFd"
               }"
               end

	xml_read_file (an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlReadFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlReadFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadFile"
               }"
               end

	xml_read_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlReadIO (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlReadIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadIO"
               }"
               end

	xml_read_memory (a_buffer: POINTER; a_size: INTEGER; an_url: POINTER; an_encoding: POINTER; an_options: INTEGER): POINTER 

		-- function xmlReadMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlReadMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReadMemory"
               }"
               end

	xml_recover_doc (a_cur: POINTER): POINTER 

		-- function xmlRecoverDoc (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlRecoverDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverDoc"
               }"
               end

	xml_recover_file (a_filename: POINTER): POINTER 

		-- function xmlRecoverFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlRecoverFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverFile"
               }"
               end

	xml_recover_memory (a_buffer: POINTER; a_size: INTEGER): POINTER 

		-- function xmlRecoverMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlRecoverMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRecoverMemory"
               }"
               end

	xml_saxparse_doc (a_sax: POINTER; a_cur: POINTER; a_recovery: INTEGER): POINTER 

		-- function xmlSAXParseDoc (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseDoc"
               }"
               end

	xml_saxparse_dtd (a_sax: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlSAXParseDTD (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseDTD
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseDTD"
               }"
               end

	xml_saxparse_entity (a_sax: POINTER; a_filename: POINTER): POINTER 

		-- function xmlSAXParseEntity (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseEntity"
               }"
               end

	xml_saxparse_file (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER): POINTER 

		-- function xmlSAXParseFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseFile"
               }"
               end

	xml_saxparse_file_with_data (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER; a_data: POINTER): POINTER 

		-- function xmlSAXParseFileWithData (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseFileWithData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseFileWithData"
               }"
               end

	xml_saxparse_memory (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER; a_recovery: INTEGER): POINTER 

		-- function xmlSAXParseMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseMemory"
               }"
               end

	xml_saxparse_memory_with_data (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER; a_recovery: INTEGER; a_data: POINTER): POINTER 

		-- function xmlSAXParseMemoryWithData (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXParseMemoryWithData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXParseMemoryWithData"
               }"
               end

	xml_saxuser_parse_file (a_sax: POINTER; an_user_data: POINTER; a_filename: POINTER): INTEGER 

		-- function xmlSAXUserParseFile (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXUserParseFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXUserParseFile"
               }"
               end

	xml_saxuser_parse_memory (a_sax: POINTER; an_user_data: POINTER; a_buffer: POINTER; a_size: INTEGER): INTEGER 

		-- function xmlSAXUserParseMemory (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSAXUserParseMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXUserParseMemory"
               }"
               end

	xml_set_external_entity_loader (a_f: POINTER) 

		-- function xmlSetExternalEntityLoader (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSetExternalEntityLoader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetExternalEntityLoader"
               }"
               end

	xml_set_feature (a_ctxt: POINTER; a_name: POINTER; a_value: POINTER): INTEGER 

		-- function xmlSetFeature (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSetFeature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetFeature"
               }"
               end

	xml_setup_parser_for_buffer (a_ctxt: POINTER; a_buffer: POINTER; a_filename: POINTER) 

		-- function xmlSetupParserForBuffer (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSetupParserForBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetupParserForBuffer"
               }"
               end

	xml_stop_parser (a_ctxt: POINTER) 

		-- function xmlStopParser (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlStopParser
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStopParser"
               }"
               end

	xml_substitute_entities_default (a_val: INTEGER): INTEGER 

		-- function xmlSubstituteEntitiesDefault (in `/usr/include/libxml2/libxml/parser.h')
               -- xmlSubstituteEntitiesDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSubstituteEntitiesDefault"
               }"
               end


end -- class PARSER_EXTERNALS
