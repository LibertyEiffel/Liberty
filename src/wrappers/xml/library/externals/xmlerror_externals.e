-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLERROR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_parser_validity_warning (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserValidityWarning (variadic call)  (node at line 569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserValidityWarning"
		}"
		end

	xml_parser_validity_error (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserValidityError (variadic call)  (node at line 593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserValidityError"
		}"
		end

	init_generic_error_default_func (a_handler: POINTER) is
 		-- initGenericErrorDefaultFunc (node at line 1464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initGenericErrorDefaultFunc"
		}"
		end

	xml_reset_error (an_err: POINTER) is
 		-- xmlResetError (node at line 2274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlResetError"
		}"
		end

	xml_parser_print_file_info (an_input: POINTER) is
 		-- xmlParserPrintFileInfo (node at line 2566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserPrintFileInfo"
		}"
		end

	xml_copy_error (a_from_external: POINTER; a_to: POINTER): INTEGER_32 is
 		-- xmlCopyError (node at line 2654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyError"
		}"
		end

	xml_parser_warning (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserWarning (variadic call)  (node at line 2753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserWarning"
		}"
		end

	xml_set_generic_error_func (a_ctx: POINTER; a_handler: POINTER) is
 		-- xmlSetGenericErrorFunc (node at line 3919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetGenericErrorFunc"
		}"
		end

	xml_get_last_error: POINTER is
 		-- xmlGetLastError (node at line 4368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLastError()"
		}"
		end

	xml_parser_error (a_ctx: POINTER; a_msg: POINTER) is
 		-- xmlParserError (variadic call)  (node at line 4867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserError"
		}"
		end

	xml_ctxt_get_last_error (a_ctx: POINTER): POINTER is
 		-- xmlCtxtGetLastError (node at line 4980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtGetLastError"
		}"
		end

	xml_parser_print_file_context (an_input: POINTER) is
 		-- xmlParserPrintFileContext (node at line 4996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlParserPrintFileContext"
		}"
		end

	xml_set_structured_error_func (a_ctx: POINTER; a_handler: POINTER) is
 		-- xmlSetStructuredErrorFunc (node at line 5415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetStructuredErrorFunc"
		}"
		end

	xml_reset_last_error is
 		-- xmlResetLastError (node at line 5691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlResetLastError()"
		}"
		end

	xml_ctxt_reset_last_error (a_ctx: POINTER) is
 		-- xmlCtxtResetLastError (node at line 5773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCtxtResetLastError"
		}"
		end


end -- class XMLERROR_EXTERNALS
