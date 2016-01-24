-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class SAX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) 
               -- attributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attributeDecl"
               }"
               end

	attribute_external (a_ctx: POINTER; a_fullname: POINTER; a_value: POINTER) 
               -- attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attribute"
               }"
               end

	cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) 
               -- cdataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cdataBlock"
               }"
               end

	characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 
               -- characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "characters"
               }"
               end

	check_namespace (a_ctx: POINTER; a_name_space: POINTER): INTEGER 
               -- checkNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "checkNamespace"
               }"
               end

	comment (a_ctx: POINTER; a_value: POINTER) 
               -- comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "comment"
               }"
               end

	element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) 
               -- elementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "elementDecl"
               }"
               end

	end_document (a_ctx: POINTER) 
               -- endDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endDocument"
               }"
               end

	end_element (a_ctx: POINTER; a_name: POINTER) 
               -- endElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endElement"
               }"
               end

	entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) 
               -- entityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "entityDecl"
               }"
               end

	external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 
               -- externalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "externalSubset"
               }"
               end

	get_column_number (a_ctx: POINTER): INTEGER 
               -- getColumnNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getColumnNumber"
               }"
               end

	get_entity (a_ctx: POINTER; a_name: POINTER): POINTER 
               -- getEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getEntity"
               }"
               end

	get_line_number (a_ctx: POINTER): INTEGER 
               -- getLineNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getLineNumber"
               }"
               end

	get_namespace (a_ctx: POINTER): POINTER 
               -- getNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getNamespace"
               }"
               end

	get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER 
               -- getParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getParameterEntity"
               }"
               end

	get_public_id (a_ctx: POINTER): POINTER 
               -- getPublicId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getPublicId"
               }"
               end

	get_system_id (a_ctx: POINTER): POINTER 
               -- getSystemId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getSystemId"
               }"
               end

	global_namespace (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 
               -- globalNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "globalNamespace"
               }"
               end

	has_external_subset (a_ctx: POINTER): INTEGER 
               -- hasExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasExternalSubset"
               }"
               end

	has_internal_subset (a_ctx: POINTER): INTEGER 
               -- hasInternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasInternalSubset"
               }"
               end

	ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 
               -- ignorableWhitespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ignorableWhitespace"
               }"
               end

	initdocb_default_saxhandler (a_hdlr: POINTER) 
               -- initdocbDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initdocbDefaultSAXHandler"
               }"
               end

	inithtml_default_saxhandler (a_hdlr: POINTER) 
               -- inithtmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inithtmlDefaultSAXHandler"
               }"
               end

	initxml_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) 
               -- initxmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initxmlDefaultSAXHandler"
               }"
               end

	internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 
               -- internalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "internalSubset"
               }"
               end

	is_standalone (a_ctx: POINTER): INTEGER 
               -- isStandalone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isStandalone"
               }"
               end

	namespace_decl (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 
               -- namespaceDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "namespaceDecl"
               }"
               end

	notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) 
               -- notationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "notationDecl"
               }"
               end

	processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) 
               -- processingInstruction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "processingInstruction"
               }"
               end

	reference (a_ctx: POINTER; a_name: POINTER) 
               -- reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "reference"
               }"
               end

	resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 
               -- resolveEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "resolveEntity"
               }"
               end

	set_document_locator (a_ctx: POINTER; a_loc: POINTER) 
               -- setDocumentLocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setDocumentLocator"
               }"
               end

	set_namespace (a_ctx: POINTER; a_name: POINTER) 
               -- setNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setNamespace"
               }"
               end

	start_document (a_ctx: POINTER) 
               -- startDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startDocument"
               }"
               end

	start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) 
               -- startElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startElement"
               }"
               end

	unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) 
               -- unparsedEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unparsedEntityDecl"
               }"
               end


end -- class SAX_EXTERNALS
