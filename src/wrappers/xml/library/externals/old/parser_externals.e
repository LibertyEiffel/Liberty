-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class PARSER_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	xmlparserfindnodeinfoindex (a_seq: POINTER; a_node: POINTER): NATURAL_32 is
 		-- xmlParserFindNodeInfoIndex
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParserFindNodeInfoIndex"
		}"
		end

	xmlctxtreadfd (a_ctxt: POINTER; a_fd: INTEGER_32; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFd
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReadFd"
		}"
		end

	xmlinitparserctxt (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlInitParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlInitParserCtxt"
		}"
		end

	xmlinitparser is
 		-- xmlInitParser
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlInitParser"
		}"
		end

	xmlgetfeatureslist (a_len: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeaturesList
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlGetFeaturesList"
		}"
		end

	xmlsaxparsefilewithdata (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseFileWithData
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseFileWithData"
		}"
		end

	xmlsaxuserparsememory (a_sax: POINTER; an_user_data: POINTER; a_buffer: POINTER; a_size: INTEGER_32): INTEGER_32 is
 		-- xmlSAXUserParseMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXUserParseMemory"
		}"
		end

	xmlstopparser (a_ctxt: POINTER) is
 		-- xmlStopParser
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlStopParser"
		}"
		end

	xmlparserfindnodeinfo (a_ctxt: POINTER; a_node: POINTER): POINTER is
 		-- xmlParserFindNodeInfo
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParserFindNodeInfo"
		}"
		end

	xmlparserinputread (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputRead
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParserInputRead"
		}"
		end

	xmlparseentity (a_filename: POINTER): POINTER is
 		-- xmlParseEntity
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseEntity"
		}"
		end

	xmlparsebalancedchunkmemory (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseBalancedChunkMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseBalancedChunkMemory"
		}"
		end

	xmlparseextparsedent (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseExtParsedEnt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseExtParsedEnt"
		}"
		end

	xmlparsectxtexternalentity (a_ctx: POINTER; an_u_rl: POINTER; an_i_d: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseCtxtExternalEntity
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseCtxtExternalEntity"
		}"
		end

	xmlsaxparsememorywithdata (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlSAXParseMemoryWithData
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseMemoryWithData"
		}"
		end

	xmlctxtreadio (a_ctxt: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadIO
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReadIO"
		}"
		end

	xmlparsememory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlParseMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseMemory"
		}"
		end

	xmlnewparserctxt: POINTER is
 		-- xmlNewParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlNewParserCtxt"
		}"
		end

	xmlctxtuseoptions (a_ctxt: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlCtxtUseOptions
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtUseOptions"
		}"
		end

	xmlloadexternalentity (an_u_rl: POINTER; an_i_d: POINTER; a_ctxt: POINTER): POINTER is
 		-- xmlLoadExternalEntity
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlLoadExternalEntity"
		}"
		end

	xmlsaxparseentity (a_sax: POINTER; a_filename: POINTER): POINTER is
 		-- xmlSAXParseEntity
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseEntity"
		}"
		end

	xmlparseinnodecontext (a_node: POINTER; a_data: POINTER; a_datalen: INTEGER_32; an_options: INTEGER_32; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseInNodeContext
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseInNodeContext"
		}"
		end

	xmllinenumbersdefault (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlLineNumbersDefault
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlLineNumbersDefault"
		}"
		end

	xmlparsedtd (an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlParseDTD
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseDTD"
		}"
		end

	xmlbyteconsumed (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlByteConsumed
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlByteConsumed"
		}"
		end

	xmlrecoverdoc (a_cur: POINTER): POINTER is
 		-- xmlRecoverDoc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlRecoverDoc"
		}"
		end

	xmlcleanupparser is
 		-- xmlCleanupParser
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCleanupParser"
		}"
		end

	xmlreadmemory (a_buffer: POINTER; a_size: INTEGER_32; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlReadMemory"
		}"
		end

	xmlsetupparserforbuffer (a_ctxt: POINTER; a_buffer: POINTER; a_filename: POINTER) is
 		-- xmlSetupParserForBuffer
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSetupParserForBuffer"
		}"
		end

	xmlparsedoc (a_cur: POINTER): POINTER is
 		-- xmlParseDoc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseDoc"
		}"
		end

	xmlsubstituteentitiesdefault (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlSubstituteEntitiesDefault
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSubstituteEntitiesDefault"
		}"
		end

	xmlctxtreadmemory (a_ctxt: POINTER; a_buffer: POINTER; a_size: INTEGER_32; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReadMemory"
		}"
		end

	xmlcreateioparserctxt (a_sax: POINTER; an_user_data: POINTER; an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER_32): POINTER is
 		-- xmlCreateIOParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCreateIOParserCtxt"
		}"
		end

	xmlparsefile (a_filename: POINTER): POINTER is
 		-- xmlParseFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseFile"
		}"
		end

	xmlrecoverfile (a_filename: POINTER): POINTER is
 		-- xmlRecoverFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlRecoverFile"
		}"
		end

	xmlgetfeature (a_ctxt: POINTER; a_name: POINTER; a_result: POINTER): INTEGER_32 is
 		-- xmlGetFeature
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlGetFeature"
		}"
		end

	xmlctxtreset (a_ctxt: POINTER) is
 		-- xmlCtxtReset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReset"
		}"
		end

	xmlreadfile (an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlReadFile"
		}"
		end

	xmlparsebalancedchunkmemoryrecover (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; a_string: POINTER; a_lst: POINTER; a_recover: INTEGER_32): INTEGER_32 is
 		-- xmlParseBalancedChunkMemoryRecover
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseBalancedChunkMemoryRecover"
		}"
		end

	xmlhasfeature (a_feature_external: INTEGER_32): INTEGER_32 is
 		-- xmlHasFeature
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlHasFeature"
		}"
		end

	xmlinitnodeinfoseq (a_seq: POINTER) is
 		-- xmlInitNodeInfoSeq
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlInitNodeInfoSeq"
		}"
		end

	xmlsaxparsefile (a_sax: POINTER; a_filename: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseFile"
		}"
		end

	xmlctxtresetpush (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlCtxtResetPush
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtResetPush"
		}"
		end

	xmlrecovermemory (a_buffer: POINTER; a_size: INTEGER_32): POINTER is
 		-- xmlRecoverMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlRecoverMemory"
		}"
		end

	xmlkeepblanksdefault (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlKeepBlanksDefault
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlKeepBlanksDefault"
		}"
		end

	xmlparsedocument (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlParseDocument
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseDocument"
		}"
		end

	xmlpedanticparserdefault (a_val: INTEGER_32): INTEGER_32 is
 		-- xmlPedanticParserDefault
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlPedanticParserDefault"
		}"
		end

	xmlclearparserctxt (a_ctxt: POINTER) is
 		-- xmlClearParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlClearParserCtxt"
		}"
		end

	xmlioparsedtd (a_sax: POINTER; an_input: POINTER; an_enc: INTEGER_32): POINTER is
 		-- xmlIOParseDTD
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlIOParseDTD"
		}"
		end

	xmlcreatedocparserctxt (a_cur: POINTER): POINTER is
 		-- xmlCreateDocParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCreateDocParserCtxt"
		}"
		end

	xmlnewioinputstream (a_ctxt: POINTER; an_input: POINTER; an_enc: INTEGER_32): POINTER is
 		-- xmlNewIOInputStream
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlNewIOInputStream"
		}"
		end

	xmlclearnodeinfoseq (a_seq: POINTER) is
 		-- xmlClearNodeInfoSeq
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlClearNodeInfoSeq"
		}"
		end

	xmlsaxuserparsefile (a_sax: POINTER; an_user_data: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- xmlSAXUserParseFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXUserParseFile"
		}"
		end

	xmlparseraddnodeinfo (a_ctxt: POINTER; an_info: POINTER) is
 		-- xmlParserAddNodeInfo
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParserAddNodeInfo"
		}"
		end

	xmlsetfeature (a_ctxt: POINTER; a_name: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlSetFeature
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSetFeature"
		}"
		end

	xmlreaddoc (a_cur: POINTER; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadDoc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlReadDoc"
		}"
		end

	xmlparserinputgrow (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputGrow
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParserInputGrow"
		}"
		end

	xmlctxtreaddoc (a_ctxt: POINTER; a_cur: POINTER; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadDoc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReadDoc"
		}"
		end

	xmlsaxparsedtd (a_sax: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlSAXParseDTD
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseDTD"
		}"
		end

	xmlsaxparsedoc (a_sax: POINTER; a_cur: POINTER; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseDoc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseDoc"
		}"
		end

	xmlsaxparsememory (a_sax: POINTER; a_buffer: POINTER; a_size: INTEGER_32; a_recovery: INTEGER_32): POINTER is
 		-- xmlSAXParseMemory
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSAXParseMemory"
		}"
		end

	xmlfreeparserctxt (a_ctxt: POINTER) is
 		-- xmlFreeParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlFreeParserCtxt"
		}"
		end

	xmlparsechunk (a_ctxt: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_terminate: INTEGER_32): INTEGER_32 is
 		-- xmlParseChunk
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseChunk"
		}"
		end

	xmlgetexternalentityloader: POINTER is
 		-- xmlGetExternalEntityLoader
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlGetExternalEntityLoader"
		}"
		end

	xmlparseexternalentity (a_doc: POINTER; a_sax: POINTER; an_user_data: POINTER; a_depth: INTEGER_32; an_u_rl: POINTER; an_i_d: POINTER; a_lst: POINTER): INTEGER_32 is
 		-- xmlParseExternalEntity
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlParseExternalEntity"
		}"
		end

	xmlreadfd (a_fd: INTEGER_32; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadFd
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlReadFd"
		}"
		end

	xmlreadio (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_u_rl: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlReadIO
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlReadIO"
		}"
		end

	xmlcreatepushparserctxt (a_sax: POINTER; an_user_data: POINTER; a_chunk: POINTER; a_size: INTEGER_32; a_filename: POINTER): POINTER is
 		-- xmlCreatePushParserCtxt
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCreatePushParserCtxt"
		}"
		end

	xmlsetexternalentityloader (a_f: POINTER) is
 		-- xmlSetExternalEntityLoader
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlSetExternalEntityLoader"
		}"
		end

	xmlctxtreadfile (a_ctxt: POINTER; a_filename: POINTER; an_encoding: POINTER; an_options: INTEGER_32): POINTER is
 		-- xmlCtxtReadFile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlCtxtReadFile"
		}"
		end

end
