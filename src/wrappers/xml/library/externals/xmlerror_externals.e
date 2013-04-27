-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLERROR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	init_generic_error_default_func (a_handler: POINTER) is
 		-- initGenericErrorDefaultFunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initGenericErrorDefaultFunc"
		}"
		end

	xml_copy_error (a_from_external: POINTER; a_to: POINTER): INTEGER is
 		-- xmlCopyError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyError"
		}"
		end

	xml_ctxt_get_last_error (a_ctx: POINTER): POINTER is
 		-- xmlCtxtGetLastError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtGetLastError"
		}"
		end

	xml_ctxt_reset_last_error (a_ctx: POINTER) is
 		-- xmlCtxtResetLastError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtResetLastError"
		}"
		end

	xml_get_last_error: POINTER is
 		-- xmlGetLastError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLastError()"
		}"
		end

	xml_parser_error (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserError (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserError"
		}"
		end

	xml_parser_print_file_context (an_input: POINTER) is
 		-- xmlParserPrintFileContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserPrintFileContext"
		}"
		end

	xml_parser_print_file_info (an_input: POINTER) is
 		-- xmlParserPrintFileInfo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserPrintFileInfo"
		}"
		end

	xml_parser_validity_error (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserValidityError (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserValidityError"
		}"
		end

	xml_parser_validity_warning (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserValidityWarning (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserValidityWarning"
		}"
		end

	xml_parser_warning (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserWarning (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserWarning"
		}"
		end

	xml_reset_error (an_err: POINTER) is
 		-- xmlResetError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlResetError"
		}"
		end

	xml_reset_last_error is
 		-- xmlResetLastError
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlResetLastError()"
		}"
		end

	xml_set_generic_error_func (a_ctx: POINTER; a_handler: POINTER) is
 		-- xmlSetGenericErrorFunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetGenericErrorFunc"
		}"
		end

	xml_set_structured_error_func (a_ctx: POINTER; a_handler: POINTER) is
 		-- xmlSetStructuredErrorFunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetStructuredErrorFunc"
		}"
		end


end -- class XMLERROR_EXTERNALS
