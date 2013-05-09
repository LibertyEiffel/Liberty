-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SAX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER; a_def: INTEGER; a_default_value: POINTER; a_tree: POINTER) is
 		-- attributeDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "attributeDecl"
		}"
		end

	attribute_external (a_ctx: POINTER; a_fullname: POINTER; a_value: POINTER) is
 		-- attribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "attribute"
		}"
		end

	cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER) is
 		-- cdataBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cdataBlock"
		}"
		end

	characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) is
 		-- characters
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "characters"
		}"
		end

	check_namespace (a_ctx: POINTER; a_name_space: POINTER): INTEGER is
 		-- checkNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "checkNamespace"
		}"
		end

	comment (a_ctx: POINTER; a_value: POINTER) is
 		-- comment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "comment"
		}"
		end

	element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_content: POINTER) is
 		-- elementDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "elementDecl"
		}"
		end

	end_document (a_ctx: POINTER) is
 		-- endDocument
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endDocument"
		}"
		end

	end_element (a_ctx: POINTER; a_name: POINTER) is
 		-- endElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endElement"
		}"
		end

	entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) is
 		-- entityDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "entityDecl"
		}"
		end

	external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- externalSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "externalSubset"
		}"
		end

	get_column_number (a_ctx: POINTER): INTEGER is
 		-- getColumnNumber
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getColumnNumber"
		}"
		end

	get_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- getEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getEntity"
		}"
		end

	get_line_number (a_ctx: POINTER): INTEGER is
 		-- getLineNumber
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getLineNumber"
		}"
		end

	get_namespace (a_ctx: POINTER): POINTER is
 		-- getNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getNamespace"
		}"
		end

	get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- getParameterEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getParameterEntity"
		}"
		end

	get_public_id (a_ctx: POINTER): POINTER is
 		-- getPublicId
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getPublicId"
		}"
		end

	get_system_id (a_ctx: POINTER): POINTER is
 		-- getSystemId
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getSystemId"
		}"
		end

	global_namespace (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) is
 		-- globalNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "globalNamespace"
		}"
		end

	has_external_subset (a_ctx: POINTER): INTEGER is
 		-- hasExternalSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hasExternalSubset"
		}"
		end

	has_internal_subset (a_ctx: POINTER): INTEGER is
 		-- hasInternalSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hasInternalSubset"
		}"
		end

	ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER) is
 		-- ignorableWhitespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ignorableWhitespace"
		}"
		end

	initdocb_default_saxhandler (a_hdlr: POINTER) is
 		-- initdocbDefaultSAXHandler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initdocbDefaultSAXHandler"
		}"
		end

	inithtml_default_saxhandler (a_hdlr: POINTER) is
 		-- inithtmlDefaultSAXHandler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inithtmlDefaultSAXHandler"
		}"
		end

	initxml_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER) is
 		-- initxmlDefaultSAXHandler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initxmlDefaultSAXHandler"
		}"
		end

	internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- internalSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "internalSubset"
		}"
		end

	is_standalone (a_ctx: POINTER): INTEGER is
 		-- isStandalone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isStandalone"
		}"
		end

	namespace_decl (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) is
 		-- namespaceDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "namespaceDecl"
		}"
		end

	notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) is
 		-- notationDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "notationDecl"
		}"
		end

	processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) is
 		-- processingInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "processingInstruction"
		}"
		end

	reference (a_ctx: POINTER; a_name: POINTER) is
 		-- reference
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "reference"
		}"
		end

	resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER is
 		-- resolveEntity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "resolveEntity"
		}"
		end

	set_document_locator (a_ctx: POINTER; a_loc: POINTER) is
 		-- setDocumentLocator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setDocumentLocator"
		}"
		end

	set_namespace (a_ctx: POINTER; a_name: POINTER) is
 		-- setNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setNamespace"
		}"
		end

	start_document (a_ctx: POINTER) is
 		-- startDocument
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "startDocument"
		}"
		end

	start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) is
 		-- startElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "startElement"
		}"
		end

	unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) is
 		-- unparsedEntityDecl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unparsedEntityDecl"
		}"
		end


end -- class SAX_EXTERNALS
