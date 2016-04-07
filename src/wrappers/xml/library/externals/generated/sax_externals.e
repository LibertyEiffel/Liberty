-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SAX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) 

		-- function attributeDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- attributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attributeDecl"
               }"
               end

	attribute_external (a_ctx: POINTER; a_fullname: POINTER; a_value: POINTER) 

		-- function attribute (in `/usr/include/libxml2/libxml/SAX.h')
               -- attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attribute"
               }"
               end

	cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) 

		-- function cdataBlock (in `/usr/include/libxml2/libxml/SAX.h')
               -- cdataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cdataBlock"
               }"
               end

	characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function characters (in `/usr/include/libxml2/libxml/SAX.h')
               -- characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "characters"
               }"
               end

	check_namespace (a_ctx: POINTER; a_name_space: POINTER): INTEGER 

		-- function checkNamespace (in `/usr/include/libxml2/libxml/SAX.h')
               -- checkNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "checkNamespace"
               }"
               end

	comment (a_ctx: POINTER; a_value: POINTER) 

		-- function comment (in `/usr/include/libxml2/libxml/SAX.h')
               -- comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "comment"
               }"
               end

	element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) 

		-- function elementDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- elementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "elementDecl"
               }"
               end

	end_document (a_ctx: POINTER) 

		-- function endDocument (in `/usr/include/libxml2/libxml/SAX.h')
               -- endDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endDocument"
               }"
               end

	end_element (a_ctx: POINTER; a_name: POINTER) 

		-- function endElement (in `/usr/include/libxml2/libxml/SAX.h')
               -- endElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endElement"
               }"
               end

	entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) 

		-- function entityDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- entityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "entityDecl"
               }"
               end

	external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function externalSubset (in `/usr/include/libxml2/libxml/SAX.h')
               -- externalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "externalSubset"
               }"
               end

	get_column_number (a_ctx: POINTER): INTEGER 

		-- function getColumnNumber (in `/usr/include/libxml2/libxml/SAX.h')
               -- getColumnNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getColumnNumber"
               }"
               end

	get_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function getEntity (in `/usr/include/libxml2/libxml/SAX.h')
               -- getEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getEntity"
               }"
               end

	get_line_number (a_ctx: POINTER): INTEGER 

		-- function getLineNumber (in `/usr/include/libxml2/libxml/SAX.h')
               -- getLineNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getLineNumber"
               }"
               end

	get_namespace (a_ctx: POINTER): POINTER 

		-- function getNamespace (in `/usr/include/libxml2/libxml/SAX.h')
               -- getNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getNamespace"
               }"
               end

	get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function getParameterEntity (in `/usr/include/libxml2/libxml/SAX.h')
               -- getParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getParameterEntity"
               }"
               end

	get_public_id (a_ctx: POINTER): POINTER 

		-- function getPublicId (in `/usr/include/libxml2/libxml/SAX.h')
               -- getPublicId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getPublicId"
               }"
               end

	get_system_id (a_ctx: POINTER): POINTER 

		-- function getSystemId (in `/usr/include/libxml2/libxml/SAX.h')
               -- getSystemId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getSystemId"
               }"
               end

	global_namespace (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 

		-- function globalNamespace (in `/usr/include/libxml2/libxml/SAX.h')
               -- globalNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "globalNamespace"
               }"
               end

	has_external_subset (a_ctx: POINTER): INTEGER 

		-- function hasExternalSubset (in `/usr/include/libxml2/libxml/SAX.h')
               -- hasExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasExternalSubset"
               }"
               end

	has_internal_subset (a_ctx: POINTER): INTEGER 

		-- function hasInternalSubset (in `/usr/include/libxml2/libxml/SAX.h')
               -- hasInternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasInternalSubset"
               }"
               end

	ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function ignorableWhitespace (in `/usr/include/libxml2/libxml/SAX.h')
               -- ignorableWhitespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ignorableWhitespace"
               }"
               end

	initdocb_default_saxhandler (a_hdlr: POINTER) 

		-- function initdocbDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX.h')
               -- initdocbDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initdocbDefaultSAXHandler"
               }"
               end

	inithtml_default_saxhandler (a_hdlr: POINTER) 

		-- function inithtmlDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX.h')
               -- inithtmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inithtmlDefaultSAXHandler"
               }"
               end

	initxml_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) 

		-- function initxmlDefaultSAXHandler (in `/usr/include/libxml2/libxml/SAX.h')
               -- initxmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initxmlDefaultSAXHandler"
               }"
               end

	internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function internalSubset (in `/usr/include/libxml2/libxml/SAX.h')
               -- internalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "internalSubset"
               }"
               end

	is_standalone (a_ctx: POINTER): INTEGER 

		-- function isStandalone (in `/usr/include/libxml2/libxml/SAX.h')
               -- isStandalone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isStandalone"
               }"
               end

	namespace_decl (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 

		-- function namespaceDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- namespaceDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "namespaceDecl"
               }"
               end

	notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) 

		-- function notationDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- notationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "notationDecl"
               }"
               end

	processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) 

		-- function processingInstruction (in `/usr/include/libxml2/libxml/SAX.h')
               -- processingInstruction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "processingInstruction"
               }"
               end

	reference (a_ctx: POINTER; a_name: POINTER) 

		-- function reference (in `/usr/include/libxml2/libxml/SAX.h')
               -- reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "reference"
               }"
               end

	resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 

		-- function resolveEntity (in `/usr/include/libxml2/libxml/SAX.h')
               -- resolveEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "resolveEntity"
               }"
               end

	set_document_locator (a_ctx: POINTER; a_loc: POINTER) 

		-- function setDocumentLocator (in `/usr/include/libxml2/libxml/SAX.h')
               -- setDocumentLocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setDocumentLocator"
               }"
               end

	set_namespace (a_ctx: POINTER; a_name: POINTER) 

		-- function setNamespace (in `/usr/include/libxml2/libxml/SAX.h')
               -- setNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setNamespace"
               }"
               end

	start_document (a_ctx: POINTER) 

		-- function startDocument (in `/usr/include/libxml2/libxml/SAX.h')
               -- startDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startDocument"
               }"
               end

	start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) 

		-- function startElement (in `/usr/include/libxml2/libxml/SAX.h')
               -- startElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startElement"
               }"
               end

	unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) 

		-- function unparsedEntityDecl (in `/usr/include/libxml2/libxml/SAX.h')
               -- unparsedEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unparsedEntityDecl"
               }"
               end


end -- class SAX_EXTERNALS
