-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SAX2_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_sax2has_internal_subset (a_ctx: POINTER): INTEGER_32 is
 		-- xmlSAX2HasInternalSubset (node at line 107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2HasInternalSubset"
		}"
		end

	xml_saxversion (a_hdlr: POINTER; a_version: INTEGER_32): INTEGER_32 is
 		-- xmlSAXVersion (node at line 406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXVersion"
		}"
		end

	xml_sax2unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) is
 		-- xmlSAX2UnparsedEntityDecl (node at line 410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2UnparsedEntityDecl"
		}"
		end

	xml_sax2notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) is
 		-- xmlSAX2NotationDecl (node at line 424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2NotationDecl"
		}"
		end

	xml_sax2set_document_locator (a_ctx: POINTER; a_loc: POINTER) is
 		-- xmlSAX2SetDocumentLocator (node at line 1451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2SetDocumentLocator"
		}"
		end

	xml_sax2get_system_id (a_ctx: POINTER): POINTER is
 		-- xmlSAX2GetSystemId (node at line 1509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetSystemId"
		}"
		end

	xml_sax2get_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- xmlSAX2GetEntity (node at line 1556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetEntity"
		}"
		end

	xml_sax2get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- xmlSAX2GetParameterEntity (node at line 1632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetParameterEntity"
		}"
		end

	xml_sax2comment (a_ctx: POINTER; a_value: POINTER) is
 		-- xmlSAX2Comment (node at line 1850)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2Comment"
		}"
		end

	docb_default_saxhandler_init is
 		-- docbDefaultSAXHandlerInit (node at line 1948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "docbDefaultSAXHandlerInit()"
		}"
		end

	xml_sax2cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER_32) is
 		-- xmlSAX2CDataBlock (node at line 2165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2CDataBlock"
		}"
		end

	xml_sax2external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- xmlSAX2ExternalSubset (node at line 2514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2ExternalSubset"
		}"
		end

	xml_sax2start_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER; a_nb_namespaces: INTEGER_32; a_namespaces: POINTER; a_nb_attributes: INTEGER_32; a_nb_defaulted: INTEGER_32; an_attributes: POINTER) is
 		-- xmlSAX2StartElementNs (node at line 2576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2StartElementNs"
		}"
		end

	xml_sax2init_html_default_saxhandler (a_hdlr: POINTER) is
 		-- xmlSAX2InitHtmlDefaultSAXHandler (node at line 2888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2InitHtmlDefaultSAXHandler"
		}"
		end

	xml_sax2characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER_32) is
 		-- xmlSAX2Characters (node at line 3091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2Characters"
		}"
		end

	xml_sax2end_element (a_ctx: POINTER; a_name: POINTER) is
 		-- xmlSAX2EndElement (node at line 3097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2EndElement"
		}"
		end

	xml_sax2init_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER_32) is
 		-- xmlSAX2InitDefaultSAXHandler (node at line 3207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2InitDefaultSAXHandler"
		}"
		end

	xml_sax2internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- xmlSAX2InternalSubset (node at line 3397)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2InternalSubset"
		}"
		end

	xml_sax2reference (a_ctx: POINTER; a_name: POINTER) is
 		-- xmlSAX2Reference (node at line 3764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2Reference"
		}"
		end

	xml_sax2end_document (a_ctx: POINTER) is
 		-- xmlSAX2EndDocument (node at line 3937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2EndDocument"
		}"
		end

	xml_sax2start_document (a_ctx: POINTER) is
 		-- xmlSAX2StartDocument (node at line 4056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2StartDocument"
		}"
		end

	xml_sax2get_line_number (a_ctx: POINTER): INTEGER_32 is
 		-- xmlSAX2GetLineNumber (node at line 4143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetLineNumber"
		}"
		end

	xml_sax2element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER_32; a_content: POINTER) is
 		-- xmlSAX2ElementDecl (node at line 4289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2ElementDecl"
		}"
		end

	xml_sax2resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlSAX2ResolveEntity (node at line 4377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2ResolveEntity"
		}"
		end

	xml_sax2init_docb_default_saxhandler (a_hdlr: POINTER) is
 		-- xmlSAX2InitDocbDefaultSAXHandler (node at line 4624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2InitDocbDefaultSAXHandler"
		}"
		end

	xml_sax2has_external_subset (a_ctx: POINTER): INTEGER_32 is
 		-- xmlSAX2HasExternalSubset (node at line 4627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2HasExternalSubset"
		}"
		end

	xml_sax2entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER_32; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) is
 		-- xmlSAX2EntityDecl (node at line 4810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2EntityDecl"
		}"
		end

	xml_default_saxhandler_init is
 		-- xmlDefaultSAXHandlerInit (node at line 4865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDefaultSAXHandlerInit()"
		}"
		end

	xml_sax2end_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER) is
 		-- xmlSAX2EndElementNs (node at line 4873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2EndElementNs"
		}"
		end

	xml_saxdefault_version (a_version: INTEGER_32): INTEGER_32 is
 		-- xmlSAXDefaultVersion (node at line 4977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAXDefaultVersion"
		}"
		end

	xml_sax2processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) is
 		-- xmlSAX2ProcessingInstruction (node at line 5238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2ProcessingInstruction"
		}"
		end

	xml_sax2is_standalone (a_ctx: POINTER): INTEGER_32 is
 		-- xmlSAX2IsStandalone (node at line 5520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2IsStandalone"
		}"
		end

	xml_sax2attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER_32; a_def: INTEGER_32; a_default_value: POINTER; a_tree: POINTER) is
 		-- xmlSAX2AttributeDecl (node at line 5617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2AttributeDecl"
		}"
		end

	xml_sax2get_public_id (a_ctx: POINTER): POINTER is
 		-- xmlSAX2GetPublicId (node at line 5755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetPublicId"
		}"
		end

	xml_sax2ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER_32) is
 		-- xmlSAX2IgnorableWhitespace (node at line 5852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2IgnorableWhitespace"
		}"
		end

	xml_sax2start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) is
 		-- xmlSAX2StartElement (node at line 5902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2StartElement"
		}"
		end

	html_default_saxhandler_init is
 		-- htmlDefaultSAXHandlerInit (node at line 5978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "htmlDefaultSAXHandlerInit()"
		}"
		end

	xml_sax2get_column_number (a_ctx: POINTER): INTEGER_32 is
 		-- xmlSAX2GetColumnNumber (node at line 6036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSAX2GetColumnNumber"
		}"
		end


end -- class SAX2_EXTERNALS
