-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ENCODING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	isolat1to_utf8 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER 

		-- function isolat1ToUTF8 (in `/usr/include/libxml2/libxml/encoding.h')
               -- isolat1ToUTF8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isolat1ToUTF8"
               }"
               end

	utf8toisolat1 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER 

		-- function UTF8Toisolat1 (in `/usr/include/libxml2/libxml/encoding.h')
               -- UTF8Toisolat1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UTF8Toisolat1"
               }"
               end

	xml_add_encoding_alias (a_name: POINTER; an_alias_external: POINTER): INTEGER 

		-- function xmlAddEncodingAlias (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlAddEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddEncodingAlias"
               }"
               end

	xml_char_enc_close_func (a_handler: POINTER): INTEGER 

		-- function xmlCharEncCloseFunc (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCharEncCloseFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncCloseFunc"
               }"
               end

	xml_char_enc_first_line (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 

		-- function xmlCharEncFirstLine (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCharEncFirstLine
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncFirstLine"
               }"
               end

	xml_char_enc_in_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 

		-- function xmlCharEncInFunc (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCharEncInFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncInFunc"
               }"
               end

	xml_char_enc_out_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER 

		-- function xmlCharEncOutFunc (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCharEncOutFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharEncOutFunc"
               }"
               end

	xml_cleanup_char_encoding_handlers 

		-- function xmlCleanupCharEncodingHandlers (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCleanupCharEncodingHandlers
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupCharEncodingHandlers()"
               }"
               end

	xml_cleanup_encoding_aliases 

		-- function xmlCleanupEncodingAliases (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlCleanupEncodingAliases
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupEncodingAliases()"
               }"
               end

	xml_del_encoding_alias (an_alias_external: POINTER): INTEGER 

		-- function xmlDelEncodingAlias (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlDelEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDelEncodingAlias"
               }"
               end

	xml_detect_char_encoding (an_in: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlDetectCharEncoding (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlDetectCharEncoding
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDetectCharEncoding"
               }"
               end

	xml_find_char_encoding_handler (a_name: POINTER): POINTER 

		-- function xmlFindCharEncodingHandler (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlFindCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFindCharEncodingHandler"
               }"
               end

	xml_get_char_encoding_handler (an_enc: INTEGER): POINTER 

		-- function xmlGetCharEncodingHandler (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlGetCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCharEncodingHandler"
               }"
               end

	xml_get_char_encoding_name (an_enc: INTEGER): POINTER 

		-- function xmlGetCharEncodingName (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlGetCharEncodingName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCharEncodingName"
               }"
               end

	xml_get_encoding_alias (an_alias_external: POINTER): POINTER 

		-- function xmlGetEncodingAlias (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlGetEncodingAlias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetEncodingAlias"
               }"
               end

	xml_init_char_encoding_handlers 

		-- function xmlInitCharEncodingHandlers (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlInitCharEncodingHandlers
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitCharEncodingHandlers()"
               }"
               end

	xml_new_char_encoding_handler (a_name: POINTER; an_input: POINTER; an_output: POINTER): POINTER 

		-- function xmlNewCharEncodingHandler (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlNewCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCharEncodingHandler"
               }"
               end

	xml_parse_char_encoding (a_name: POINTER): INTEGER 

		-- function xmlParseCharEncoding (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlParseCharEncoding
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParseCharEncoding"
               }"
               end

	xml_register_char_encoding_handler (a_handler: POINTER) 

		-- function xmlRegisterCharEncodingHandler (in `/usr/include/libxml2/libxml/encoding.h')
               -- xmlRegisterCharEncodingHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegisterCharEncodingHandler"
               }"
               end


end -- class ENCODING_EXTERNALS
