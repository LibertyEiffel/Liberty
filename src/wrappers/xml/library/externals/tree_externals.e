-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class TREE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_child (a_parent: POINTER; a_cur: POINTER): POINTER 
               -- xmlAddChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChild"
               }"
               end

	xml_add_child_list (a_parent: POINTER; a_cur: POINTER): POINTER 
               -- xmlAddChildList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChildList"
               }"
               end

	xml_add_next_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 
               -- xmlAddNextSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddNextSibling"
               }"
               end

	xml_add_prev_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 
               -- xmlAddPrevSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddPrevSibling"
               }"
               end

	xml_add_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 
               -- xmlAddSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddSibling"
               }"
               end

	xml_attr_serialize_txt_content (a_buf: POINTER; a_doc: POINTER; an_attr: POINTER; a_string: POINTER) 
               -- xmlAttrSerializeTxtContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAttrSerializeTxtContent"
               }"
               end

	xml_buf_content (a_buf: POINTER): POINTER 
               -- xmlBufContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufContent"
               }"
               end

	xml_buf_end (a_buf: POINTER): POINTER 
               -- xmlBufEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufEnd"
               }"
               end

	xml_buf_get_node_content (a_buf: POINTER; a_cur: POINTER): INTEGER 
               -- xmlBufGetNodeContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufGetNodeContent"
               }"
               end

	xml_buf_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): like size_t 
               -- xmlBufNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufNodeDump"
               }"
               end

	xml_buf_shrink (a_buf: POINTER; a_len: like size_t): like size_t 
               -- xmlBufShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufShrink"
               }"
               end

	xml_buf_use (a_buf: POINTER): like size_t 
               -- xmlBufUse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufUse"
               }"
               end

	xml_buffer_add (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 
               -- xmlBufferAdd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAdd"
               }"
               end

	xml_buffer_add_head (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 
               -- xmlBufferAddHead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAddHead"
               }"
               end

	xml_buffer_cat (a_buf: POINTER; a_str: POINTER): INTEGER 
               -- xmlBufferCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCat"
               }"
               end

	xml_buffer_ccat (a_buf: POINTER; a_str: POINTER): INTEGER 
               -- xmlBufferCCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCCat"
               }"
               end

	xml_buffer_content (a_buf: POINTER): POINTER 
               -- xmlBufferContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferContent"
               }"
               end

	xml_buffer_create: POINTER 
               -- xmlBufferCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreate"
               }"
               end

	xml_buffer_create_size (a_size: like size_t): POINTER 
               -- xmlBufferCreateSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateSize"
               }"
               end

	xml_buffer_create_static (a_mem: POINTER; a_size: like size_t): POINTER 
               -- xmlBufferCreateStatic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateStatic"
               }"
               end

	xml_buffer_detach (a_buf: POINTER): POINTER 
               -- xmlBufferDetach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDetach"
               }"
               end

	xml_buffer_dump (a_file: POINTER; a_buf: POINTER): INTEGER 
               -- xmlBufferDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDump"
               }"
               end

	xml_buffer_empty (a_buf: POINTER) 
               -- xmlBufferEmpty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferEmpty"
               }"
               end

	xml_buffer_free (a_buf: POINTER) 
               -- xmlBufferFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferFree"
               }"
               end

	xml_buffer_grow (a_buf: POINTER; a_len: NATURAL): INTEGER 
               -- xmlBufferGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferGrow"
               }"
               end

	xml_buffer_length (a_buf: POINTER): INTEGER 
               -- xmlBufferLength
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferLength"
               }"
               end

	xml_buffer_resize (a_buf: POINTER; a_size: NATURAL): INTEGER 
               -- xmlBufferResize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferResize"
               }"
               end

	xml_buffer_set_allocation_scheme (a_buf: POINTER; a_scheme: INTEGER) 
               -- xmlBufferSetAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferSetAllocationScheme"
               }"
               end

	xml_buffer_shrink (a_buf: POINTER; a_len: NATURAL): INTEGER 
               -- xmlBufferShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferShrink"
               }"
               end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) 
               -- xmlBufferWriteChar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferWriteChar"
               }"
               end

	-- function xmlBufferWriteCHAR skipped as requested.
	xml_buffer_write_quoted_string (a_buf: POINTER; a_string: POINTER) 
               -- xmlBufferWriteQuotedString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferWriteQuotedString"
               }"
               end

	xml_build_qname (a_ncname: POINTER; a_prefix: POINTER; a_memory: POINTER; a_len: INTEGER): POINTER 
               -- xmlBuildQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBuildQName"
               }"
               end

	xml_child_element_count (a_parent: POINTER): like long_unsigned 
               -- xmlChildElementCount
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlChildElementCount"
               }"
               end

	xml_copy_doc (a_doc: POINTER; a_recursive: INTEGER): POINTER 
               -- xmlCopyDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDoc"
               }"
               end

	xml_copy_dtd (a_dtd: POINTER): POINTER 
               -- xmlCopyDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDtd"
               }"
               end

	xml_copy_namespace (a_cur: POINTER): POINTER 
               -- xmlCopyNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespace"
               }"
               end

	xml_copy_namespace_list (a_cur: POINTER): POINTER 
               -- xmlCopyNamespaceList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespaceList"
               }"
               end

	xml_copy_node (a_node: POINTER; a_recursive: INTEGER): POINTER 
               -- xmlCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNode"
               }"
               end

	xml_copy_node_list (a_node: POINTER): POINTER 
               -- xmlCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNodeList"
               }"
               end

	xml_copy_prop (a_target: POINTER; a_cur: POINTER): POINTER 
               -- xmlCopyProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyProp"
               }"
               end

	xml_copy_prop_list (a_target: POINTER; a_cur: POINTER): POINTER 
               -- xmlCopyPropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyPropList"
               }"
               end

	xml_create_int_subset (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 
               -- xmlCreateIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateIntSubset"
               }"
               end

	xml_doc_copy_node (a_node: POINTER; a_doc: POINTER; a_recursive: INTEGER): POINTER 
               -- xmlDocCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNode"
               }"
               end

	xml_doc_copy_node_list (a_doc: POINTER; a_node: POINTER): POINTER 
               -- xmlDocCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNodeList"
               }"
               end

	xml_doc_dump (a_f: POINTER; a_cur: POINTER): INTEGER 
               -- xmlDocDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDump"
               }"
               end

	xml_doc_dump_format_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER; a_format: INTEGER) 
               -- xmlDocDumpFormatMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemory"
               }"
               end

	xml_doc_dump_format_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER; a_format: INTEGER) 
               -- xmlDocDumpFormatMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemoryEnc"
               }"
               end

	xml_doc_dump_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER) 
               -- xmlDocDumpMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemory"
               }"
               end

	xml_doc_dump_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER) 
               -- xmlDocDumpMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemoryEnc"
               }"
               end

	xml_doc_format_dump (a_f: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 
               -- xmlDocFormatDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocFormatDump"
               }"
               end

	xml_doc_get_root_element (a_doc: POINTER): POINTER 
               -- xmlDocGetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocGetRootElement"
               }"
               end

	xml_doc_set_root_element (a_doc: POINTER; a_root: POINTER): POINTER 
               -- xmlDocSetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocSetRootElement"
               }"
               end

	xml_domwrap_adopt_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; an_options: INTEGER): INTEGER 
               -- xmlDOMWrapAdoptNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapAdoptNode"
               }"
               end

	xml_domwrap_clone_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_cloned_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; a_deep: INTEGER; an_options: INTEGER): INTEGER 
               -- xmlDOMWrapCloneNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapCloneNode"
               }"
               end

	xml_domwrap_free_ctxt (a_ctxt: POINTER) 
               -- xmlDOMWrapFreeCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapFreeCtxt"
               }"
               end

	xml_domwrap_new_ctxt: POINTER 
               -- xmlDOMWrapNewCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapNewCtxt"
               }"
               end

	xml_domwrap_reconcile_namespaces (a_ctxt: POINTER; an_elem: POINTER; an_options: INTEGER): INTEGER 
               -- xmlDOMWrapReconcileNamespaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapReconcileNamespaces"
               }"
               end

	xml_domwrap_remove_node (a_ctxt: POINTER; a_doc: POINTER; a_node: POINTER; an_options: INTEGER): INTEGER 
               -- xmlDOMWrapRemoveNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapRemoveNode"
               }"
               end

	xml_elem_dump (a_f: POINTER; a_doc: POINTER; a_cur: POINTER) 
               -- xmlElemDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlElemDump"
               }"
               end

	xml_first_element_child (a_parent: POINTER): POINTER 
               -- xmlFirstElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFirstElementChild"
               }"
               end

	xml_free_doc (a_cur: POINTER) 
               -- xmlFreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDoc"
               }"
               end

	xml_free_dtd (a_cur: POINTER) 
               -- xmlFreeDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDtd"
               }"
               end

	xml_free_node (a_cur: POINTER) 
               -- xmlFreeNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNode"
               }"
               end

	xml_free_node_list (a_cur: POINTER) 
               -- xmlFreeNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNodeList"
               }"
               end

	xml_free_ns (a_cur: POINTER) 
               -- xmlFreeNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNs"
               }"
               end

	xml_free_ns_list (a_cur: POINTER) 
               -- xmlFreeNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNsList"
               }"
               end

	xml_free_prop (a_cur: POINTER) 
               -- xmlFreeProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeProp"
               }"
               end

	xml_free_prop_list (a_cur: POINTER) 
               -- xmlFreePropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreePropList"
               }"
               end

	xml_get_buffer_allocation_scheme: INTEGER 
               -- xmlGetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetBufferAllocationScheme"
               }"
               end

	xml_get_compress_mode: INTEGER 
               -- xmlGetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCompressMode"
               }"
               end

	xml_get_doc_compress_mode (a_doc: POINTER): INTEGER 
               -- xmlGetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDocCompressMode"
               }"
               end

	xml_get_int_subset (a_doc: POINTER): POINTER 
               -- xmlGetIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetIntSubset"
               }"
               end

	xml_get_last_child (a_parent: POINTER): POINTER 
               -- xmlGetLastChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLastChild"
               }"
               end

	xml_get_line_no (a_node: POINTER): like long 
               -- xmlGetLineNo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLineNo"
               }"
               end

	xml_get_no_ns_prop (a_node: POINTER; a_name: POINTER): POINTER 
               -- xmlGetNoNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNoNsProp"
               }"
               end

	xml_get_node_path (a_node: POINTER): POINTER 
               -- xmlGetNodePath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNodePath"
               }"
               end

	xml_get_ns_list (a_doc: POINTER; a_node: POINTER): POINTER 
               -- xmlGetNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsList"
               }"
               end

	xml_get_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 
               -- xmlGetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsProp"
               }"
               end

	xml_get_prop (a_node: POINTER; a_name: POINTER): POINTER 
               -- xmlGetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetProp"
               }"
               end

	xml_has_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 
               -- xmlHasNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasNsProp"
               }"
               end

	xml_has_prop (a_node: POINTER; a_name: POINTER): POINTER 
               -- xmlHasProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasProp"
               }"
               end

	xml_is_blank_node (a_node: POINTER): INTEGER 
               -- xmlIsBlankNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsBlankNode"
               }"
               end

	xml_is_xhtml (a_system_id: POINTER; a_public_id: POINTER): INTEGER 
               -- xmlIsXHTML
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsXHTML"
               }"
               end

	xml_last_element_child (a_parent: POINTER): POINTER 
               -- xmlLastElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLastElementChild"
               }"
               end

	xml_new_cdata_block (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 
               -- xmlNewCDataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCDataBlock"
               }"
               end

	xml_new_char_ref (a_doc: POINTER; a_name: POINTER): POINTER 
               -- xmlNewCharRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCharRef"
               }"
               end

	xml_new_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewChild"
               }"
               end

	xml_new_comment (a_content: POINTER): POINTER 
               -- xmlNewComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewComment"
               }"
               end

	xml_new_doc (a_version: POINTER): POINTER 
               -- xmlNewDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDoc"
               }"
               end

	xml_new_doc_comment (a_doc: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocComment"
               }"
               end

	xml_new_doc_fragment (a_doc: POINTER): POINTER 
               -- xmlNewDocFragment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocFragment"
               }"
               end

	xml_new_doc_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNode"
               }"
               end

	xml_new_doc_node_eat_name (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNodeEatName"
               }"
               end

	xml_new_doc_pi (a_doc: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocPI"
               }"
               end

	xml_new_doc_prop (a_doc: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlNewDocProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocProp"
               }"
               end

	xml_new_doc_raw_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocRawNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocRawNode"
               }"
               end

	xml_new_doc_text (a_doc: POINTER; a_content: POINTER): POINTER 
               -- xmlNewDocText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocText"
               }"
               end

	xml_new_doc_text_len (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 
               -- xmlNewDocTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocTextLen"
               }"
               end

	xml_new_dtd (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 
               -- xmlNewDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDtd"
               }"
               end

	xml_new_global_ns (a_doc: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 
               -- xmlNewGlobalNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewGlobalNs"
               }"
               end

	xml_new_node (a_ns: POINTER; a_name: POINTER): POINTER 
               -- xmlNewNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNode"
               }"
               end

	xml_new_node_eat_name (a_ns: POINTER; a_name: POINTER): POINTER 
               -- xmlNewNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNodeEatName"
               }"
               end

	xml_new_ns (a_node: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 
               -- xmlNewNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNs"
               }"
               end

	xml_new_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlNewNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsProp"
               }"
               end

	xml_new_ns_prop_eat_name (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlNewNsPropEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsPropEatName"
               }"
               end

	xml_new_pi (a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewPI"
               }"
               end

	xml_new_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlNewProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewProp"
               }"
               end

	xml_new_reference (a_doc: POINTER; a_name: POINTER): POINTER 
               -- xmlNewReference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewReference"
               }"
               end

	xml_new_text (a_content: POINTER): POINTER 
               -- xmlNewText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewText"
               }"
               end

	xml_new_text_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 
               -- xmlNewTextChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextChild"
               }"
               end

	xml_new_text_len (a_content: POINTER; a_len: INTEGER): POINTER 
               -- xmlNewTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextLen"
               }"
               end

	xml_next_element_sibling (a_node: POINTER): POINTER 
               -- xmlNextElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNextElementSibling"
               }"
               end

	xml_node_add_content (a_cur: POINTER; a_content: POINTER) 
               -- xmlNodeAddContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContent"
               }"
               end

	xml_node_add_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 
               -- xmlNodeAddContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContentLen"
               }"
               end

	xml_node_buf_get_content (a_buffer: POINTER; a_cur: POINTER): INTEGER 
               -- xmlNodeBufGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeBufGetContent"
               }"
               end

	xml_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): INTEGER 
               -- xmlNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDump"
               }"
               end

	xml_node_dump_output (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER; an_encoding: POINTER) 
               -- xmlNodeDumpOutput
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDumpOutput"
               }"
               end

	xml_node_get_base (a_doc: POINTER; a_cur: POINTER): POINTER 
               -- xmlNodeGetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetBase"
               }"
               end

	xml_node_get_content (a_cur: POINTER): POINTER 
               -- xmlNodeGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetContent"
               }"
               end

	xml_node_get_lang (a_cur: POINTER): POINTER 
               -- xmlNodeGetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetLang"
               }"
               end

	xml_node_get_space_preserve (a_cur: POINTER): INTEGER 
               -- xmlNodeGetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetSpacePreserve"
               }"
               end

	xml_node_is_text (a_node: POINTER): INTEGER 
               -- xmlNodeIsText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeIsText"
               }"
               end

	xml_node_list_get_raw_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 
               -- xmlNodeListGetRawString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetRawString"
               }"
               end

	xml_node_list_get_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 
               -- xmlNodeListGetString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetString"
               }"
               end

	xml_node_set_base (a_cur: POINTER; an_uri: POINTER) 
               -- xmlNodeSetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetBase"
               }"
               end

	xml_node_set_content (a_cur: POINTER; a_content: POINTER) 
               -- xmlNodeSetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContent"
               }"
               end

	xml_node_set_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 
               -- xmlNodeSetContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContentLen"
               }"
               end

	xml_node_set_lang (a_cur: POINTER; a_lang: POINTER) 
               -- xmlNodeSetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetLang"
               }"
               end

	xml_node_set_name (a_cur: POINTER; a_name: POINTER) 
               -- xmlNodeSetName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetName"
               }"
               end

	xml_node_set_space_preserve (a_cur: POINTER; a_val: INTEGER) 
               -- xmlNodeSetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetSpacePreserve"
               }"
               end

	xml_previous_element_sibling (a_node: POINTER): POINTER 
               -- xmlPreviousElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPreviousElementSibling"
               }"
               end

	xml_reconciliate_ns (a_doc: POINTER; a_tree: POINTER): INTEGER 
               -- xmlReconciliateNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReconciliateNs"
               }"
               end

	xml_remove_prop (a_cur: POINTER): INTEGER 
               -- xmlRemoveProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveProp"
               }"
               end

	xml_replace_node (an_old: POINTER; a_cur: POINTER): POINTER 
               -- xmlReplaceNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReplaceNode"
               }"
               end

	xml_save_file (a_filename: POINTER; a_cur: POINTER): INTEGER 
               -- xmlSaveFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFile"
               }"
               end

	xml_save_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 
               -- xmlSaveFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileEnc"
               }"
               end

	xml_save_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 
               -- xmlSaveFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileTo"
               }"
               end

	xml_save_format_file (a_filename: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 
               -- xmlSaveFormatFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFile"
               }"
               end

	xml_save_format_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 
               -- xmlSaveFormatFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileEnc"
               }"
               end

	xml_save_format_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 
               -- xmlSaveFormatFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileTo"
               }"
               end

	xml_search_ns (a_doc: POINTER; a_node: POINTER; a_name_space: POINTER): POINTER 
               -- xmlSearchNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNs"
               }"
               end

	xml_search_ns_by_href (a_doc: POINTER; a_node: POINTER; a_href: POINTER): POINTER 
               -- xmlSearchNsByHref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNsByHref"
               }"
               end

	xml_set_buffer_allocation_scheme (a_scheme: INTEGER) 
               -- xmlSetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetBufferAllocationScheme"
               }"
               end

	xml_set_compress_mode (a_mode: INTEGER) 
               -- xmlSetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetCompressMode"
               }"
               end

	xml_set_doc_compress_mode (a_doc: POINTER; a_mode: INTEGER) 
               -- xmlSetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetDocCompressMode"
               }"
               end

	xml_set_list_doc (a_list: POINTER; a_doc: POINTER) 
               -- xmlSetListDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetListDoc"
               }"
               end

	xml_set_ns (a_node: POINTER; a_ns: POINTER) 
               -- xmlSetNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNs"
               }"
               end

	xml_set_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlSetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNsProp"
               }"
               end

	xml_set_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 
               -- xmlSetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetProp"
               }"
               end

	xml_set_tree_doc (a_tree: POINTER; a_doc: POINTER) 
               -- xmlSetTreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetTreeDoc"
               }"
               end

	xml_split_qname2 (a_name: POINTER; a_prefix: POINTER): POINTER 
               -- xmlSplitQName2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName2"
               }"
               end

	xml_split_qname3 (a_name: POINTER; a_len: POINTER): POINTER 
               -- xmlSplitQName3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName3"
               }"
               end

	xml_string_get_node_list (a_doc: POINTER; a_value: POINTER): POINTER 
               -- xmlStringGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringGetNodeList"
               }"
               end

	xml_string_len_get_node_list (a_doc: POINTER; a_value: POINTER; a_len: INTEGER): POINTER 
               -- xmlStringLenGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringLenGetNodeList"
               }"
               end

	xml_text_concat (a_node: POINTER; a_content: POINTER; a_len: INTEGER): INTEGER 
               -- xmlTextConcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextConcat"
               }"
               end

	xml_text_merge (a_first: POINTER; a_second: POINTER): POINTER 
               -- xmlTextMerge
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextMerge"
               }"
               end

	xml_unlink_node (a_cur: POINTER) 
               -- xmlUnlinkNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnlinkNode"
               }"
               end

	xml_unset_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER): INTEGER 
               -- xmlUnsetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetNsProp"
               }"
               end

	xml_unset_prop (a_node: POINTER; a_name: POINTER): INTEGER 
               -- xmlUnsetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetProp"
               }"
               end

	xml_validate_name (a_value: POINTER; a_space: INTEGER): INTEGER 
               -- xmlValidateName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateName"
               }"
               end

	xml_validate_ncname (a_value: POINTER; a_space: INTEGER): INTEGER 
               -- xmlValidateNCName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNCName"
               }"
               end

	xml_validate_nmtoken (a_value: POINTER; a_space: INTEGER): INTEGER 
               -- xmlValidateNMToken
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNMToken"
               }"
               end

	xml_validate_qname (a_value: POINTER; a_space: INTEGER): INTEGER 
               -- xmlValidateQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateQName"
               }"
               end


end -- class TREE_EXTERNALS
