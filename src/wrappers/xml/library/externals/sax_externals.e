-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SAX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	element_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER_32; a_content: POINTER) is
 		-- elementDecl (node at line 163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "elementDecl"
		}"
		end

	set_namespace (a_ctx: POINTER; a_name: POINTER) is
 		-- setNamespace (node at line 173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setNamespace"
		}"
		end

	ignorable_whitespace (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER_32) is
 		-- ignorableWhitespace (node at line 247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ignorableWhitespace"
		}"
		end

	initdocb_default_saxhandler (a_hdlr: POINTER) is
 		-- initdocbDefaultSAXHandler (node at line 389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initdocbDefaultSAXHandler"
		}"
		end

	has_external_subset (a_ctx: POINTER): INTEGER_32 is
 		-- hasExternalSubset (node at line 661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hasExternalSubset"
		}"
		end

	reference (a_ctx: POINTER; a_name: POINTER) is
 		-- reference (node at line 1636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "reference"
		}"
		end

	cdata_block (a_ctx: POINTER; a_value: POINTER; a_len: INTEGER_32) is
 		-- cdataBlock (node at line 1686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cdataBlock"
		}"
		end

	get_namespace (a_ctx: POINTER): POINTER is
 		-- getNamespace (node at line 1930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getNamespace"
		}"
		end

	unparsed_entity_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER; a_notation_name: POINTER) is
 		-- unparsedEntityDecl (node at line 2017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unparsedEntityDecl"
		}"
		end

	notation_decl (a_ctx: POINTER; a_name: POINTER; a_public_id: POINTER; a_system_id: POINTER) is
 		-- notationDecl (node at line 2117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "notationDecl"
		}"
		end

	entity_decl (a_ctx: POINTER; a_name: POINTER; a_type: INTEGER_32; a_public_id: POINTER; a_system_id: POINTER; a_content: POINTER) is
 		-- entityDecl (node at line 2179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "entityDecl"
		}"
		end

	is_standalone (a_ctx: POINTER): INTEGER_32 is
 		-- isStandalone (node at line 2243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isStandalone"
		}"
		end

	attribute_decl (a_ctx: POINTER; an_elem: POINTER; a_fullname: POINTER; a_type: INTEGER_32; a_def: INTEGER_32; a_default_value: POINTER; a_tree: POINTER) is
 		-- attributeDecl (node at line 2253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "attributeDecl"
		}"
		end

	global_namespace (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) is
 		-- globalNamespace (node at line 2368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "globalNamespace"
		}"
		end

	get_parameter_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- getParameterEntity (node at line 2494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getParameterEntity"
		}"
		end

	end_document (a_ctx: POINTER) is
 		-- endDocument (node at line 2499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endDocument"
		}"
		end

	get_system_id (a_ctx: POINTER): POINTER is
 		-- getSystemId (node at line 2539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getSystemId"
		}"
		end

	get_entity (a_ctx: POINTER; a_name: POINTER): POINTER is
 		-- getEntity (node at line 2543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getEntity"
		}"
		end

	start_element (a_ctx: POINTER; a_fullname: POINTER; an_atts: POINTER) is
 		-- startElement (node at line 2658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "startElement"
		}"
		end

	namespace_decl (a_ctx: POINTER; a_href: POINTER; a_prefix: POINTER) is
 		-- namespaceDecl (node at line 3160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "namespaceDecl"
		}"
		end

	set_document_locator (a_ctx: POINTER; a_loc: POINTER) is
 		-- setDocumentLocator (node at line 3197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setDocumentLocator"
		}"
		end

	attribute_external (a_ctx: POINTER; a_fullname: POINTER; a_value: POINTER) is
 		-- attribute (node at line 3277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "attribute"
		}"
		end

	comment (a_ctx: POINTER; a_value: POINTER) is
 		-- comment (node at line 3626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "comment"
		}"
		end

	get_column_number (a_ctx: POINTER): INTEGER_32 is
 		-- getColumnNumber (node at line 4440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getColumnNumber"
		}"
		end

	check_namespace (a_ctx: POINTER; a_name_space: POINTER): INTEGER_32 is
 		-- checkNamespace (node at line 4445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "checkNamespace"
		}"
		end

	external_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- externalSubset (node at line 4612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "externalSubset"
		}"
		end

	get_public_id (a_ctx: POINTER): POINTER is
 		-- getPublicId (node at line 4741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getPublicId"
		}"
		end

	inithtml_default_saxhandler (a_hdlr: POINTER) is
 		-- inithtmlDefaultSAXHandler (node at line 4752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inithtmlDefaultSAXHandler"
		}"
		end

	internal_subset (a_ctx: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER) is
 		-- internalSubset (node at line 4953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "internalSubset"
		}"
		end

	start_document (a_ctx: POINTER) is
 		-- startDocument (node at line 5035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "startDocument"
		}"
		end

	get_line_number (a_ctx: POINTER): INTEGER_32 is
 		-- getLineNumber (node at line 5173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getLineNumber"
		}"
		end

	resolve_entity (a_ctx: POINTER; a_public_id: POINTER; a_system_id: POINTER): POINTER is
 		-- resolveEntity (node at line 5440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "resolveEntity"
		}"
		end

	initxml_default_saxhandler (a_hdlr: POINTER; a_warning: INTEGER_32) is
 		-- initxmlDefaultSAXHandler (node at line 5515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initxmlDefaultSAXHandler"
		}"
		end

	processing_instruction (a_ctx: POINTER; a_target: POINTER; a_data: POINTER) is
 		-- processingInstruction (node at line 5662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "processingInstruction"
		}"
		end

	characters (a_ctx: POINTER; a_ch: POINTER; a_len: INTEGER_32) is
 		-- characters (node at line 5686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "characters"
		}"
		end

	end_element (a_ctx: POINTER; a_name: POINTER) is
 		-- endElement (node at line 5697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endElement"
		}"
		end

	has_internal_subset (a_ctx: POINTER): INTEGER_32 is
 		-- hasInternalSubset (node at line 6007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hasInternalSubset"
		}"
		end


end -- class SAX_EXTERNALS
