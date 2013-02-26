-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TREE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_add_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddSibling (node at line 18)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddSibling"
		}"
		end

	xml_buffer_length (a_buf: POINTER): INTEGER_32 is
 		-- xmlBufferLength (node at line 22)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferLength"
		}"
		end

	xml_text_concat (a_node: POINTER; a_content: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlTextConcat (node at line 35)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlTextConcat"
		}"
		end

	xml_new_doc_text (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocText (node at line 40)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocText"
		}"
		end

	xml_last_element_child (a_parent: POINTER): POINTER is
 		-- xmlLastElementChild (node at line 44)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLastElementChild"
		}"
		end

	xml_save_format_file (a_filename: POINTER; a_cur: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFile (node at line 139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFile"
		}"
		end

	xml_buffer_empty (a_buf: POINTER) is
 		-- xmlBufferEmpty (node at line 145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferEmpty"
		}"
		end

	xml_new_ns_prop_eat_name (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewNsPropEatName (node at line 211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNsPropEatName"
		}"
		end

	xml_copy_doc (a_doc: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlCopyDoc (node at line 217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDoc"
		}"
		end

	xml_new_ns (a_node: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlNewNs (node at line 261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNs"
		}"
		end

	xml_new_pi (a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewPI (node at line 292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewPI"
		}"
		end

	xml_buffer_write_quoted_string (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteQuotedString (node at line 338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteQuotedString"
		}"
		end

	xml_validate_name (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateName (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateName"
		}"
		end

	xml_free_ns_list (a_cur: POINTER) is
 		-- xmlFreeNsList (node at line 566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNsList"
		}"
		end

	xml_new_text_len (a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewTextLen (node at line 617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewTextLen"
		}"
		end

	xml_new_doc_prop (a_doc: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewDocProp (node at line 630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocProp"
		}"
		end

	xml_new_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewNsProp (node at line 649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNsProp"
		}"
		end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteChar (node at line 1460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteChar"
		}"
		end

	xml_copy_prop (a_target: POINTER; a_cur: POINTER): POINTER is
 		-- xmlCopyProp (node at line 1467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyProp"
		}"
		end

	xml_domwrap_new_ctxt: POINTER is
 		-- xmlDOMWrapNewCtxt (node at line 1490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapNewCtxt()"
		}"
		end

	xml_new_node (a_ns: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewNode (node at line 1505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNode"
		}"
		end

	xml_doc_copy_node_list (a_doc: POINTER; a_node: POINTER): POINTER is
 		-- xmlDocCopyNodeList (node at line 1608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocCopyNodeList"
		}"
		end

	xml_buffer_grow (a_buf: POINTER; a_len: NATURAL_32): INTEGER_32 is
 		-- xmlBufferGrow (node at line 1673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferGrow"
		}"
		end

	xml_new_doc_raw_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocRawNode (node at line 1774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocRawNode"
		}"
		end

	xml_domwrap_clone_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_cloned_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; a_deep: INTEGER_32; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapCloneNode (node at line 1892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapCloneNode"
		}"
		end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteCHAR (node at line 1952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteCHAR"
		}"
		end

	xml_split_qname2 (a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlSplitQName2 (node at line 1989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSplitQName2"
		}"
		end

	xml_split_qname3 (a_name: POINTER; a_len: POINTER): POINTER is
 		-- xmlSplitQName3 (node at line 1993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSplitQName3"
		}"
		end

	xml_buffer_add_head (a_buf: POINTER; a_str: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlBufferAddHead (node at line 1998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferAddHead"
		}"
		end

	xml_node_set_base (a_cur: POINTER; an_uri: POINTER) is
 		-- xmlNodeSetBase (node at line 2010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetBase"
		}"
		end

	xml_buffer_ccat (a_buf: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlBufferCCat (node at line 2044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCCat"
		}"
		end

	xml_buffer_create_static (a_mem: POINTER; a_size: NATURAL_64): POINTER is
 		-- xmlBufferCreateStatic (node at line 2089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreateStatic"
		}"
		end

	xml_node_is_text (a_node: POINTER): INTEGER_32 is
 		-- xmlNodeIsText (node at line 2129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeIsText"
		}"
		end

	xml_node_get_base (a_doc: POINTER; a_cur: POINTER): POINTER is
 		-- xmlNodeGetBase (node at line 2226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetBase"
		}"
		end

	xml_free_doc (a_cur: POINTER) is
 		-- xmlFreeDoc (node at line 2230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDoc"
		}"
		end

	xml_search_ns (a_doc: POINTER; a_node: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlSearchNs (node at line 2238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSearchNs"
		}"
		end

	xml_domwrap_adopt_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapAdoptNode (node at line 2277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapAdoptNode"
		}"
		end

	xml_new_text_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewTextChild (node at line 2326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewTextChild"
		}"
		end

	xml_free_dtd (a_cur: POINTER) is
 		-- xmlFreeDtd (node at line 2365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDtd"
		}"
		end

	xml_new_doc_comment (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocComment (node at line 2445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocComment"
		}"
		end

	xml_domwrap_reconcile_namespaces (a_ctxt: POINTER; an_elem: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapReconcileNamespaces (node at line 2486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapReconcileNamespaces"
		}"
		end

	xml_new_text (a_content: POINTER): POINTER is
 		-- xmlNewText (node at line 2548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewText"
		}"
		end

	xml_copy_namespace (a_cur: POINTER): POINTER is
 		-- xmlCopyNamespace (node at line 2587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNamespace"
		}"
		end

	xml_doc_get_root_element (a_doc: POINTER): POINTER is
 		-- xmlDocGetRootElement (node at line 2590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocGetRootElement"
		}"
		end

	xml_buffer_create: POINTER is
 		-- xmlBufferCreate (node at line 2615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreate()"
		}"
		end

	xml_save_file (a_filename: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlSaveFile (node at line 2621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFile"
		}"
		end

	xml_new_reference (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewReference (node at line 2669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewReference"
		}"
		end

	xml_add_child_list (a_parent: POINTER; a_cur: POINTER): POINTER is
 		-- xmlAddChildList (node at line 2697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddChildList"
		}"
		end

	xml_get_int_subset (a_doc: POINTER): POINTER is
 		-- xmlGetIntSubset (node at line 2705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetIntSubset"
		}"
		end

	xml_free_node (a_cur: POINTER) is
 		-- xmlFreeNode (node at line 2726)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNode"
		}"
		end

	xml_buffer_create_size (a_size: NATURAL_64): POINTER is
 		-- xmlBufferCreateSize (node at line 2740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreateSize"
		}"
		end

	xml_reconciliate_ns (a_doc: POINTER; a_tree: POINTER): INTEGER_32 is
 		-- xmlReconciliateNs (node at line 2858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReconciliateNs"
		}"
		end

	xml_set_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlSetProp (node at line 2869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetProp"
		}"
		end

	xml_validate_ncname (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateNCName (node at line 2878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNCName"
		}"
		end

	xml_set_list_doc (a_list: POINTER; a_doc: POINTER) is
 		-- xmlSetListDoc (node at line 2893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetListDoc"
		}"
		end

	xml_replace_node (an_old: POINTER; a_cur: POINTER): POINTER is
 		-- xmlReplaceNode (node at line 2938)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReplaceNode"
		}"
		end

	xml_get_node_path (a_node: POINTER): POINTER is
 		-- xmlGetNodePath (node at line 2942)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNodePath"
		}"
		end

	xml_doc_dump_format_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER; a_format: INTEGER_32) is
 		-- xmlDocDumpFormatMemory (node at line 2995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpFormatMemory"
		}"
		end

	xml_previous_element_sibling (a_node: POINTER): POINTER is
 		-- xmlPreviousElementSibling (node at line 3002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPreviousElementSibling"
		}"
		end

	xml_node_get_content (a_cur: POINTER): POINTER is
 		-- xmlNodeGetContent (node at line 3025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetContent"
		}"
		end

	xml_node_list_get_raw_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER_32): POINTER is
 		-- xmlNodeListGetRawString (node at line 3028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeListGetRawString"
		}"
		end

	xml_save_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlSaveFileEnc (node at line 3041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFileEnc"
		}"
		end

	xml_copy_dtd (a_dtd: POINTER): POINTER is
 		-- xmlCopyDtd (node at line 3055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDtd"
		}"
		end

	xml_has_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlHasNsProp (node at line 3058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasNsProp"
		}"
		end

	xml_buffer_shrink (a_buf: POINTER; a_len: NATURAL_32): INTEGER_32 is
 		-- xmlBufferShrink (node at line 3064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferShrink"
		}"
		end

	xml_new_char_ref (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewCharRef (node at line 3068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewCharRef"
		}"
		end

	xml_node_add_content (a_cur: POINTER; a_content: POINTER) is
 		-- xmlNodeAddContent (node at line 3087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeAddContent"
		}"
		end

	xml_new_doc_fragment (a_doc: POINTER): POINTER is
 		-- xmlNewDocFragment (node at line 3132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocFragment"
		}"
		end

	xml_get_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlGetNsProp (node at line 3151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNsProp"
		}"
		end

	xml_doc_dump_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER) is
 		-- xmlDocDumpMemoryEnc (node at line 3191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpMemoryEnc"
		}"
		end

	xml_free_prop (a_cur: POINTER) is
 		-- xmlFreeProp (node at line 3204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeProp"
		}"
		end

	xml_set_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlSetNsProp (node at line 3286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetNsProp"
		}"
		end

	xml_new_doc_text_len (a_doc: POINTER; a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewDocTextLen (node at line 3308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocTextLen"
		}"
		end

	xml_string_len_get_node_list (a_doc: POINTER; a_value: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlStringLenGetNodeList (node at line 3372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStringLenGetNodeList"
		}"
		end

	xml_buffer_set_allocation_scheme (a_buf: POINTER; a_scheme: INTEGER) is
 		-- xmlBufferSetAllocationScheme (node at line 3383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferSetAllocationScheme"
		}"
		end

	xml_buffer_cat (a_buf: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlBufferCat (node at line 3422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCat"
		}"
		end

	xml_node_dump_output (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER_32; a_format: INTEGER_32; an_encoding: POINTER) is
 		-- xmlNodeDumpOutput (node at line 3438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeDumpOutput"
		}"
		end

	xml_string_get_node_list (a_doc: POINTER; a_value: POINTER): POINTER is
 		-- xmlStringGetNodeList (node at line 3453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStringGetNodeList"
		}"
		end

	xml_node_set_name (a_cur: POINTER; a_name: POINTER) is
 		-- xmlNodeSetName (node at line 3457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetName"
		}"
		end

	xml_node_add_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER_32) is
 		-- xmlNodeAddContentLen (node at line 3470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeAddContentLen"
		}"
		end

	xml_save_format_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFileEnc (node at line 3475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFileEnc"
		}"
		end

	xml_search_ns_by_href (a_doc: POINTER; a_node: POINTER; a_href: POINTER): POINTER is
 		-- xmlSearchNsByHref (node at line 3489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSearchNsByHref"
		}"
		end

	xml_node_get_space_preserve (a_cur: POINTER): INTEGER_32 is
 		-- xmlNodeGetSpacePreserve (node at line 3515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetSpacePreserve"
		}"
		end

	xml_get_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetProp (node at line 3528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetProp"
		}"
		end

	xml_doc_dump_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER) is
 		-- xmlDocDumpMemory (node at line 3595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpMemory"
		}"
		end

	xml_doc_format_dump (a_f: POINTER; a_cur: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlDocFormatDump (node at line 3645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocFormatDump"
		}"
		end

	xml_new_doc_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocNode (node at line 3682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocNode"
		}"
		end

	xml_get_last_child (a_parent: POINTER): POINTER is
 		-- xmlGetLastChild (node at line 3755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLastChild"
		}"
		end

	xml_free_ns (a_cur: POINTER) is
 		-- xmlFreeNs (node at line 3785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNs"
		}"
		end

	xml_set_doc_compress_mode (a_doc: POINTER; a_mode: INTEGER_32) is
 		-- xmlSetDocCompressMode (node at line 3788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetDocCompressMode"
		}"
		end

	xml_doc_dump_format_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER; a_format: INTEGER_32) is
 		-- xmlDocDumpFormatMemoryEnc (node at line 3837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpFormatMemoryEnc"
		}"
		end

	xml_next_element_sibling (a_node: POINTER): POINTER is
 		-- xmlNextElementSibling (node at line 3845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNextElementSibling"
		}"
		end

	xml_get_ns_list (a_doc: POINTER; a_node: POINTER): POINTER is
 		-- xmlGetNsList (node at line 3853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNsList"
		}"
		end

	xml_new_cdata_block (a_doc: POINTER; a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewCDataBlock (node at line 3908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewCDataBlock"
		}"
		end

	xml_free_prop_list (a_cur: POINTER) is
 		-- xmlFreePropList (node at line 3965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreePropList"
		}"
		end

	xml_set_ns (a_node: POINTER; a_ns: POINTER) is
 		-- xmlSetNs (node at line 4010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetNs"
		}"
		end

	xml_copy_prop_list (a_target: POINTER; a_cur: POINTER): POINTER is
 		-- xmlCopyPropList (node at line 4037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyPropList"
		}"
		end

	xml_first_element_child (a_parent: POINTER): POINTER is
 		-- xmlFirstElementChild (node at line 4053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFirstElementChild"
		}"
		end

	xml_copy_node (a_node: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlCopyNode (node at line 4130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNode"
		}"
		end

	xml_elem_dump (a_f: POINTER; a_doc: POINTER; a_cur: POINTER) is
 		-- xmlElemDump (node at line 4196)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlElemDump"
		}"
		end

	xml_new_doc_node_eat_name (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocNodeEatName (node at line 4208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocNodeEatName"
		}"
		end

	xml_save_format_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFileTo (node at line 4232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFileTo"
		}"
		end

	xml_text_merge (a_first: POINTER; a_second: POINTER): POINTER is
 		-- xmlTextMerge (node at line 4239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlTextMerge"
		}"
		end

	xml_validate_nmtoken (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateNMToken (node at line 4247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNMToken"
		}"
		end

	xml_set_buffer_allocation_scheme (a_scheme: INTEGER) is
 		-- xmlSetBufferAllocationScheme (node at line 4271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetBufferAllocationScheme"
		}"
		end

	xml_validate_qname (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateQName (node at line 4275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateQName"
		}"
		end

	xml_set_compress_mode (a_mode: INTEGER_32) is
 		-- xmlSetCompressMode (node at line 4415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetCompressMode"
		}"
		end

	xml_get_buffer_allocation_scheme: INTEGER is
 		-- xmlGetBufferAllocationScheme (node at line 4425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetBufferAllocationScheme()"
		}"
		end

	xml_is_xhtml (a_system_id: POINTER; a_public_id: POINTER): INTEGER_32 is
 		-- xmlIsXHTML (node at line 4426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsXHTML"
		}"
		end

	xml_buffer_content (a_buf: POINTER): POINTER is
 		-- xmlBufferContent (node at line 4455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferContent"
		}"
		end

	xml_has_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlHasProp (node at line 4458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasProp"
		}"
		end

	xml_new_comment (a_content: POINTER): POINTER is
 		-- xmlNewComment (node at line 4474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewComment"
		}"
		end

	xml_new_doc_pi (a_doc: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocPI (node at line 4536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocPI"
		}"
		end

	xml_build_qname (a_ncname: POINTER; a_prefix: POINTER; a_memory: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlBuildQName (node at line 4559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBuildQName"
		}"
		end

	xml_save_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlSaveFileTo (node at line 4565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFileTo"
		}"
		end

	xml_new_global_ns (a_doc: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlNewGlobalNs (node at line 4585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewGlobalNs"
		}"
		end

	xml_buffer_dump (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- xmlBufferDump (node at line 4590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferDump"
		}"
		end

	xml_unlink_node (a_cur: POINTER) is
 		-- xmlUnlinkNode (node at line 4594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnlinkNode"
		}"
		end

	xml_new_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewProp (node at line 4601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewProp"
		}"
		end

	xml_copy_node_list (a_node: POINTER): POINTER is
 		-- xmlCopyNodeList (node at line 4630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNodeList"
		}"
		end

	xml_get_no_ns_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetNoNsProp (node at line 4660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNoNsProp"
		}"
		end

	xml_domwrap_free_ctxt (a_ctxt: POINTER) is
 		-- xmlDOMWrapFreeCtxt (node at line 4715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapFreeCtxt"
		}"
		end

	xml_is_blank_node (a_node: POINTER): INTEGER_32 is
 		-- xmlIsBlankNode (node at line 4724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsBlankNode"
		}"
		end

	xml_node_set_content (a_cur: POINTER; a_content: POINTER) is
 		-- xmlNodeSetContent (node at line 4768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetContent"
		}"
		end

	xml_node_set_lang (a_cur: POINTER; a_lang: POINTER) is
 		-- xmlNodeSetLang (node at line 4796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetLang"
		}"
		end

	xml_buffer_free (a_buf: POINTER) is
 		-- xmlBufferFree (node at line 4827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferFree"
		}"
		end

	xml_doc_dump (a_f: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlDocDump (node at line 4887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDump"
		}"
		end

	xml_new_doc (a_version: POINTER): POINTER is
 		-- xmlNewDoc (node at line 4950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDoc"
		}"
		end

	xml_new_dtd (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlNewDtd (node at line 5029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDtd"
		}"
		end

	xml_add_next_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddNextSibling (node at line 5166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddNextSibling"
		}"
		end

	xml_domwrap_remove_node (a_ctxt: POINTER; a_doc: POINTER; a_node: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapRemoveNode (node at line 5197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapRemoveNode"
		}"
		end

	xml_node_list_get_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER_32): POINTER is
 		-- xmlNodeListGetString (node at line 5203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeListGetString"
		}"
		end

	xml_set_tree_doc (a_tree: POINTER; a_doc: POINTER) is
 		-- xmlSetTreeDoc (node at line 5216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetTreeDoc"
		}"
		end

	xml_get_compress_mode: INTEGER_32 is
 		-- xmlGetCompressMode (node at line 5387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetCompressMode()"
		}"
		end

	xml_unset_prop (a_node: POINTER; a_name: POINTER): INTEGER_32 is
 		-- xmlUnsetProp (node at line 5397)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnsetProp"
		}"
		end

	xml_child_element_count (a_parent: POINTER): NATURAL_64 is
 		-- xmlChildElementCount (node at line 5419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlChildElementCount"
		}"
		end

	xml_doc_set_root_element (a_doc: POINTER; a_root: POINTER): POINTER is
 		-- xmlDocSetRootElement (node at line 5546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocSetRootElement"
		}"
		end

	xml_get_doc_compress_mode (a_doc: POINTER): INTEGER_32 is
 		-- xmlGetDocCompressMode (node at line 5567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDocCompressMode"
		}"
		end

	xml_node_get_lang (a_cur: POINTER): POINTER is
 		-- xmlNodeGetLang (node at line 5570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetLang"
		}"
		end

	xml_node_set_space_preserve (a_cur: POINTER; a_val: INTEGER_32) is
 		-- xmlNodeSetSpacePreserve (node at line 5593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetSpacePreserve"
		}"
		end

	xml_node_buf_get_content (a_buffer: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlNodeBufGetContent (node at line 5599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeBufGetContent"
		}"
		end

	xml_free_node_list (a_cur: POINTER) is
 		-- xmlFreeNodeList (node at line 5645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNodeList"
		}"
		end

	xml_create_int_subset (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlCreateIntSubset (node at line 5680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateIntSubset"
		}"
		end

	xml_unset_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER): INTEGER_32 is
 		-- xmlUnsetNsProp (node at line 5692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnsetNsProp"
		}"
		end

	xml_node_set_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER_32) is
 		-- xmlNodeSetContentLen (node at line 5701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetContentLen"
		}"
		end

	xml_new_node_eat_name (a_ns: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewNodeEatName (node at line 5708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNodeEatName"
		}"
		end

	xml_new_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewChild (node at line 5725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewChild"
		}"
		end

	xml_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER_32; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlNodeDump (node at line 5766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeDump"
		}"
		end

	xml_copy_namespace_list (a_cur: POINTER): POINTER is
 		-- xmlCopyNamespaceList (node at line 5807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNamespaceList"
		}"
		end

	xml_buffer_resize (a_buf: POINTER; a_size: NATURAL_32): INTEGER_32 is
 		-- xmlBufferResize (node at line 5823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferResize"
		}"
		end

	xml_attr_serialize_txt_content (a_buf: POINTER; a_doc: POINTER; an_attr: POINTER; a_string: POINTER) is
 		-- xmlAttrSerializeTxtContent (node at line 5846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAttrSerializeTxtContent"
		}"
		end

	xml_doc_copy_node (a_node: POINTER; a_doc: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlDocCopyNode (node at line 5907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocCopyNode"
		}"
		end

	xml_add_prev_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddPrevSibling (node at line 5917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddPrevSibling"
		}"
		end

	xml_remove_prop (a_cur: POINTER): INTEGER_32 is
 		-- xmlRemoveProp (node at line 5945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveProp"
		}"
		end

	xml_buffer_add (a_buf: POINTER; a_str: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlBufferAdd (node at line 5948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferAdd"
		}"
		end

	xml_add_child (a_parent: POINTER; a_cur: POINTER): POINTER is
 		-- xmlAddChild (node at line 5957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddChild"
		}"
		end

	xml_get_line_no (a_node: POINTER): INTEGER_64 is
 		-- xmlGetLineNo (node at line 5984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLineNo"
		}"
		end


end -- class TREE_EXTERNALS
