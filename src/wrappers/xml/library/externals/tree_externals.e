-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TREE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_add_child (a_parent: POINTER; a_cur: POINTER): POINTER is
 		-- xmlAddChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddChild"
		}"
		end

	xml_add_child_list (a_parent: POINTER; a_cur: POINTER): POINTER is
 		-- xmlAddChildList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddChildList"
		}"
		end

	xml_add_next_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddNextSibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddNextSibling"
		}"
		end

	xml_add_prev_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddPrevSibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddPrevSibling"
		}"
		end

	xml_add_sibling (a_cur: POINTER; an_elem: POINTER): POINTER is
 		-- xmlAddSibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddSibling"
		}"
		end

	xml_attr_serialize_txt_content (a_buf: POINTER; a_doc: POINTER; an_attr: POINTER; a_string: POINTER) is
 		-- xmlAttrSerializeTxtContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAttrSerializeTxtContent"
		}"
		end

	xml_buffer_add (a_buf: POINTER; a_str: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlBufferAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferAdd"
		}"
		end

	xml_buffer_add_head (a_buf: POINTER; a_str: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlBufferAddHead
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferAddHead"
		}"
		end

	xml_buffer_cat (a_buf: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlBufferCat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCat"
		}"
		end

	xml_buffer_ccat (a_buf: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlBufferCCat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCCat"
		}"
		end

	xml_buffer_content (a_buf: POINTER): POINTER is
 		-- xmlBufferContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferContent"
		}"
		end

	xml_buffer_create: POINTER is
 		-- xmlBufferCreate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreate()"
		}"
		end

	xml_buffer_create_size (a_size: NATURAL_32): POINTER is
 		-- xmlBufferCreateSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreateSize"
		}"
		end

	xml_buffer_create_static (a_mem: POINTER; a_size: NATURAL_32): POINTER is
 		-- xmlBufferCreateStatic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferCreateStatic"
		}"
		end

	xml_buffer_dump (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- xmlBufferDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferDump"
		}"
		end

	xml_buffer_empty (a_buf: POINTER) is
 		-- xmlBufferEmpty
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferEmpty"
		}"
		end

	xml_buffer_free (a_buf: POINTER) is
 		-- xmlBufferFree
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferFree"
		}"
		end

	xml_buffer_grow (a_buf: POINTER; a_len: NATURAL_32): INTEGER_32 is
 		-- xmlBufferGrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferGrow"
		}"
		end

	xml_buffer_length (a_buf: POINTER): INTEGER_32 is
 		-- xmlBufferLength
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferLength"
		}"
		end

	xml_buffer_resize (a_buf: POINTER; a_size: NATURAL_32): INTEGER_32 is
 		-- xmlBufferResize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferResize"
		}"
		end

	xml_buffer_set_allocation_scheme (a_buf: POINTER; a_scheme: INTEGER) is
 		-- xmlBufferSetAllocationScheme
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferSetAllocationScheme"
		}"
		end

	xml_buffer_shrink (a_buf: POINTER; a_len: NATURAL_32): INTEGER_32 is
 		-- xmlBufferShrink
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferShrink"
		}"
		end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteCHAR
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteCHAR"
		}"
		end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteChar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteChar"
		}"
		end

	xml_buffer_write_quoted_string (a_buf: POINTER; a_string: POINTER) is
 		-- xmlBufferWriteQuotedString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBufferWriteQuotedString"
		}"
		end

	xml_build_qname (a_ncname: POINTER; a_prefix: POINTER; a_memory: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlBuildQName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlBuildQName"
		}"
		end

	xml_child_element_count (a_parent: POINTER): NATURAL_32 is
 		-- xmlChildElementCount
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlChildElementCount"
		}"
		end

	xml_copy_doc (a_doc: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlCopyDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDoc"
		}"
		end

	xml_copy_dtd (a_dtd: POINTER): POINTER is
 		-- xmlCopyDtd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyDtd"
		}"
		end

	xml_copy_namespace (a_cur: POINTER): POINTER is
 		-- xmlCopyNamespace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNamespace"
		}"
		end

	xml_copy_namespace_list (a_cur: POINTER): POINTER is
 		-- xmlCopyNamespaceList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNamespaceList"
		}"
		end

	xml_copy_node (a_node: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlCopyNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNode"
		}"
		end

	xml_copy_node_list (a_node: POINTER): POINTER is
 		-- xmlCopyNodeList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyNodeList"
		}"
		end

	xml_copy_prop (a_target: POINTER; a_cur: POINTER): POINTER is
 		-- xmlCopyProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyProp"
		}"
		end

	xml_copy_prop_list (a_target: POINTER; a_cur: POINTER): POINTER is
 		-- xmlCopyPropList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyPropList"
		}"
		end

	xml_create_int_subset (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlCreateIntSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateIntSubset"
		}"
		end

	xml_doc_copy_node (a_node: POINTER; a_doc: POINTER; a_recursive: INTEGER_32): POINTER is
 		-- xmlDocCopyNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocCopyNode"
		}"
		end

	xml_doc_copy_node_list (a_doc: POINTER; a_node: POINTER): POINTER is
 		-- xmlDocCopyNodeList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocCopyNodeList"
		}"
		end

	xml_doc_dump (a_f: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlDocDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDump"
		}"
		end

	xml_doc_dump_format_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER; a_format: INTEGER_32) is
 		-- xmlDocDumpFormatMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpFormatMemory"
		}"
		end

	xml_doc_dump_format_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER; a_format: INTEGER_32) is
 		-- xmlDocDumpFormatMemoryEnc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpFormatMemoryEnc"
		}"
		end

	xml_doc_dump_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER) is
 		-- xmlDocDumpMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpMemory"
		}"
		end

	xml_doc_dump_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER) is
 		-- xmlDocDumpMemoryEnc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocDumpMemoryEnc"
		}"
		end

	xml_doc_format_dump (a_f: POINTER; a_cur: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlDocFormatDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocFormatDump"
		}"
		end

	xml_doc_get_root_element (a_doc: POINTER): POINTER is
 		-- xmlDocGetRootElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocGetRootElement"
		}"
		end

	xml_doc_set_root_element (a_doc: POINTER; a_root: POINTER): POINTER is
 		-- xmlDocSetRootElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDocSetRootElement"
		}"
		end

	xml_domwrap_adopt_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapAdoptNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapAdoptNode"
		}"
		end

	xml_domwrap_clone_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_cloned_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; a_deep: INTEGER_32; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapCloneNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapCloneNode"
		}"
		end

	xml_domwrap_free_ctxt (a_ctxt: POINTER) is
 		-- xmlDOMWrapFreeCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapFreeCtxt"
		}"
		end

	xml_domwrap_new_ctxt: POINTER is
 		-- xmlDOMWrapNewCtxt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapNewCtxt()"
		}"
		end

	xml_domwrap_reconcile_namespaces (a_ctxt: POINTER; an_elem: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapReconcileNamespaces
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapReconcileNamespaces"
		}"
		end

	xml_domwrap_remove_node (a_ctxt: POINTER; a_doc: POINTER; a_node: POINTER; an_options: INTEGER_32): INTEGER_32 is
 		-- xmlDOMWrapRemoveNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDOMWrapRemoveNode"
		}"
		end

	xml_elem_dump (a_f: POINTER; a_doc: POINTER; a_cur: POINTER) is
 		-- xmlElemDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlElemDump"
		}"
		end

	xml_first_element_child (a_parent: POINTER): POINTER is
 		-- xmlFirstElementChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFirstElementChild"
		}"
		end

	xml_free_doc (a_cur: POINTER) is
 		-- xmlFreeDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDoc"
		}"
		end

	xml_free_dtd (a_cur: POINTER) is
 		-- xmlFreeDtd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeDtd"
		}"
		end

	xml_free_node (a_cur: POINTER) is
 		-- xmlFreeNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNode"
		}"
		end

	xml_free_node_list (a_cur: POINTER) is
 		-- xmlFreeNodeList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNodeList"
		}"
		end

	xml_free_ns (a_cur: POINTER) is
 		-- xmlFreeNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNs"
		}"
		end

	xml_free_ns_list (a_cur: POINTER) is
 		-- xmlFreeNsList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeNsList"
		}"
		end

	xml_free_prop (a_cur: POINTER) is
 		-- xmlFreeProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeProp"
		}"
		end

	xml_free_prop_list (a_cur: POINTER) is
 		-- xmlFreePropList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreePropList"
		}"
		end

	xml_get_buffer_allocation_scheme: INTEGER is
 		-- xmlGetBufferAllocationScheme
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetBufferAllocationScheme()"
		}"
		end

	xml_get_compress_mode: INTEGER_32 is
 		-- xmlGetCompressMode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetCompressMode()"
		}"
		end

	xml_get_doc_compress_mode (a_doc: POINTER): INTEGER_32 is
 		-- xmlGetDocCompressMode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDocCompressMode"
		}"
		end

	xml_get_int_subset (a_doc: POINTER): POINTER is
 		-- xmlGetIntSubset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetIntSubset"
		}"
		end

	xml_get_last_child (a_parent: POINTER): POINTER is
 		-- xmlGetLastChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLastChild"
		}"
		end

	xml_get_line_no (a_node: POINTER): INTEGER_32 is
 		-- xmlGetLineNo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetLineNo"
		}"
		end

	xml_get_no_ns_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetNoNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNoNsProp"
		}"
		end

	xml_get_node_path (a_node: POINTER): POINTER is
 		-- xmlGetNodePath
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNodePath"
		}"
		end

	xml_get_ns_list (a_doc: POINTER; a_node: POINTER): POINTER is
 		-- xmlGetNsList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNsList"
		}"
		end

	xml_get_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlGetNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetNsProp"
		}"
		end

	xml_get_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetProp"
		}"
		end

	xml_has_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlHasNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasNsProp"
		}"
		end

	xml_has_prop (a_node: POINTER; a_name: POINTER): POINTER is
 		-- xmlHasProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHasProp"
		}"
		end

	xml_is_blank_node (a_node: POINTER): INTEGER_32 is
 		-- xmlIsBlankNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsBlankNode"
		}"
		end

	xml_is_xhtml (a_system_id: POINTER; a_public_id: POINTER): INTEGER_32 is
 		-- xmlIsXHTML
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsXHTML"
		}"
		end

	xml_last_element_child (a_parent: POINTER): POINTER is
 		-- xmlLastElementChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLastElementChild"
		}"
		end

	xml_new_cdata_block (a_doc: POINTER; a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewCDataBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewCDataBlock"
		}"
		end

	xml_new_char_ref (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewCharRef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewCharRef"
		}"
		end

	xml_new_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewChild"
		}"
		end

	xml_new_comment (a_content: POINTER): POINTER is
 		-- xmlNewComment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewComment"
		}"
		end

	xml_new_doc (a_version: POINTER): POINTER is
 		-- xmlNewDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDoc"
		}"
		end

	xml_new_doc_comment (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocComment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocComment"
		}"
		end

	xml_new_doc_fragment (a_doc: POINTER): POINTER is
 		-- xmlNewDocFragment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocFragment"
		}"
		end

	xml_new_doc_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocNode"
		}"
		end

	xml_new_doc_node_eat_name (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocNodeEatName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocNodeEatName"
		}"
		end

	xml_new_doc_pi (a_doc: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocPI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocPI"
		}"
		end

	xml_new_doc_prop (a_doc: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewDocProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocProp"
		}"
		end

	xml_new_doc_raw_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocRawNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocRawNode"
		}"
		end

	xml_new_doc_text (a_doc: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewDocText
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocText"
		}"
		end

	xml_new_doc_text_len (a_doc: POINTER; a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewDocTextLen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDocTextLen"
		}"
		end

	xml_new_dtd (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER is
 		-- xmlNewDtd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewDtd"
		}"
		end

	xml_new_global_ns (a_doc: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlNewGlobalNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewGlobalNs"
		}"
		end

	xml_new_node (a_ns: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNode"
		}"
		end

	xml_new_node_eat_name (a_ns: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewNodeEatName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNodeEatName"
		}"
		end

	xml_new_ns (a_node: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlNewNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNs"
		}"
		end

	xml_new_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNsProp"
		}"
		end

	xml_new_ns_prop_eat_name (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewNsPropEatName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewNsPropEatName"
		}"
		end

	xml_new_pi (a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewPI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewPI"
		}"
		end

	xml_new_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlNewProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewProp"
		}"
		end

	xml_new_reference (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlNewReference
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewReference"
		}"
		end

	xml_new_text (a_content: POINTER): POINTER is
 		-- xmlNewText
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewText"
		}"
		end

	xml_new_text_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewTextChild
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewTextChild"
		}"
		end

	xml_new_text_len (a_content: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlNewTextLen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewTextLen"
		}"
		end

	xml_next_element_sibling (a_node: POINTER): POINTER is
 		-- xmlNextElementSibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNextElementSibling"
		}"
		end

	xml_node_add_content (a_cur: POINTER; a_content: POINTER) is
 		-- xmlNodeAddContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeAddContent"
		}"
		end

	xml_node_add_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER_32) is
 		-- xmlNodeAddContentLen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeAddContentLen"
		}"
		end

	xml_node_buf_get_content (a_buffer: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlNodeBufGetContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeBufGetContent"
		}"
		end

	xml_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER_32; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlNodeDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeDump"
		}"
		end

	xml_node_dump_output (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER_32; a_format: INTEGER_32; an_encoding: POINTER) is
 		-- xmlNodeDumpOutput
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeDumpOutput"
		}"
		end

	xml_node_get_base (a_doc: POINTER; a_cur: POINTER): POINTER is
 		-- xmlNodeGetBase
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetBase"
		}"
		end

	xml_node_get_content (a_cur: POINTER): POINTER is
 		-- xmlNodeGetContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetContent"
		}"
		end

	xml_node_get_lang (a_cur: POINTER): POINTER is
 		-- xmlNodeGetLang
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetLang"
		}"
		end

	xml_node_get_space_preserve (a_cur: POINTER): INTEGER_32 is
 		-- xmlNodeGetSpacePreserve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeGetSpacePreserve"
		}"
		end

	xml_node_is_text (a_node: POINTER): INTEGER_32 is
 		-- xmlNodeIsText
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeIsText"
		}"
		end

	xml_node_list_get_raw_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER_32): POINTER is
 		-- xmlNodeListGetRawString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeListGetRawString"
		}"
		end

	xml_node_list_get_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER_32): POINTER is
 		-- xmlNodeListGetString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeListGetString"
		}"
		end

	xml_node_set_base (a_cur: POINTER; an_uri: POINTER) is
 		-- xmlNodeSetBase
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetBase"
		}"
		end

	xml_node_set_content (a_cur: POINTER; a_content: POINTER) is
 		-- xmlNodeSetContent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetContent"
		}"
		end

	xml_node_set_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER_32) is
 		-- xmlNodeSetContentLen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetContentLen"
		}"
		end

	xml_node_set_lang (a_cur: POINTER; a_lang: POINTER) is
 		-- xmlNodeSetLang
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetLang"
		}"
		end

	xml_node_set_name (a_cur: POINTER; a_name: POINTER) is
 		-- xmlNodeSetName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetName"
		}"
		end

	xml_node_set_space_preserve (a_cur: POINTER; a_val: INTEGER_32) is
 		-- xmlNodeSetSpacePreserve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNodeSetSpacePreserve"
		}"
		end

	xml_previous_element_sibling (a_node: POINTER): POINTER is
 		-- xmlPreviousElementSibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlPreviousElementSibling"
		}"
		end

	xml_reconciliate_ns (a_doc: POINTER; a_tree: POINTER): INTEGER_32 is
 		-- xmlReconciliateNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReconciliateNs"
		}"
		end

	xml_remove_prop (a_cur: POINTER): INTEGER_32 is
 		-- xmlRemoveProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRemoveProp"
		}"
		end

	xml_replace_node (an_old: POINTER; a_cur: POINTER): POINTER is
 		-- xmlReplaceNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReplaceNode"
		}"
		end

	xml_save_file (a_filename: POINTER; a_cur: POINTER): INTEGER_32 is
 		-- xmlSaveFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFile"
		}"
		end

	xml_save_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlSaveFileEnc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFileEnc"
		}"
		end

	xml_save_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER_32 is
 		-- xmlSaveFileTo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFileTo"
		}"
		end

	xml_save_format_file (a_filename: POINTER; a_cur: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFile"
		}"
		end

	xml_save_format_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFileEnc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFileEnc"
		}"
		end

	xml_save_format_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER_32): INTEGER_32 is
 		-- xmlSaveFormatFileTo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSaveFormatFileTo"
		}"
		end

	xml_search_ns (a_doc: POINTER; a_node: POINTER; a_name_space: POINTER): POINTER is
 		-- xmlSearchNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSearchNs"
		}"
		end

	xml_search_ns_by_href (a_doc: POINTER; a_node: POINTER; a_href: POINTER): POINTER is
 		-- xmlSearchNsByHref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSearchNsByHref"
		}"
		end

	xml_set_buffer_allocation_scheme (a_scheme: INTEGER) is
 		-- xmlSetBufferAllocationScheme
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetBufferAllocationScheme"
		}"
		end

	xml_set_compress_mode (a_mode: INTEGER_32) is
 		-- xmlSetCompressMode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetCompressMode"
		}"
		end

	xml_set_doc_compress_mode (a_doc: POINTER; a_mode: INTEGER_32) is
 		-- xmlSetDocCompressMode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetDocCompressMode"
		}"
		end

	xml_set_list_doc (a_list: POINTER; a_doc: POINTER) is
 		-- xmlSetListDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetListDoc"
		}"
		end

	xml_set_ns (a_node: POINTER; a_ns: POINTER) is
 		-- xmlSetNs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetNs"
		}"
		end

	xml_set_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlSetNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetNsProp"
		}"
		end

	xml_set_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
 		-- xmlSetProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetProp"
		}"
		end

	xml_set_tree_doc (a_tree: POINTER; a_doc: POINTER) is
 		-- xmlSetTreeDoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSetTreeDoc"
		}"
		end

	xml_split_qname2 (a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlSplitQName2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSplitQName2"
		}"
		end

	xml_split_qname3 (a_name: POINTER; a_len: POINTER): POINTER is
 		-- xmlSplitQName3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlSplitQName3"
		}"
		end

	xml_string_get_node_list (a_doc: POINTER; a_value: POINTER): POINTER is
 		-- xmlStringGetNodeList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStringGetNodeList"
		}"
		end

	xml_string_len_get_node_list (a_doc: POINTER; a_value: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlStringLenGetNodeList
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStringLenGetNodeList"
		}"
		end

	xml_text_concat (a_node: POINTER; a_content: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlTextConcat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlTextConcat"
		}"
		end

	xml_text_merge (a_first: POINTER; a_second: POINTER): POINTER is
 		-- xmlTextMerge
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlTextMerge"
		}"
		end

	xml_unlink_node (a_cur: POINTER) is
 		-- xmlUnlinkNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnlinkNode"
		}"
		end

	xml_unset_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER): INTEGER_32 is
 		-- xmlUnsetNsProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnsetNsProp"
		}"
		end

	xml_unset_prop (a_node: POINTER; a_name: POINTER): INTEGER_32 is
 		-- xmlUnsetProp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnsetProp"
		}"
		end

	xml_validate_name (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateName"
		}"
		end

	xml_validate_ncname (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateNCName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNCName"
		}"
		end

	xml_validate_nmtoken (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateNMToken
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateNMToken"
		}"
		end

	xml_validate_qname (a_value: POINTER; a_space: INTEGER_32): INTEGER_32 is
 		-- xmlValidateQName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlValidateQName"
		}"
		end


end -- class TREE_EXTERNALS
