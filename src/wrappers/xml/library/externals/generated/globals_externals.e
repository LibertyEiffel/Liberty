-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GLOBALS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __docbDefaultSAXHandler skipped.
       -- Variable docbDefaultSAXHandler in file "/usr/include/libxml2/libxml/globals.h" does not have a wrapper type
       address_of_docb_default_saxhandler: POINTER
               -- Address of docb_default_saxhandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&docbDefaultSAXHandler"
               }"
               end

       -- Variable htmlDefaultSAXHandler in file "/usr/include/libxml2/libxml/globals.h" does not have a wrapper type
       address_of_html_default_saxhandler: POINTER
               -- Address of html_default_saxhandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&htmlDefaultSAXHandler"
               }"
               end

	-- `hidden' function __htmlDefaultSAXHandler skipped.
	-- `hidden' function __oldXMLWDcompatibility skipped.
	old_xmlwdcompatibility: INTEGER
               -- old_xmlwdcompatibility
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "oldXMLWDcompatibility"
               }"
               end

       address_of_old_xmlwdcompatibility: POINTER
               -- Address of old_xmlwdcompatibility
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&oldXMLWDcompatibility"
               }"
               end

       set_old_xmlwdcompatibility (a_value: INTEGER)
               -- Set variable old_xmlwdcompatibility value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_oldXMLWDcompatibility"
               }"
               end

	-- `hidden' function __xmlBufferAllocScheme skipped.
	xml_buffer_alloc_scheme: INTEGER
               -- xml_buffer_alloc_scheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAllocScheme"
               }"
               end

       address_of_xml_buffer_alloc_scheme: POINTER
               -- Address of xml_buffer_alloc_scheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlBufferAllocScheme"
               }"
               end

       set_xml_buffer_alloc_scheme (a_value: INTEGER)
               -- Set variable xml_buffer_alloc_scheme value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlBufferAllocScheme"
               }"
               end

	xml_cleanup_globals 

		-- function xmlCleanupGlobals (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlCleanupGlobals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupGlobals"
               }"
               end

	-- `hidden' function __xmlDefaultBufferSize skipped.
	xml_default_buffer_size: INTEGER
               -- xml_default_buffer_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDefaultBufferSize"
               }"
               end

       address_of_xml_default_buffer_size: POINTER
               -- Address of xml_default_buffer_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlDefaultBufferSize"
               }"
               end

       set_xml_default_buffer_size (a_value: INTEGER)
               -- Set variable xml_default_buffer_size value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlDefaultBufferSize"
               }"
               end

       -- Variable xmlDefaultSAXHandler in file "/usr/include/libxml2/libxml/globals.h" does not have a wrapper type
       address_of_xml_default_saxhandler: POINTER
               -- Address of xml_default_saxhandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlDefaultSAXHandler"
               }"
               end

	-- `hidden' function __xmlDefaultSAXHandler skipped.
	-- `hidden' function __xmlDefaultSAXLocator skipped.
       -- Variable xmlDefaultSAXLocator in file "/usr/include/libxml2/libxml/globals.h" does not have a wrapper type
       address_of_xml_default_saxlocator: POINTER
               -- Address of xml_default_saxlocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlDefaultSAXLocator"
               }"
               end

	xml_deregister_node_default (a_func: POINTER): POINTER 

		-- function xmlDeregisterNodeDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlDeregisterNodeDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDeregisterNodeDefault"
               }"
               end

	xml_deregister_node_default_value: POINTER
               -- xml_deregister_node_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDeregisterNodeDefaultValue"
               }"
               end

       address_of_xml_deregister_node_default_value: POINTER
               -- Address of xml_deregister_node_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlDeregisterNodeDefaultValue"
               }"
               end

       set_xml_deregister_node_default_value (a_value: POINTER)
               -- Set variable xml_deregister_node_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlDeregisterNodeDefaultValue"
               }"
               end

	-- `hidden' function __xmlDeregisterNodeDefaultValue skipped.
	xml_do_validity_checking_default_value: INTEGER
               -- xml_do_validity_checking_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDoValidityCheckingDefaultValue"
               }"
               end

       address_of_xml_do_validity_checking_default_value: POINTER
               -- Address of xml_do_validity_checking_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlDoValidityCheckingDefaultValue"
               }"
               end

       set_xml_do_validity_checking_default_value (a_value: INTEGER)
               -- Set variable xml_do_validity_checking_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlDoValidityCheckingDefaultValue"
               }"
               end

	-- `hidden' function __xmlDoValidityCheckingDefaultValue skipped.
	xml_free: POINTER
               -- xml_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFree"
               }"
               end

       address_of_xml_free: POINTER
               -- Address of xml_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlFree"
               }"
               end

       set_xml_free (a_value: POINTER)
               -- Set variable xml_free value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlFree"
               }"
               end

	xml_generic_error: POINTER
               -- xml_generic_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGenericError"
               }"
               end

       address_of_xml_generic_error: POINTER
               -- Address of xml_generic_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlGenericError"
               }"
               end

       set_xml_generic_error (a_value: POINTER)
               -- Set variable xml_generic_error value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlGenericError"
               }"
               end

	-- `hidden' function __xmlGenericError skipped.
	-- `hidden' function __xmlGenericErrorContext skipped.
	xml_generic_error_context: POINTER
               -- xml_generic_error_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGenericErrorContext"
               }"
               end

       address_of_xml_generic_error_context: POINTER
               -- Address of xml_generic_error_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlGenericErrorContext"
               }"
               end

       set_xml_generic_error_context (a_value: POINTER)
               -- Set variable xml_generic_error_context value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlGenericErrorContext"
               }"
               end

	xml_get_warnings_default_value: INTEGER
               -- xml_get_warnings_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetWarningsDefaultValue"
               }"
               end

       address_of_xml_get_warnings_default_value: POINTER
               -- Address of xml_get_warnings_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlGetWarningsDefaultValue"
               }"
               end

       set_xml_get_warnings_default_value (a_value: INTEGER)
               -- Set variable xml_get_warnings_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlGetWarningsDefaultValue"
               }"
               end

	-- `hidden' function __xmlGetWarningsDefaultValue skipped.
	xml_indent_tree_output: INTEGER
               -- xml_indent_tree_output
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIndentTreeOutput"
               }"
               end

       address_of_xml_indent_tree_output: POINTER
               -- Address of xml_indent_tree_output
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlIndentTreeOutput"
               }"
               end

       set_xml_indent_tree_output (a_value: INTEGER)
               -- Set variable xml_indent_tree_output value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlIndentTreeOutput"
               }"
               end

	-- `hidden' function __xmlIndentTreeOutput skipped.
	xml_init_globals 

		-- function xmlInitGlobals (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlInitGlobals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitGlobals"
               }"
               end

	xml_initialize_global_state (a_gs: POINTER) 

		-- function xmlInitializeGlobalState (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlInitializeGlobalState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitializeGlobalState"
               }"
               end

	-- `hidden' function __xmlKeepBlanksDefaultValue skipped.
	xml_keep_blanks_default_value: INTEGER
               -- xml_keep_blanks_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlKeepBlanksDefaultValue"
               }"
               end

       address_of_xml_keep_blanks_default_value: POINTER
               -- Address of xml_keep_blanks_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlKeepBlanksDefaultValue"
               }"
               end

       set_xml_keep_blanks_default_value (a_value: INTEGER)
               -- Set variable xml_keep_blanks_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlKeepBlanksDefaultValue"
               }"
               end

       -- Variable xmlLastError in file "/usr/include/libxml2/libxml/globals.h" does not have a wrapper type
       address_of_xml_last_error: POINTER
               -- Address of xml_last_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlLastError"
               }"
               end

	-- `hidden' function __xmlLastError skipped.
	xml_line_numbers_default_value: INTEGER
               -- xml_line_numbers_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLineNumbersDefaultValue"
               }"
               end

       address_of_xml_line_numbers_default_value: POINTER
               -- Address of xml_line_numbers_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlLineNumbersDefaultValue"
               }"
               end

       set_xml_line_numbers_default_value (a_value: INTEGER)
               -- Set variable xml_line_numbers_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlLineNumbersDefaultValue"
               }"
               end

	-- `hidden' function __xmlLineNumbersDefaultValue skipped.
	xml_load_ext_dtd_default_value: INTEGER
               -- xml_load_ext_dtd_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLoadExtDtdDefaultValue"
               }"
               end

       address_of_xml_load_ext_dtd_default_value: POINTER
               -- Address of xml_load_ext_dtd_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlLoadExtDtdDefaultValue"
               }"
               end

       set_xml_load_ext_dtd_default_value (a_value: INTEGER)
               -- Set variable xml_load_ext_dtd_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlLoadExtDtdDefaultValue"
               }"
               end

	-- `hidden' function __xmlLoadExtDtdDefaultValue skipped.
	xml_malloc: POINTER
               -- xml_malloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMalloc"
               }"
               end

       address_of_xml_malloc: POINTER
               -- Address of xml_malloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlMalloc"
               }"
               end

       set_xml_malloc (a_value: POINTER)
               -- Set variable xml_malloc value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlMalloc"
               }"
               end

	xml_malloc_atomic: POINTER
               -- xml_malloc_atomic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMallocAtomic"
               }"
               end

       address_of_xml_malloc_atomic: POINTER
               -- Address of xml_malloc_atomic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlMallocAtomic"
               }"
               end

       set_xml_malloc_atomic (a_value: POINTER)
               -- Set variable xml_malloc_atomic value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlMallocAtomic"
               }"
               end

	xml_mem_strdup: POINTER
               -- xml_mem_strdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMemStrdup"
               }"
               end

       address_of_xml_mem_strdup: POINTER
               -- Address of xml_mem_strdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlMemStrdup"
               }"
               end

       set_xml_mem_strdup (a_value: POINTER)
               -- Set variable xml_mem_strdup value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlMemStrdup"
               }"
               end

	xml_output_buffer_create_filename_default (a_func: POINTER): POINTER 

		-- function xmlOutputBufferCreateFilenameDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlOutputBufferCreateFilenameDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlOutputBufferCreateFilenameDefault"
               }"
               end

	xml_output_buffer_create_filename_value: POINTER
               -- xml_output_buffer_create_filename_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlOutputBufferCreateFilenameValue"
               }"
               end

       address_of_xml_output_buffer_create_filename_value: POINTER
               -- Address of xml_output_buffer_create_filename_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlOutputBufferCreateFilenameValue"
               }"
               end

       set_xml_output_buffer_create_filename_value (a_value: POINTER)
               -- Set variable xml_output_buffer_create_filename_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlOutputBufferCreateFilenameValue"
               }"
               end

	-- `hidden' function __xmlOutputBufferCreateFilenameValue skipped.
	-- `hidden' function __xmlParserDebugEntities skipped.
	xml_parser_debug_entities: INTEGER
               -- xml_parser_debug_entities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserDebugEntities"
               }"
               end

       address_of_xml_parser_debug_entities: POINTER
               -- Address of xml_parser_debug_entities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlParserDebugEntities"
               }"
               end

       set_xml_parser_debug_entities (a_value: INTEGER)
               -- Set variable xml_parser_debug_entities value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlParserDebugEntities"
               }"
               end

	xml_parser_input_buffer_create_filename_default (a_func: POINTER): POINTER 

		-- function xmlParserInputBufferCreateFilenameDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlParserInputBufferCreateFilenameDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputBufferCreateFilenameDefault"
               }"
               end

	-- `hidden' function __xmlParserInputBufferCreateFilenameValue skipped.
	xml_parser_input_buffer_create_filename_value: POINTER
               -- xml_parser_input_buffer_create_filename_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserInputBufferCreateFilenameValue"
               }"
               end

       address_of_xml_parser_input_buffer_create_filename_value: POINTER
               -- Address of xml_parser_input_buffer_create_filename_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlParserInputBufferCreateFilenameValue"
               }"
               end

       set_xml_parser_input_buffer_create_filename_value (a_value: POINTER)
               -- Set variable xml_parser_input_buffer_create_filename_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlParserInputBufferCreateFilenameValue"
               }"
               end

	-- `hidden' function __xmlParserVersion skipped.
	xml_parser_version: POINTER
               -- xml_parser_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlParserVersion"
               }"
               end

       address_of_xml_parser_version: POINTER
               -- Address of xml_parser_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlParserVersion"
               }"
               end

       set_xml_parser_version (a_value: POINTER)
               -- Set variable xml_parser_version value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlParserVersion"
               }"
               end

	-- `hidden' function __xmlPedanticParserDefaultValue skipped.
	xml_pedantic_parser_default_value: INTEGER
               -- xml_pedantic_parser_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPedanticParserDefaultValue"
               }"
               end

       address_of_xml_pedantic_parser_default_value: POINTER
               -- Address of xml_pedantic_parser_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlPedanticParserDefaultValue"
               }"
               end

       set_xml_pedantic_parser_default_value (a_value: INTEGER)
               -- Set variable xml_pedantic_parser_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlPedanticParserDefaultValue"
               }"
               end

	xml_realloc: POINTER
               -- xml_realloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRealloc"
               }"
               end

       address_of_xml_realloc: POINTER
               -- Address of xml_realloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlRealloc"
               }"
               end

       set_xml_realloc (a_value: POINTER)
               -- Set variable xml_realloc value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlRealloc"
               }"
               end

	xml_register_node_default (a_func: POINTER): POINTER 

		-- function xmlRegisterNodeDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlRegisterNodeDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegisterNodeDefault"
               }"
               end

	-- `hidden' function __xmlRegisterNodeDefaultValue skipped.
	xml_register_node_default_value: POINTER
               -- xml_register_node_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegisterNodeDefaultValue"
               }"
               end

       address_of_xml_register_node_default_value: POINTER
               -- Address of xml_register_node_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlRegisterNodeDefaultValue"
               }"
               end

       set_xml_register_node_default_value (a_value: POINTER)
               -- Set variable xml_register_node_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlRegisterNodeDefaultValue"
               }"
               end

	-- `hidden' function __xmlSaveNoEmptyTags skipped.
	xml_save_no_empty_tags: INTEGER
               -- xml_save_no_empty_tags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveNoEmptyTags"
               }"
               end

       address_of_xml_save_no_empty_tags: POINTER
               -- Address of xml_save_no_empty_tags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlSaveNoEmptyTags"
               }"
               end

       set_xml_save_no_empty_tags (a_value: INTEGER)
               -- Set variable xml_save_no_empty_tags value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlSaveNoEmptyTags"
               }"
               end

	xml_structured_error: POINTER
               -- xml_structured_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStructuredError"
               }"
               end

       address_of_xml_structured_error: POINTER
               -- Address of xml_structured_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlStructuredError"
               }"
               end

       set_xml_structured_error (a_value: POINTER)
               -- Set variable xml_structured_error value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlStructuredError"
               }"
               end

	-- `hidden' function __xmlStructuredError skipped.
	xml_structured_error_context: POINTER
               -- xml_structured_error_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStructuredErrorContext"
               }"
               end

       address_of_xml_structured_error_context: POINTER
               -- Address of xml_structured_error_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlStructuredErrorContext"
               }"
               end

       set_xml_structured_error_context (a_value: POINTER)
               -- Set variable xml_structured_error_context value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlStructuredErrorContext"
               }"
               end

	-- `hidden' function __xmlStructuredErrorContext skipped.
	xml_substitute_entities_default_value: INTEGER
               -- xml_substitute_entities_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSubstituteEntitiesDefaultValue"
               }"
               end

       address_of_xml_substitute_entities_default_value: POINTER
               -- Address of xml_substitute_entities_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlSubstituteEntitiesDefaultValue"
               }"
               end

       set_xml_substitute_entities_default_value (a_value: INTEGER)
               -- Set variable xml_substitute_entities_default_value value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlSubstituteEntitiesDefaultValue"
               }"
               end

	-- `hidden' function __xmlSubstituteEntitiesDefaultValue skipped.
	xml_thr_def_buffer_alloc_scheme (a_v: INTEGER): INTEGER 

		-- function xmlThrDefBufferAllocScheme (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefBufferAllocScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefBufferAllocScheme"
               }"
               end

	xml_thr_def_default_buffer_size (a_v: INTEGER): INTEGER 

		-- function xmlThrDefDefaultBufferSize (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefDefaultBufferSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefDefaultBufferSize"
               }"
               end

	xml_thr_def_deregister_node_default (a_func: POINTER): POINTER 

		-- function xmlThrDefDeregisterNodeDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefDeregisterNodeDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefDeregisterNodeDefault"
               }"
               end

	xml_thr_def_do_validity_checking_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefDoValidityCheckingDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefDoValidityCheckingDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefDoValidityCheckingDefaultValue"
               }"
               end

	xml_thr_def_get_warnings_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefGetWarningsDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefGetWarningsDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefGetWarningsDefaultValue"
               }"
               end

	xml_thr_def_indent_tree_output (a_v: INTEGER): INTEGER 

		-- function xmlThrDefIndentTreeOutput (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefIndentTreeOutput
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefIndentTreeOutput"
               }"
               end

	xml_thr_def_keep_blanks_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefKeepBlanksDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefKeepBlanksDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefKeepBlanksDefaultValue"
               }"
               end

	xml_thr_def_line_numbers_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefLineNumbersDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefLineNumbersDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefLineNumbersDefaultValue"
               }"
               end

	xml_thr_def_load_ext_dtd_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefLoadExtDtdDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefLoadExtDtdDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefLoadExtDtdDefaultValue"
               }"
               end

	xml_thr_def_output_buffer_create_filename_default (a_func: POINTER): POINTER 

		-- function xmlThrDefOutputBufferCreateFilenameDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefOutputBufferCreateFilenameDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefOutputBufferCreateFilenameDefault"
               }"
               end

	xml_thr_def_parser_debug_entities (a_v: INTEGER): INTEGER 

		-- function xmlThrDefParserDebugEntities (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefParserDebugEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefParserDebugEntities"
               }"
               end

	xml_thr_def_parser_input_buffer_create_filename_default (a_func: POINTER): POINTER 

		-- function xmlThrDefParserInputBufferCreateFilenameDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefParserInputBufferCreateFilenameDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefParserInputBufferCreateFilenameDefault"
               }"
               end

	xml_thr_def_pedantic_parser_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefPedanticParserDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefPedanticParserDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefPedanticParserDefaultValue"
               }"
               end

	xml_thr_def_register_node_default (a_func: POINTER): POINTER 

		-- function xmlThrDefRegisterNodeDefault (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefRegisterNodeDefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefRegisterNodeDefault"
               }"
               end

	xml_thr_def_save_no_empty_tags (a_v: INTEGER): INTEGER 

		-- function xmlThrDefSaveNoEmptyTags (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefSaveNoEmptyTags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefSaveNoEmptyTags"
               }"
               end

	xml_thr_def_set_generic_error_func (a_ctx: POINTER; a_handler: POINTER) 

		-- function xmlThrDefSetGenericErrorFunc (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefSetGenericErrorFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefSetGenericErrorFunc"
               }"
               end

	xml_thr_def_set_structured_error_func (a_ctx: POINTER; a_handler: POINTER) 

		-- function xmlThrDefSetStructuredErrorFunc (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefSetStructuredErrorFunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefSetStructuredErrorFunc"
               }"
               end

	xml_thr_def_substitute_entities_default_value (a_v: INTEGER): INTEGER 

		-- function xmlThrDefSubstituteEntitiesDefaultValue (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefSubstituteEntitiesDefaultValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefSubstituteEntitiesDefaultValue"
               }"
               end

	xml_thr_def_tree_indent_string (a_v: POINTER): POINTER 

		-- function xmlThrDefTreeIndentString (in `/usr/include/libxml2/libxml/globals.h')
               -- xmlThrDefTreeIndentString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlThrDefTreeIndentString"
               }"
               end

	-- `hidden' function __xmlTreeIndentString skipped.
	xml_tree_indent_string: POINTER
               -- xml_tree_indent_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTreeIndentString"
               }"
               end

       address_of_xml_tree_indent_string: POINTER
               -- Address of xml_tree_indent_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&xmlTreeIndentString"
               }"
               end

       set_xml_tree_indent_string (a_value: POINTER)
               -- Set variable xml_tree_indent_string value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_xmlTreeIndentString"
               }"
               end


end -- class GLOBALS_EXTERNALS
