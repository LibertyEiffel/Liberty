-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLERROR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	init_generic_error_default_func (a_handler: POINTER) 

		-- function initGenericErrorDefaultFunc (in 866 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- initGenericErrorDefaultFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initGenericErrorDefaultFunc"
               }"
               end

	xml_copy_error (a_from_external: POINTER; a_to: POINTER): INTEGER 

		-- function xmlCopyError (in 910 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlCopyError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyError"
               }"
               end

	xml_ctxt_get_last_error (a_ctx: POINTER): POINTER 

		-- function xmlCtxtGetLastError (in 904 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlCtxtGetLastError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtGetLastError"
               }"
               end

	xml_ctxt_reset_last_error (a_ctx: POINTER) 

		-- function xmlCtxtResetLastError (in 906 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlCtxtResetLastError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCtxtResetLastError"
               }"
               end

	xml_get_last_error: POINTER 

		-- function xmlGetLastError (in 900 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlGetLastError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLastError"
               }"
               end

	xml_parser_error (a_ctx: POINTER; a_msg: POINTER) 

		-- function xmlParserError (in 876 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserError (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserError"
               }"
               end

	xml_parser_print_file_context (an_input: POINTER) 

		-- function xmlParserPrintFileContext (in 894 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserPrintFileContext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserPrintFileContext"
               }"
               end

	xml_parser_print_file_info (an_input: POINTER) 

		-- function xmlParserPrintFileInfo (in 892 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserPrintFileInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserPrintFileInfo"
               }"
               end

	xml_parser_validity_error (a_ctx: POINTER; a_msg: POINTER) 

		-- function xmlParserValidityError (in 884 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserValidityError (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserValidityError"
               }"
               end

	xml_parser_validity_warning (a_ctx: POINTER; a_msg: POINTER) 

		-- function xmlParserValidityWarning (in 888 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserValidityWarning (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserValidityWarning"
               }"
               end

	xml_parser_warning (a_ctx: POINTER; a_msg: POINTER) 

		-- function xmlParserWarning (in 880 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlParserWarning (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserWarning"
               }"
               end

	xml_reset_error (an_err: POINTER) 

		-- function xmlResetError (in 908 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlResetError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlResetError"
               }"
               end

	xml_reset_last_error 

		-- function xmlResetLastError (in 902 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlResetLastError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlResetLastError"
               }"
               end

	xml_set_generic_error_func (a_ctx: POINTER; a_handler: POINTER) 

		-- function xmlSetGenericErrorFunc (in 863 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlSetGenericErrorFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetGenericErrorFunc"
               }"
               end

	xml_set_structured_error_func (a_ctx: POINTER; a_handler: POINTER) 

		-- function xmlSetStructuredErrorFunc (in 869 at line /usr/include/libxml2/libxml/xmlerror.h)
               -- xmlSetStructuredErrorFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetStructuredErrorFunc"
               }"
               end


end -- class XMLERROR_EXTERNALS
