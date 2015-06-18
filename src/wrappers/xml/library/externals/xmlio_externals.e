-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_alloc_output_buffer (an_encoder: POINTER): POINTER 
               -- xmlAllocOutputBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_alloc_parser_input_buffer (an_enc: INTEGER): POINTER 
               -- xmlAllocParserInputBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_check_filename (a_path: POINTER): INTEGER 
               -- xmlCheckFilename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_check_httpinput (a_ctxt: POINTER; a_ret: POINTER): POINTER 
               -- xmlCheckHTTPInput
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_cleanup_input_callbacks () 
               -- xmlCleanupInputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_cleanup_output_callbacks () 
               -- xmlCleanupOutputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_file_close (a_context: POINTER): INTEGER 
               -- xmlFileClose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_file_match (a_filename: POINTER): INTEGER 
               -- xmlFileMatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_file_open (a_filename: POINTER): POINTER 
               -- xmlFileOpen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_file_read (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER 
               -- xmlFileRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_free_parser_input_buffer (an_in: POINTER) 
               -- xmlFreeParserInputBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_ioftpclose (a_context: POINTER): INTEGER 
               -- xmlIOFTPClose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_ioftpmatch (a_filename: POINTER): INTEGER 
               -- xmlIOFTPMatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_ioftpopen (a_filename: POINTER): POINTER 
               -- xmlIOFTPOpen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_ioftpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER 
               -- xmlIOFTPRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_iohttpclose (a_context: POINTER): INTEGER 
               -- xmlIOHTTPClose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_iohttpmatch (a_filename: POINTER): INTEGER 
               -- xmlIOHTTPMatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_iohttpopen (a_filename: POINTER): POINTER 
               -- xmlIOHTTPOpen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_iohttpopen_w (a_post_uri: POINTER; a_compression: INTEGER): POINTER 
               -- xmlIOHTTPOpenW
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_iohttpread (a_context: POINTER; a_buffer: POINTER; a_len: INTEGER): INTEGER 
               -- xmlIOHTTPRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_no_net_external_entity_loader (an_url: POINTER; an_id: POINTER; a_ctxt: POINTER): POINTER 
               -- xmlNoNetExternalEntityLoader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_normalize_windows_path (a_path: POINTER): POINTER 
               -- xmlNormalizeWindowsPath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_close (an_out_external: POINTER): INTEGER 
               -- xmlOutputBufferClose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_create_buffer (a_buffer: POINTER; an_encoder: POINTER): POINTER 
               -- xmlOutputBufferCreateBuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_create_fd (a_fd: INTEGER; an_encoder: POINTER): POINTER 
               -- xmlOutputBufferCreateFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_create_file (a_file: POINTER; an_encoder: POINTER): POINTER 
               -- xmlOutputBufferCreateFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function __xmlOutputBufferCreateFilename skipped.
	xml_output_buffer_create_filename (an_uri: POINTER; an_encoder: POINTER; a_compression: INTEGER): POINTER 
               -- xmlOutputBufferCreateFilename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_create_io (an_iowrite: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_encoder: POINTER): POINTER 
               -- xmlOutputBufferCreateIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_flush (an_out_external: POINTER): INTEGER 
               -- xmlOutputBufferFlush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_get_content (an_out_external: POINTER): POINTER 
               -- xmlOutputBufferGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_get_size (an_out_external: POINTER): like size_t 
               -- xmlOutputBufferGetSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_write (an_out_external: POINTER; a_len: INTEGER; a_buf: POINTER): INTEGER 
               -- xmlOutputBufferWrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_write_escape (an_out_external: POINTER; a_str: POINTER; an_escaping: POINTER): INTEGER 
               -- xmlOutputBufferWriteEscape
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_output_buffer_write_string (an_out_external: POINTER; a_str: POINTER): INTEGER 
               -- xmlOutputBufferWriteString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_get_directory (a_filename: POINTER): POINTER 
               -- xmlParserGetDirectory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_create_fd (a_fd: INTEGER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateFd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_create_file (a_file: POINTER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function __xmlParserInputBufferCreateFilename skipped.
	xml_parser_input_buffer_create_filename (an_uri: POINTER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateFilename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_create_io (an_ioread: POINTER; an_ioclose: POINTER; an_ioctx: POINTER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateIO
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_create_mem (a_mem: POINTER; a_size: INTEGER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateMem
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_create_static (a_mem: POINTER; a_size: INTEGER; an_enc: INTEGER): POINTER 
               -- xmlParserInputBufferCreateStatic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_grow (an_in: POINTER; a_len: INTEGER): INTEGER 
               -- xmlParserInputBufferGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_push (an_in: POINTER; a_len: INTEGER; a_buf: POINTER): INTEGER 
               -- xmlParserInputBufferPush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_parser_input_buffer_read (an_in: POINTER; a_len: INTEGER): INTEGER 
               -- xmlParserInputBufferRead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_pop_input_callbacks (): INTEGER 
               -- xmlPopInputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_register_default_input_callbacks () 
               -- xmlRegisterDefaultInputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_register_default_output_callbacks () 
               -- xmlRegisterDefaultOutputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_register_httppost_callbacks () 
               -- xmlRegisterHTTPPostCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_register_input_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_read_func: POINTER; a_close_func: POINTER): INTEGER 
               -- xmlRegisterInputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_register_output_callbacks (a_match_func: POINTER; an_open_func: POINTER; a_write_func: POINTER; a_close_func: POINTER): INTEGER 
               -- xmlRegisterOutputCallbacks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class XMLIO_EXTERNALS
