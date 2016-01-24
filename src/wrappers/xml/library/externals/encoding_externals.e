-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class ENCODING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	isolat1to_utf8 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER 
               -- isolat1ToUTF8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isolat1ToUTF8"
               }"
               end

	utf8toisolat1 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER 
               -- UTF8Toisolat1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UTF8Toisolat1"
               }"
               end

	xml_add_encoding_alias (a_name: POINTER; an_alias_external: POINTER): INTEGER 
               -- xmlAddEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddEncodingAlias"
               }"
               end

	xml_char_enc_close_func (a_handler: POINTER): INTEGER 
               -- xmlCharEncCloseFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncCloseFunc"
               }"
               end

	xml_char_enc_first_line (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 
               -- xmlCharEncFirstLine
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncFirstLine"
               }"
               end

	xml_char_enc_in_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 
               -- xmlCharEncInFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncInFunc"
               }"
               end

	xml_char_enc_out_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 
               -- xmlCharEncOutFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncOutFunc"
               }"
               end

	xml_cleanup_char_encoding_handlers 
               -- xmlCleanupCharEncodingHandlers
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupCharEncodingHandlers"
               }"
               end

	xml_cleanup_encoding_aliases 
               -- xmlCleanupEncodingAliases
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupEncodingAliases"
               }"
               end

	xml_del_encoding_alias (an_alias_external: POINTER): INTEGER 
               -- xmlDelEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDelEncodingAlias"
               }"
               end

	xml_detect_char_encoding (an_in: POINTER; a_len: INTEGER): INTEGER 
               -- xmlDetectCharEncoding
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDetectCharEncoding"
               }"
               end

	xml_find_char_encoding_handler (a_name: POINTER): POINTER 
               -- xmlFindCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFindCharEncodingHandler"
               }"
               end

	xml_get_char_encoding_handler (an_enc: INTEGER): POINTER 
               -- xmlGetCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCharEncodingHandler"
               }"
               end

	xml_get_char_encoding_name (an_enc: INTEGER): POINTER 
               -- xmlGetCharEncodingName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCharEncodingName"
               }"
               end

	xml_get_encoding_alias (an_alias_external: POINTER): POINTER 
               -- xmlGetEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetEncodingAlias"
               }"
               end

	xml_init_char_encoding_handlers 
               -- xmlInitCharEncodingHandlers
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitCharEncodingHandlers"
               }"
               end

	xml_new_char_encoding_handler (a_name: POINTER; an_input: POINTER; an_output: POINTER): POINTER 
               -- xmlNewCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCharEncodingHandler"
               }"
               end

	xml_parse_char_encoding (a_name: POINTER): INTEGER 
               -- xmlParseCharEncoding
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseCharEncoding"
               }"
               end

	xml_register_char_encoding_handler (a_handler: POINTER) 
               -- xmlRegisterCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegisterCharEncodingHandler"
               }"
               end


end -- class ENCODING_EXTERNALS
