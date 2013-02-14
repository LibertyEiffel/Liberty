-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XML_IO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function __xmlParserInputBufferCreateFilename skipped.
	xml_parser_input_buffer_create_filename (an_uri: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFilename (node at line 307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFilename"
		}"
		end

	xml_check_httpinput (a_ctxt: POINTER; a_ret: POINTER): POINTER is
 		-- xmlCheckHTTPInput (node at line 311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCheckHTTPInput"
		}"
		end

	xml_parser_input_buffer_push (an_in: POINTER; a_len: INTEGER_32; a_buf: POINTER): INTEGER_32 is
 		-- xmlParserInputBufferPush (node at line 374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferPush"
		}"
		end

	xml_output_buffer_create_buffer (a_buffer: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateBuffer (node at line 542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateBuffer"
		}"
		end

	xml_output_buffer_create_fd (a_fd: INTEGER_32; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateFd (node at line 574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFd"
		}"
		end

	xml_parser_input_buffer_create_file (a_file: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFile (node at line 637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFile"
		}"
		end

	xml_output_buffer_create_io (an_iowrite: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateIO (node at line 670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateIO"
		}"
		end

	xml_no_net_external_entity_loader (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER is
 		-- xmlNoNetExternalEntityLoader (node at line 1549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNoNetExternalEntityLoader"
		}"
		end

	xml_free_parser_input_buffer (an_in: POINTER) is
 		-- xmlFreeParserInputBuffer (node at line 2052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeParserInputBuffer"
		}"
		end

	xml_output_buffer_write (an_out_external: POINTER; a_len: INTEGER_32; a_buf: POINTER): INTEGER_32 is
 		-- xmlOutputBufferWrite (node at line 2084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWrite"
		}"
		end

	xml_register_default_input_callbacks is
 		-- xmlRegisterDefaultInputCallbacks (node at line 2174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterDefaultInputCallbacks()"
		}"
		end

	xml_check_filename (a_path: POINTER): INTEGER_32 is
 		-- xmlCheckFilename (node at line 2502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCheckFilename"
		}"
		end

	xml_register_default_output_callbacks is
 		-- xmlRegisterDefaultOutputCallbacks (node at line 2637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterDefaultOutputCallbacks()"
		}"
		end

	xml_parser_input_buffer_grow (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputBufferGrow (node at line 2686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferGrow"
		}"
		end

	xml_output_buffer_write_string (an_out_external: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlOutputBufferWriteString (node at line 2722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWriteString"
		}"
		end

	xml_parser_get_directory (a_filename: POINTER): POINTER is
 		-- xmlParserGetDirectory (node at line 2782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserGetDirectory"
		}"
		end

	xml_output_buffer_create_file (a_file: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateFile (node at line 2785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFile"
		}"
		end

	xml_alloc_output_buffer (an_encoder: POINTER): POINTER is
 		-- xmlAllocOutputBuffer (node at line 2797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAllocOutputBuffer"
		}"
		end

	xml_iohttpopen (a_filename: POINTER): POINTER is
 		-- xmlIOHTTPOpen (node at line 2855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPOpen"
		}"
		end

	xml_ioftpmatch (a_filename: POINTER): INTEGER_32 is
 		-- xmlIOFTPMatch (node at line 2989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPMatch"
		}"
		end

	xml_alloc_parser_input_buffer (an_enc: INTEGER): POINTER is
 		-- xmlAllocParserInputBuffer (node at line 2992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAllocParserInputBuffer"
		}"
		end

	xml_output_buffer_close (an_out_external: POINTER): INTEGER_32 is
 		-- xmlOutputBufferClose (node at line 3540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferClose"
		}"
		end

	xml_output_buffer_write_escape (an_out_external: POINTER; a_str: POINTER; an_escaping: POINTER): INTEGER_32 is
 		-- xmlOutputBufferWriteEscape (node at line 3700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWriteEscape"
		}"
		end

	xml_cleanup_output_callbacks is
 		-- xmlCleanupOutputCallbacks (node at line 3824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupOutputCallbacks()"
		}"
		end

	xml_register_input_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_read_func: POINTER; a_close_func: POINTER): INTEGER_32 is
 		-- xmlRegisterInputCallbacks (node at line 3828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterInputCallbacks"
		}"
		end

	xml_parser_input_buffer_read (an_in: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlParserInputBufferRead (node at line 3915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferRead"
		}"
		end

	xml_iohttpclose (a_context: POINTER): INTEGER_32 is
 		-- xmlIOHTTPClose (node at line 4028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPClose"
		}"
		end

	xml_ioftpopen (a_filename: POINTER): POINTER is
 		-- xmlIOFTPOpen (node at line 4115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPOpen"
		}"
		end

	xml_file_match (a_filename: POINTER): INTEGER_32 is
 		-- xmlFileMatch (node at line 4134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileMatch"
		}"
		end

	xml_ioftpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlIOFTPRead (node at line 4157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPRead"
		}"
		end

	xml_parser_input_buffer_create_fd (a_fd: INTEGER_32; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFd (node at line 4167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFd"
		}"
		end

	xml_output_buffer_flush (an_out_external: POINTER): INTEGER_32 is
 		-- xmlOutputBufferFlush (node at line 4186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferFlush"
		}"
		end

	xml_pop_input_callbacks: INTEGER_32 is
 		-- xmlPopInputCallbacks (node at line 4287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPopInputCallbacks()"
		}"
		end

	xml_output_buffer_create_filename (an_uri: POINTER; an_encoder: POINTER; a_compression: INTEGER_32): POINTER is
 		-- xmlOutputBufferCreateFilename (node at line 4390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFilename"
		}"
		end

	xml_iohttpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlIOHTTPRead (node at line 4718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPRead"
		}"
		end

	xml_ioftpclose (a_context: POINTER): INTEGER_32 is
 		-- xmlIOFTPClose (node at line 4824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPClose"
		}"
		end

	xml_file_open (a_filename: POINTER): POINTER is
 		-- xmlFileOpen (node at line 4849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileOpen"
		}"
		end

	xml_file_read (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlFileRead (node at line 4999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileRead"
		}"
		end

	xml_parser_input_buffer_create_mem (a_mem: POINTER; a_size: INTEGER_32; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateMem (node at line 5011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateMem"
		}"
		end

	xml_register_httppost_callbacks is
 		-- xmlRegisterHTTPPostCallbacks (node at line 5136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterHTTPPostCallbacks()"
		}"
		end

	xml_parser_input_buffer_create_static (a_mem: POINTER; a_size: INTEGER_32; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateStatic (node at line 5183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateStatic"
		}"
		end

	xml_normalize_windows_path (a_path: POINTER): POINTER is
 		-- xmlNormalizeWindowsPath (node at line 5220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNormalizeWindowsPath"
		}"
		end

	xml_iohttpmatch (a_filename: POINTER): INTEGER_32 is
 		-- xmlIOHTTPMatch (node at line 5287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPMatch"
		}"
		end

	xml_cleanup_input_callbacks is
 		-- xmlCleanupInputCallbacks (node at line 5802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupInputCallbacks()"
		}"
		end

	xml_register_output_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_write_func: POINTER; a_close_func: POINTER): INTEGER_32 is
 		-- xmlRegisterOutputCallbacks (node at line 5827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterOutputCallbacks"
		}"
		end

	-- `hidden' function __xmlOutputBufferCreateFilename skipped.
	xml_file_close (a_context: POINTER): INTEGER_32 is
 		-- xmlFileClose (node at line 5926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileClose"
		}"
		end

	xml_iohttpopen_w (a_post_uri: POINTER; a_compression: INTEGER_32): POINTER is
 		-- xmlIOHTTPOpenW (node at line 5997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPOpenW"
		}"
		end

	xml_parser_input_buffer_create_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateIO (node at line 6010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateIO"
		}"
		end


end -- class XML_IO_EXTERNALS
