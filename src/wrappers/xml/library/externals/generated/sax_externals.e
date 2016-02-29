-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SAX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) 

		-- function attributeDecl (in 75 at line /usr/include/libxml2/libxml/SAX.h)i
               -- attributeDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attributeDecl"
               }"
               end

	attribute_external (a_ctx: POINTER; a_fullname: POINTER; a_value: POINTER) 

		-- function attribute (in 104 at line /usr/include/libxml2/libxml/SAX.h)i
               -- attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "attribute"
               }"
               end

	cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) 

		-- function cdataBlock (in 149 at line /usr/include/libxml2/libxml/SAX.h)i
               -- cdataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cdataBlock"
               }"
               end

	characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function characters (in 118 at line /usr/include/libxml2/libxml/SAX.h)i
               -- characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "characters"
               }"
               end

	check_namespace (a_ctx: POINTER; a_name_space: POINTER): INTEGER 

		-- function checkNamespace (in 139 at line /usr/include/libxml2/libxml/SAX.h)i
               -- checkNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "checkNamespace"
               }"
               end

	comment (a_ctx: POINTER; a_value: POINTER) 

		-- function comment (in 146 at line /usr/include/libxml2/libxml/SAX.h)i
               -- comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "comment"
               }"
               end

	element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) 

		-- function elementDecl (in 83 at line /usr/include/libxml2/libxml/SAX.h)i
               -- elementDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "elementDecl"
               }"
               end

	end_document (a_ctx: POINTER) 

		-- function endDocument (in 102 at line /usr/include/libxml2/libxml/SAX.h)i
               -- endDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endDocument"
               }"
               end

	end_element (a_ctx: POINTER; a_name: POINTER) 

		-- function endElement (in 112 at line /usr/include/libxml2/libxml/SAX.h)i
               -- endElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endElement"
               }"
               end

	entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) 

		-- function entityDecl (in 68 at line /usr/include/libxml2/libxml/SAX.h)i
               -- entityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "entityDecl"
               }"
               end

	external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function externalSubset (in 52 at line /usr/include/libxml2/libxml/SAX.h)i
               -- externalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "externalSubset"
               }"
               end

	get_column_number (a_ctx: POINTER): INTEGER 

		-- function getColumnNumber (in 37 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getColumnNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getColumnNumber"
               }"
               end

	get_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function getEntity (in 57 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getEntity"
               }"
               end

	get_line_number (a_ctx: POINTER): INTEGER 

		-- function getLineNumber (in 35 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getLineNumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getLineNumber"
               }"
               end

	get_namespace (a_ctx: POINTER): POINTER 

		-- function getNamespace (in 137 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getNamespace"
               }"
               end

	get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER 

		-- function getParameterEntity (in 60 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getParameterEntity"
               }"
               end

	get_public_id (a_ctx: POINTER): POINTER 

		-- function getPublicId (in 27 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getPublicId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getPublicId"
               }"
               end

	get_system_id (a_ctx: POINTER): POINTER 

		-- function getSystemId (in 29 at line /usr/include/libxml2/libxml/SAX.h)i
               -- getSystemId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getSystemId"
               }"
               end

	global_namespace (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 

		-- function globalNamespace (in 130 at line /usr/include/libxml2/libxml/SAX.h)i
               -- globalNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "globalNamespace"
               }"
               end

	has_external_subset (a_ctx: POINTER): INTEGER 

		-- function hasExternalSubset (in 44 at line /usr/include/libxml2/libxml/SAX.h)i
               -- hasExternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasExternalSubset"
               }"
               end

	has_internal_subset (a_ctx: POINTER): INTEGER 

		-- function hasInternalSubset (in 42 at line /usr/include/libxml2/libxml/SAX.h)i
               -- hasInternalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hasInternalSubset"
               }"
               end

	ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) 

		-- function ignorableWhitespace (in 122 at line /usr/include/libxml2/libxml/SAX.h)i
               -- ignorableWhitespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ignorableWhitespace"
               }"
               end

	initdocb_default_saxhandler (a_hdlr: POINTER) 

		-- function initdocbDefaultSAXHandler (in 163 at line /usr/include/libxml2/libxml/SAX.h)i
               -- initdocbDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initdocbDefaultSAXHandler"
               }"
               end

	inithtml_default_saxhandler (a_hdlr: POINTER) 

		-- function inithtmlDefaultSAXHandler (in 159 at line /usr/include/libxml2/libxml/SAX.h)i
               -- inithtmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inithtmlDefaultSAXHandler"
               }"
               end

	initxml_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) 

		-- function initxmlDefaultSAXHandler (in 155 at line /usr/include/libxml2/libxml/SAX.h)i
               -- initxmlDefaultSAXHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initxmlDefaultSAXHandler"
               }"
               end

	internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) 

		-- function internalSubset (in 47 at line /usr/include/libxml2/libxml/SAX.h)i
               -- internalSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "internalSubset"
               }"
               end

	is_standalone (a_ctx: POINTER): INTEGER 

		-- function isStandalone (in 40 at line /usr/include/libxml2/libxml/SAX.h)i
               -- isStandalone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isStandalone"
               }"
               end

	namespace_decl (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) 

		-- function namespaceDecl (in 142 at line /usr/include/libxml2/libxml/SAX.h)i
               -- namespaceDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "namespaceDecl"
               }"
               end

	notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) 

		-- function notationDecl (in 88 at line /usr/include/libxml2/libxml/SAX.h)i
               -- notationDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "notationDecl"
               }"
               end

	processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) 

		-- function processingInstruction (in 126 at line /usr/include/libxml2/libxml/SAX.h)i
               -- processingInstruction
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "processingInstruction"
               }"
               end

	reference (a_ctx: POINTER; a_name: POINTER) 

		-- function reference (in 115 at line /usr/include/libxml2/libxml/SAX.h)i
               -- reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "reference"
               }"
               end

	resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER 

		-- function resolveEntity (in 63 at line /usr/include/libxml2/libxml/SAX.h)i
               -- resolveEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "resolveEntity"
               }"
               end

	set_document_locator (a_ctx: POINTER; a_loc: POINTER) 

		-- function setDocumentLocator (in 31 at line /usr/include/libxml2/libxml/SAX.h)i
               -- setDocumentLocator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setDocumentLocator"
               }"
               end

	set_namespace (a_ctx: POINTER; a_name: POINTER) 

		-- function setNamespace (in 134 at line /usr/include/libxml2/libxml/SAX.h)i
               -- setNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setNamespace"
               }"
               end

	start_document (a_ctx: POINTER) 

		-- function startDocument (in 100 at line /usr/include/libxml2/libxml/SAX.h)i
               -- startDocument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startDocument"
               }"
               end

	start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) 

		-- function startElement (in 108 at line /usr/include/libxml2/libxml/SAX.h)i
               -- startElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "startElement"
               }"
               end

	unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) 

		-- function unparsedEntityDecl (in 93 at line /usr/include/libxml2/libxml/SAX.h)i
               -- unparsedEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unparsedEntityDecl"
               }"
               end


end -- class SAX_EXTERNALS
