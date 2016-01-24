-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class SAX2_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	docb_default_saxhandler_init 
               -- docbDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "docbDefaultSAXHandlerInit"
               }"
               end

	html_default_saxhandler_init 
               -- htmlDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "htmlDefaultSAXHandlerInit"
               }"
               end

	xml_default_saxhandler_init 
               -- xmlDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDefaultSAXHandlerInit"
               }"
               end

	xml_sax2attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) 
               -- xmlSAX2AttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2AttributeDecl"
               }"
               end

	xml_sax2cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) 
               -- xmlSAX2CDataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2CDataBlock"
               }"
               end

	xml_sax2characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 
               -- xmlSAX2Characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Characters"
               }"
               end

	xml_sax2comment (a_ctx: POINTER; a_value: POINTER) 
               -- xmlSAX2Comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Comment"
               }"
               end

	xml_sax2element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) 
               -- xmlSAX2ElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ElementDecl"
               }"
               end

	xml_sax2end_document (a_ctx: POINTER) 
               -- xmlSAX2EndDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndDocument"
               }"
               end

	xml_sax2end_element (a_ctx: POINTER; a_name: POINTER) 
               -- xmlSAX2EndElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndElement"
               }"
               end

	xml_sax2end_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER) 
               -- xmlSAX2EndElementNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndElementNs"
               }"
               end

	xml_sax2entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) 
               -- xmlSAX2EntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EntityDecl"
               }"
               end

	xml_sax2external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 
               -- xmlSAX2ExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ExternalSubset"
               }"
               end

	xml_sax2get_column_number (a_ctx: POINTER): INTEGER 
               -- xmlSAX2GetColumnNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetColumnNumber"
               }"
               end

	xml_sax2get_entity (a_ctx: POINTER; a_name: POINTER): POINTER 
               -- xmlSAX2GetEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetEntity"
               }"
               end

	xml_sax2get_line_number (a_ctx: POINTER): INTEGER 
               -- xmlSAX2GetLineNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetLineNumber"
               }"
               end

	xml_sax2get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER 
               -- xmlSAX2GetParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetParameterEntity"
               }"
               end

	xml_sax2get_public_id (a_ctx: POINTER): POINTER 
               -- xmlSAX2GetPublicId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetPublicId"
               }"
               end

	xml_sax2get_system_id (a_ctx: POINTER): POINTER 
               -- xmlSAX2GetSystemId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetSystemId"
               }"
               end

	xml_sax2has_external_subset (a_ctx: POINTER): INTEGER 
               -- xmlSAX2HasExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2HasExternalSubset"
               }"
               end

	xml_sax2has_internal_subset (a_ctx: POINTER): INTEGER 
               -- xmlSAX2HasInternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2HasInternalSubset"
               }"
               end

	xml_sax2ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 
               -- xmlSAX2IgnorableWhitespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2IgnorableWhitespace"
               }"
               end

	xml_sax2init_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) 
               -- xmlSAX2InitDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitDefaultSAXHandler"
               }"
               end

	xml_sax2init_docb_default_saxhandler (a_hdlr: POINTER) 
               -- xmlSAX2InitDocbDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitDocbDefaultSAXHandler"
               }"
               end

	xml_sax2init_html_default_saxhandler (a_hdlr: POINTER) 
               -- xmlSAX2InitHtmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitHtmlDefaultSAXHandler"
               }"
               end

	xml_sax2internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 
               -- xmlSAX2InternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InternalSubset"
               }"
               end

	xml_sax2is_standalone (a_ctx: POINTER): INTEGER 
               -- xmlSAX2IsStandalone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2IsStandalone"
               }"
               end

	xml_sax2notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) 
               -- xmlSAX2NotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2NotationDecl"
               }"
               end

	xml_sax2processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) 
               -- xmlSAX2ProcessingInstruction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ProcessingInstruction"
               }"
               end

	xml_sax2reference (a_ctx: POINTER; a_name: POINTER) 
               -- xmlSAX2Reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Reference"
               }"
               end

	xml_sax2resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 
               -- xmlSAX2ResolveEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ResolveEntity"
               }"
               end

	xml_sax2set_document_locator (a_ctx: POINTER; a_loc: POINTER) 
               -- xmlSAX2SetDocumentLocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2SetDocumentLocator"
               }"
               end

	xml_sax2start_document (a_ctx: POINTER) 
               -- xmlSAX2StartDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartDocument"
               }"
               end

	xml_sax2start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) 
               -- xmlSAX2StartElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartElement"
               }"
               end

	xml_sax2start_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER; a_nb_namespaces: INTEGER; a_namespaces: POINTER; a_nb_attributes: INTEGER; a_nb_defaulted: INTEGER; an_attributes: POINTER) 
               -- xmlSAX2StartElementNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartElementNs"
               }"
               end

	xml_sax2unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) 
               -- xmlSAX2UnparsedEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2UnparsedEntityDecl"
               }"
               end

	xml_saxdefault_version (a_version: INTEGER): INTEGER 
               -- xmlSAXDefaultVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXDefaultVersion"
               }"
               end

	xml_saxversion (a_hdlr: POINTER; a_version: INTEGER): INTEGER 
               -- xmlSAXVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXVersion"
               }"
               end


end -- class SAX2_EXTERNALS
