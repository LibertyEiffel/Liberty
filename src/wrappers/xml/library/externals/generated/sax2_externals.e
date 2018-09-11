-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SAX2_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	docb_default_saxhandler_init 

		-- function docbDefaultSAXHandlerInit (in `/usr/include/libxml2/libxml/SAX2.h')
               -- docbDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "docbDefaultSAXHandlerInit()"
               }"
               end

	html_default_saxhandler_init 

		-- function htmlDefaultSAXHandlerInit (in `/usr/include/libxml2/libxml/SAX2.h')
               -- htmlDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "htmlDefaultSAXHandlerInit()"
               }"
               end

	xml_default_saxhandler_init 

		-- function xmlDefaultSAXHandlerInit (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlDefaultSAXHandlerInit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDefaultSAXHandlerInit()"
               }"
               end

	xml_sax2attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) 

		-- function xmlSAX2AttributeDecl (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2AttributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2AttributeDecl"
               }"
               end

	xml_sax2cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) 

		-- function xmlSAX2CDataBlock (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2CDataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2CDataBlock"
               }"
               end

	xml_sax2characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function xmlSAX2Characters (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2Characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Characters"
               }"
               end

	xml_sax2comment (a_ctx: POINTER; a_value: POINTER) 

		-- function xmlSAX2Comment (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2Comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Comment"
               }"
               end

	xml_sax2element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) 

		-- function xmlSAX2ElementDecl (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2ElementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ElementDecl"
               }"
               end

	xml_sax2end_document (a_ctx: POINTER) 

		-- function xmlSAX2EndDocument (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2EndDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndDocument"
               }"
               end

	xml_sax2end_element (a_ctx: POINTER; a_name: POINTER) 

		-- function xmlSAX2EndElement (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2EndElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndElement"
               }"
               end

	xml_sax2end_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER) 

		-- function xmlSAX2EndElementNs (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2EndElementNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EndElementNs"
               }"
               end

	xml_sax2entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) 

		-- function xmlSAX2EntityDecl (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2EntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2EntityDecl"
               }"
               end

	xml_sax2external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function xmlSAX2ExternalSubset (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2ExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ExternalSubset"
               }"
               end

	xml_sax2get_column_number (a_ctx: POINTER): INTEGER 

		-- function xmlSAX2GetColumnNumber (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetColumnNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetColumnNumber"
               }"
               end

	xml_sax2get_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function xmlSAX2GetEntity (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetEntity"
               }"
               end

	xml_sax2get_line_number (a_ctx: POINTER): INTEGER 

		-- function xmlSAX2GetLineNumber (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetLineNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetLineNumber"
               }"
               end

	xml_sax2get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function xmlSAX2GetParameterEntity (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetParameterEntity"
               }"
               end

	xml_sax2get_public_id (a_ctx: POINTER): POINTER 

		-- function xmlSAX2GetPublicId (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetPublicId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetPublicId"
               }"
               end

	xml_sax2get_system_id (a_ctx: POINTER): POINTER 

		-- function xmlSAX2GetSystemId (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2GetSystemId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2GetSystemId"
               }"
               end

	xml_sax2has_external_subset (a_ctx: POINTER): INTEGER 

		-- function xmlSAX2HasExternalSubset (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2HasExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2HasExternalSubset"
               }"
               end

	xml_sax2has_internal_subset (a_ctx: POINTER): INTEGER 

		-- function xmlSAX2HasInternalSubset (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2HasInternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2HasInternalSubset"
               }"
               end

	xml_sax2ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function xmlSAX2IgnorableWhitespace (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2IgnorableWhitespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2IgnorableWhitespace"
               }"
               end

	xml_sax2init_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) 

		-- function xmlSAX2InitDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2InitDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitDefaultSAXHandler"
               }"
               end

	xml_sax2init_docb_default_saxhandler (a_hdlr: POINTER) 

		-- function xmlSAX2InitDocbDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2InitDocbDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitDocbDefaultSAXHandler"
               }"
               end

	xml_sax2init_html_default_saxhandler (a_hdlr: POINTER) 

		-- function xmlSAX2InitHtmlDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2InitHtmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InitHtmlDefaultSAXHandler"
               }"
               end

	xml_sax2internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function xmlSAX2InternalSubset (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2InternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2InternalSubset"
               }"
               end

	xml_sax2is_standalone (a_ctx: POINTER): INTEGER 

		-- function xmlSAX2IsStandalone (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2IsStandalone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2IsStandalone"
               }"
               end

	xml_sax2notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) 

		-- function xmlSAX2NotationDecl (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2NotationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2NotationDecl"
               }"
               end

	xml_sax2processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) 

		-- function xmlSAX2ProcessingInstruction (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2ProcessingInstruction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ProcessingInstruction"
               }"
               end

	xml_sax2reference (a_ctx: POINTER; a_name: POINTER) 

		-- function xmlSAX2Reference (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2Reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2Reference"
               }"
               end

	xml_sax2resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlSAX2ResolveEntity (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2ResolveEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2ResolveEntity"
               }"
               end

	xml_sax2set_document_locator (a_ctx: POINTER; a_loc: POINTER) 

		-- function xmlSAX2SetDocumentLocator (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2SetDocumentLocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2SetDocumentLocator"
               }"
               end

	xml_sax2start_document (a_ctx: POINTER) 

		-- function xmlSAX2StartDocument (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2StartDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartDocument"
               }"
               end

	xml_sax2start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) 

		-- function xmlSAX2StartElement (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2StartElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartElement"
               }"
               end

	xml_sax2start_element_ns (a_ctx: POINTER; a_localname: POINTER; a_prefix: POINTER; an_uri: POINTER; a_nb_namespaces: INTEGER; a_namespaces: POINTER; a_nb_attributes: INTEGER; a_nb_defaulted: INTEGER; an_attributes: POINTER) 

		-- function xmlSAX2StartElementNs (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2StartElementNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2StartElementNs"
               }"
               end

	xml_sax2unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) 

		-- function xmlSAX2UnparsedEntityDecl (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAX2UnparsedEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAX2UnparsedEntityDecl"
               }"
               end

	xml_saxdefault_version (a_version: INTEGER): INTEGER 

		-- function xmlSAXDefaultVersion (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAXDefaultVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXDefaultVersion"
               }"
               end

	xml_saxversion (a_hdlr: POINTER; a_version: INTEGER): INTEGER 

		-- function xmlSAXVersion (in `/usr/include/libxml2/libxml/SAX2.h')
               -- xmlSAXVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSAXVersion"
               }"
               end


end -- class SAX2_EXTERNALS
