-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ENCODING_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_get_encoding_alias (an_alias_external: POINTER): POINTER is
 		-- xmlGetEncodingAlias (node at line 155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetEncodingAlias"
		}"
		end

	xml_add_encoding_alias (a_name: POINTER; an_alias_external: POINTER): INTEGER_32 is
 		-- xmlAddEncodingAlias (node at line 274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddEncodingAlias"
		}"
		end

	xml_char_enc_close_func (a_handler: POINTER): INTEGER_32 is
 		-- xmlCharEncCloseFunc (node at line 509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharEncCloseFunc"
		}"
		end

	xml_detect_char_encoding (an_in: POINTER; a_len: INTEGER_32): INTEGER is
 		-- xmlDetectCharEncoding (node at line 610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDetectCharEncoding"
		}"
		end

	xml_new_char_encoding_handler (a_name: POINTER; an_input: POINTER; an_output: POINTER): POINTER is
 		-- xmlNewCharEncodingHandler (node at line 2984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewCharEncodingHandler"
		}"
		end

	xml_char_enc_in_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER_32 is
 		-- xmlCharEncInFunc (node at line 3009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharEncInFunc"
		}"
		end

	xml_init_char_encoding_handlers is
 		-- xmlInitCharEncodingHandlers (node at line 3054)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitCharEncodingHandlers()"
		}"
		end

	xml_char_enc_out_func (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER_32 is
 		-- xmlCharEncOutFunc (node at line 3135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharEncOutFunc"
		}"
		end

	xml_cleanup_encoding_aliases is
 		-- xmlCleanupEncodingAliases (node at line 3549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupEncodingAliases()"
		}"
		end

	xml_cleanup_char_encoding_handlers is
 		-- xmlCleanupCharEncodingHandlers (node at line 3561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupCharEncodingHandlers()"
		}"
		end

	xml_find_char_encoding_handler (a_name: POINTER): POINTER is
 		-- xmlFindCharEncodingHandler (node at line 4018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFindCharEncodingHandler"
		}"
		end

	xml_parse_char_encoding (a_name: POINTER): INTEGER is
 		-- xmlParseCharEncoding (node at line 4341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParseCharEncoding"
		}"
		end

	xml_register_char_encoding_handler (a_handler: POINTER) is
 		-- xmlRegisterCharEncodingHandler (node at line 4523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegisterCharEncodingHandler"
		}"
		end

	isolat1to_utf8 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER_32 is
 		-- isolat1ToUTF8 (node at line 4541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isolat1ToUTF8"
		}"
		end

	xml_del_encoding_alias (an_alias_external: POINTER): INTEGER_32 is
 		-- xmlDelEncodingAlias (node at line 4970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDelEncodingAlias"
		}"
		end

	xml_get_char_encoding_handler (an_enc: INTEGER): POINTER is
 		-- xmlGetCharEncodingHandler (node at line 5344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetCharEncodingHandler"
		}"
		end

	xml_char_enc_first_line (a_handler: POINTER; an_out_external: POINTER; an_in: POINTER): INTEGER_32 is
 		-- xmlCharEncFirstLine (node at line 5410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharEncFirstLine"
		}"
		end

	utf8toisolat1 (an_out_external: POINTER; an_outlen: POINTER; an_in: POINTER; an_inlen: POINTER): INTEGER_32 is
 		-- UTF8Toisolat1 (node at line 5428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "UTF8Toisolat1"
		}"
		end

	xml_get_char_encoding_name (an_enc: INTEGER): POINTER is
 		-- xmlGetCharEncodingName (node at line 5913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetCharEncodingName"
		}"
		end


end -- class ENCODING_EXTERNALS
