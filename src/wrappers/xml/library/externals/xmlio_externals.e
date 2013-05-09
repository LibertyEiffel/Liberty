-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_alloc_output_buffer (an_encoder: POINTER): POINTER is
 		-- xmlAllocOutputBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAllocOutputBuffer"
		}"
		end

	xml_alloc_parser_input_buffer (an_enc: INTEGER): POINTER is
 		-- xmlAllocParserInputBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAllocParserInputBuffer"
		}"
		end

	xml_check_filename (a_path: POINTER): INTEGER is
 		-- xmlCheckFilename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCheckFilename"
		}"
		end

	xml_check_httpinput (a_ctxt: POINTER; a_ret: POINTER): POINTER is
 		-- xmlCheckHTTPInput
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCheckHTTPInput"
		}"
		end

	xml_cleanup_input_callbacks is
 		-- xmlCleanupInputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupInputCallbacks()"
		}"
		end

	xml_cleanup_output_callbacks is
 		-- xmlCleanupOutputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupOutputCallbacks()"
		}"
		end

	xml_file_close (a_context: POINTER): INTEGER is
 		-- xmlFileClose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileClose"
		}"
		end

	xml_file_match (a_filename: POINTER): INTEGER is
 		-- xmlFileMatch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileMatch"
		}"
		end

	xml_file_open (a_filename: POINTER): POINTER is
 		-- xmlFileOpen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileOpen"
		}"
		end

	xml_file_read (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlFileRead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFileRead"
		}"
		end

	xml_free_parser_input_buffer (an_in: POINTER) is
 		-- xmlFreeParserInputBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeParserInputBuffer"
		}"
		end

	xml_ioftpclose (a_context: POINTER): INTEGER is
 		-- xmlIOFTPClose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPClose"
		}"
		end

	xml_ioftpmatch (a_filename: POINTER): INTEGER is
 		-- xmlIOFTPMatch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPMatch"
		}"
		end

	xml_ioftpopen (a_filename: POINTER): POINTER is
 		-- xmlIOFTPOpen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPOpen"
		}"
		end

	xml_ioftpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlIOFTPRead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOFTPRead"
		}"
		end

	xml_iohttpclose (a_context: POINTER): INTEGER is
 		-- xmlIOHTTPClose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPClose"
		}"
		end

	xml_iohttpmatch (a_filename: POINTER): INTEGER is
 		-- xmlIOHTTPMatch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPMatch"
		}"
		end

	xml_iohttpopen (a_filename: POINTER): POINTER is
 		-- xmlIOHTTPOpen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPOpen"
		}"
		end

	xml_iohttpopen_w (a_post_uri: POINTER; a_compression: INTEGER): POINTER is
 		-- xmlIOHTTPOpenW
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPOpenW"
		}"
		end

	xml_iohttpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlIOHTTPRead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIOHTTPRead"
		}"
		end

	xml_no_net_external_entity_loader (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER is
 		-- xmlNoNetExternalEntityLoader
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNoNetExternalEntityLoader"
		}"
		end

	xml_normalize_windows_path (a_path: POINTER): POINTER is
 		-- xmlNormalizeWindowsPath
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNormalizeWindowsPath"
		}"
		end

	xml_output_buffer_close (an_out_external: POINTER): INTEGER is
 		-- xmlOutputBufferClose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferClose"
		}"
		end

	xml_output_buffer_create_buffer (a_buffer: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateBuffer"
		}"
		end

	xml_output_buffer_create_fd (a_fd: INTEGER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateFd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFd"
		}"
		end

	xml_output_buffer_create_file (a_file: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFile"
		}"
		end

	-- `hidden' function __xmlOutputBufferCreateFilename skipped.
	xml_output_buffer_create_filename (an_uri: POINTER; an_encoder: POINTER; a_compression: INTEGER): POINTER is
 		-- xmlOutputBufferCreateFilename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateFilename"
		}"
		end

	xml_output_buffer_create_io (an_iowrite: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_encoder: POINTER): POINTER is
 		-- xmlOutputBufferCreateIO
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferCreateIO"
		}"
		end

	xml_output_buffer_flush (an_out_external: POINTER): INTEGER is
 		-- xmlOutputBufferFlush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferFlush"
		}"
		end

	xml_output_buffer_write (an_out_external: POINTER; a_len: INTEGER; a_buf: POINTER): INTEGER is
 		-- xmlOutputBufferWrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWrite"
		}"
		end

	xml_output_buffer_write_escape (an_out_external: POINTER; a_str: POINTER; an_escaping: POINTER): INTEGER is
 		-- xmlOutputBufferWriteEscape
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWriteEscape"
		}"
		end

	xml_output_buffer_write_string (an_out_external: POINTER; a_str: POINTER): INTEGER is
 		-- xmlOutputBufferWriteString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlOutputBufferWriteString"
		}"
		end

	xml_parser_get_directory (a_filename: POINTER): POINTER is
 		-- xmlParserGetDirectory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserGetDirectory"
		}"
		end

	xml_parser_input_buffer_create_fd (a_fd: INTEGER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFd"
		}"
		end

	xml_parser_input_buffer_create_file (a_file: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFile"
		}"
		end

	xml_parser_input_buffer_create_filename (an_uri: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateFilename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateFilename"
		}"
		end

	-- `hidden' function __xmlParserInputBufferCreateFilename skipped.
	xml_parser_input_buffer_create_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateIO
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateIO"
		}"
		end

	xml_parser_input_buffer_create_mem (a_mem: POINTER; a_size: INTEGER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateMem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateMem"
		}"
		end

	xml_parser_input_buffer_create_static (a_mem: POINTER; a_size: INTEGER; an_enc: INTEGER): POINTER is
 		-- xmlParserInputBufferCreateStatic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferCreateStatic"
		}"
		end

	xml_parser_input_buffer_grow (an_in: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlParserInputBufferGrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferGrow"
		}"
		end

	xml_parser_input_buffer_push (an_in: POINTER; a_len: INTEGER; a_buf: POINTER): INTEGER is
 		-- xmlParserInputBufferPush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferPush"
		}"
		end

	xml_parser_input_buffer_read (an_in: POINTER; a_len: INTEGER): INTEGER is
 		-- xmlParserInputBufferRead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserInputBufferRead"
		}"
		end

	xml_pop_input_callbacks: INTEGER is
 		-- xmlPopInputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPopInputCallbacks()"
		}"
		end

	xml_register_default_input_callbacks is
 		-- xmlRegisterDefaultInputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterDefaultInputCallbacks()"
		}"
		end

	xml_register_default_output_callbacks is
 		-- xmlRegisterDefaultOutputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterDefaultOutputCallbacks()"
		}"
		end

	xml_register_httppost_callbacks is
 		-- xmlRegisterHTTPPostCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterHTTPPostCallbacks()"
		}"
		end

	xml_register_input_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_read_func: POINTER; a_close_func: POINTER): INTEGER is
 		-- xmlRegisterInputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterInputCallbacks"
		}"
		end

	xml_register_output_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_write_func: POINTER; a_close_func: POINTER): INTEGER is
 		-- xmlRegisterOutputCallbacks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterOutputCallbacks"
		}"
		end


end -- class XMLIO_EXTERNALS
