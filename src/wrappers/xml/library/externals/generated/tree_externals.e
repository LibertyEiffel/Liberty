-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TREE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_child (a_parent: POINTER; a_cur: POINTER): POINTER 

		-- function xmlAddChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAddChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChild"
               }"
               end

	xml_add_child_list (a_parent: POINTER; a_cur: POINTER): POINTER 

		-- function xmlAddChildList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAddChildList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChildList"
               }"
               end

	xml_add_next_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddNextSibling (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAddNextSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddNextSibling"
               }"
               end

	xml_add_prev_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddPrevSibling (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAddPrevSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddPrevSibling"
               }"
               end

	xml_add_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddSibling (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAddSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddSibling"
               }"
               end

	xml_attr_serialize_txt_content (a_buf: POINTER; a_doc: POINTER; an_attr: POINTER; a_string: POINTER) 

		-- function xmlAttrSerializeTxtContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlAttrSerializeTxtContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAttrSerializeTxtContent"
               }"
               end

	xml_buf_content (a_buf: POINTER): POINTER 

		-- function xmlBufContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufContent"
               }"
               end

	xml_buf_end (a_buf: POINTER): POINTER 

		-- function xmlBufEnd (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufEnd"
               }"
               end

	xml_buf_get_node_content (a_buf: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlBufGetNodeContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufGetNodeContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufGetNodeContent"
               }"
               end

	xml_buf_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): like size_t 

		-- function xmlBufNodeDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufNodeDump"
               }"
               end

	xml_buf_shrink (a_buf: POINTER; a_len: like size_t): like size_t 

		-- function xmlBufShrink (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufShrink"
               }"
               end

	xml_buf_use (a_buf: POINTER): like size_t 

		-- function xmlBufUse (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufUse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufUse"
               }"
               end

	xml_buffer_add (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlBufferAdd (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferAdd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAdd"
               }"
               end

	xml_buffer_add_head (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlBufferAddHead (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferAddHead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAddHead"
               }"
               end

	xml_buffer_cat (a_buf: POINTER; a_str: POINTER): INTEGER 

		-- function xmlBufferCat (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCat"
               }"
               end

	xml_buffer_ccat (a_buf: POINTER; a_str: POINTER): INTEGER 

		-- function xmlBufferCCat (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferCCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCCat"
               }"
               end

	xml_buffer_content (a_buf: POINTER): POINTER 

		-- function xmlBufferContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferContent"
               }"
               end

	xml_buffer_create: POINTER 

		-- function xmlBufferCreate (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreate()"
               }"
               end

	xml_buffer_create_size (a_size: like size_t): POINTER 

		-- function xmlBufferCreateSize (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferCreateSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateSize"
               }"
               end

	xml_buffer_create_static (a_mem: POINTER; a_size: like size_t): POINTER 

		-- function xmlBufferCreateStatic (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferCreateStatic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateStatic"
               }"
               end

	xml_buffer_detach (a_buf: POINTER): POINTER 

		-- function xmlBufferDetach (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferDetach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDetach"
               }"
               end

	xml_buffer_dump (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function xmlBufferDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDump"
               }"
               end

	xml_buffer_empty (a_buf: POINTER) 

		-- function xmlBufferEmpty (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferEmpty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferEmpty"
               }"
               end

	xml_buffer_free (a_buf: POINTER) 

		-- function xmlBufferFree (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferFree"
               }"
               end

	xml_buffer_grow (a_buf: POINTER; a_len: NATURAL): INTEGER 

		-- function xmlBufferGrow (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferGrow"
               }"
               end

	xml_buffer_length (a_buf: POINTER): INTEGER 

		-- function xmlBufferLength (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferLength
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferLength"
               }"
               end

	xml_buffer_resize (a_buf: POINTER; a_size: NATURAL): INTEGER 

		-- function xmlBufferResize (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferResize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferResize"
               }"
               end

	xml_buffer_set_allocation_scheme (a_buf: POINTER; a_scheme: INTEGER) 

		-- function xmlBufferSetAllocationScheme (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferSetAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferSetAllocationScheme"
               }"
               end

	xml_buffer_shrink (a_buf: POINTER; a_len: NATURAL): INTEGER 

		-- function xmlBufferShrink (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferShrink"
               }"
               end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) 

		-- function xmlBufferWriteChar (in `/usr/include/libxml2/libxml/tree.h')
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

		-- function xmlBufferWriteQuotedString (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBufferWriteQuotedString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferWriteQuotedString"
               }"
               end

	xml_build_qname (a_ncname: POINTER; a_prefix: POINTER; a_memory: POINTER; a_len: INTEGER): POINTER 

		-- function xmlBuildQName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlBuildQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBuildQName"
               }"
               end

	xml_child_element_count (a_parent: POINTER): like long_unsigned 

		-- function xmlChildElementCount (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlChildElementCount
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlChildElementCount"
               }"
               end

	xml_copy_doc (a_doc: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlCopyDoc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDoc"
               }"
               end

	xml_copy_dtd (a_dtd: POINTER): POINTER 

		-- function xmlCopyDtd (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDtd"
               }"
               end

	xml_copy_namespace (a_cur: POINTER): POINTER 

		-- function xmlCopyNamespace (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespace"
               }"
               end

	xml_copy_namespace_list (a_cur: POINTER): POINTER 

		-- function xmlCopyNamespaceList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyNamespaceList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespaceList"
               }"
               end

	xml_copy_node (a_node: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlCopyNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNode"
               }"
               end

	xml_copy_node_list (a_node: POINTER): POINTER 

		-- function xmlCopyNodeList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNodeList"
               }"
               end

	xml_copy_prop (a_target: POINTER; a_cur: POINTER): POINTER 

		-- function xmlCopyProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyProp"
               }"
               end

	xml_copy_prop_list (a_target: POINTER; a_cur: POINTER): POINTER 

		-- function xmlCopyPropList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCopyPropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyPropList"
               }"
               end

	xml_create_int_subset (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlCreateIntSubset (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlCreateIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateIntSubset"
               }"
               end

	xml_doc_copy_node (a_node: POINTER; a_doc: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlDocCopyNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNode"
               }"
               end

	xml_doc_copy_node_list (a_doc: POINTER; a_node: POINTER): POINTER 

		-- function xmlDocCopyNodeList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNodeList"
               }"
               end

	xml_doc_dump (a_f: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlDocDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDump"
               }"
               end

	xml_doc_dump_format_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER; a_format: INTEGER) 

		-- function xmlDocDumpFormatMemory (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocDumpFormatMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemory"
               }"
               end

	xml_doc_dump_format_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER; a_format: INTEGER) 

		-- function xmlDocDumpFormatMemoryEnc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocDumpFormatMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemoryEnc"
               }"
               end

	xml_doc_dump_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER) 

		-- function xmlDocDumpMemory (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocDumpMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemory"
               }"
               end

	xml_doc_dump_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER) 

		-- function xmlDocDumpMemoryEnc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocDumpMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemoryEnc"
               }"
               end

	xml_doc_format_dump (a_f: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlDocFormatDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocFormatDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocFormatDump"
               }"
               end

	xml_doc_get_root_element (a_doc: POINTER): POINTER 

		-- function xmlDocGetRootElement (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocGetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocGetRootElement"
               }"
               end

	xml_doc_set_root_element (a_doc: POINTER; a_root: POINTER): POINTER 

		-- function xmlDocSetRootElement (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDocSetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocSetRootElement"
               }"
               end

	xml_domwrap_adopt_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapAdoptNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapAdoptNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapAdoptNode"
               }"
               end

	xml_domwrap_clone_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_cloned_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; a_deep: INTEGER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapCloneNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapCloneNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapCloneNode"
               }"
               end

	xml_domwrap_free_ctxt (a_ctxt: POINTER) 

		-- function xmlDOMWrapFreeCtxt (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapFreeCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapFreeCtxt"
               }"
               end

	xml_domwrap_new_ctxt: POINTER 

		-- function xmlDOMWrapNewCtxt (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapNewCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapNewCtxt()"
               }"
               end

	xml_domwrap_reconcile_namespaces (a_ctxt: POINTER; an_elem: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapReconcileNamespaces (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapReconcileNamespaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapReconcileNamespaces"
               }"
               end

	xml_domwrap_remove_node (a_ctxt: POINTER; a_doc: POINTER; a_node: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapRemoveNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlDOMWrapRemoveNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapRemoveNode"
               }"
               end

	xml_elem_dump (a_f: POINTER; a_doc: POINTER; a_cur: POINTER) 

		-- function xmlElemDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlElemDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlElemDump"
               }"
               end

	xml_first_element_child (a_parent: POINTER): POINTER 

		-- function xmlFirstElementChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFirstElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFirstElementChild"
               }"
               end

	xml_free_doc (a_cur: POINTER) 

		-- function xmlFreeDoc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDoc"
               }"
               end

	xml_free_dtd (a_cur: POINTER) 

		-- function xmlFreeDtd (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDtd"
               }"
               end

	xml_free_node (a_cur: POINTER) 

		-- function xmlFreeNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNode"
               }"
               end

	xml_free_node_list (a_cur: POINTER) 

		-- function xmlFreeNodeList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNodeList"
               }"
               end

	xml_free_ns (a_cur: POINTER) 

		-- function xmlFreeNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNs"
               }"
               end

	xml_free_ns_list (a_cur: POINTER) 

		-- function xmlFreeNsList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNsList"
               }"
               end

	xml_free_prop (a_cur: POINTER) 

		-- function xmlFreeProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreeProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeProp"
               }"
               end

	xml_free_prop_list (a_cur: POINTER) 

		-- function xmlFreePropList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlFreePropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreePropList"
               }"
               end

	xml_get_buffer_allocation_scheme: INTEGER 

		-- function xmlGetBufferAllocationScheme (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetBufferAllocationScheme()"
               }"
               end

	xml_get_compress_mode: INTEGER 

		-- function xmlGetCompressMode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCompressMode()"
               }"
               end

	xml_get_doc_compress_mode (a_doc: POINTER): INTEGER 

		-- function xmlGetDocCompressMode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDocCompressMode"
               }"
               end

	xml_get_int_subset (a_doc: POINTER): POINTER 

		-- function xmlGetIntSubset (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetIntSubset"
               }"
               end

	xml_get_last_child (a_parent: POINTER): POINTER 

		-- function xmlGetLastChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetLastChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLastChild"
               }"
               end

	xml_get_line_no (a_node: POINTER): like long 

		-- function xmlGetLineNo (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetLineNo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLineNo"
               }"
               end

	xml_get_no_ns_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetNoNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetNoNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNoNsProp"
               }"
               end

	xml_get_node_path (a_node: POINTER): POINTER 

		-- function xmlGetNodePath (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetNodePath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNodePath"
               }"
               end

	xml_get_ns_list (a_doc: POINTER; a_node: POINTER): POINTER 

		-- function xmlGetNsList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsList"
               }"
               end

	xml_get_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlGetNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsProp"
               }"
               end

	xml_get_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlGetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetProp"
               }"
               end

	xml_has_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlHasNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlHasNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasNsProp"
               }"
               end

	xml_has_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlHasProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlHasProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasProp"
               }"
               end

	xml_is_blank_node (a_node: POINTER): INTEGER 

		-- function xmlIsBlankNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlIsBlankNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsBlankNode"
               }"
               end

	xml_is_xhtml (a_system_id: POINTER; a_public_id: POINTER): INTEGER 

		-- function xmlIsXHTML (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlIsXHTML
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsXHTML"
               }"
               end

	xml_last_element_child (a_parent: POINTER): POINTER 

		-- function xmlLastElementChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlLastElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLastElementChild"
               }"
               end

	xml_new_cdata_block (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewCDataBlock (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewCDataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCDataBlock"
               }"
               end

	xml_new_char_ref (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewCharRef (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewCharRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCharRef"
               }"
               end

	xml_new_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewChild"
               }"
               end

	xml_new_comment (a_content: POINTER): POINTER 

		-- function xmlNewComment (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewComment"
               }"
               end

	xml_new_doc (a_version: POINTER): POINTER 

		-- function xmlNewDoc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDoc"
               }"
               end

	xml_new_doc_comment (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocComment (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocComment"
               }"
               end

	xml_new_doc_fragment (a_doc: POINTER): POINTER 

		-- function xmlNewDocFragment (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocFragment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocFragment"
               }"
               end

	xml_new_doc_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNode"
               }"
               end

	xml_new_doc_node_eat_name (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocNodeEatName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNodeEatName"
               }"
               end

	xml_new_doc_pi (a_doc: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocPI (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocPI"
               }"
               end

	xml_new_doc_prop (a_doc: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewDocProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocProp"
               }"
               end

	xml_new_doc_raw_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocRawNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocRawNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocRawNode"
               }"
               end

	xml_new_doc_text (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocText (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocText"
               }"
               end

	xml_new_doc_text_len (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewDocTextLen (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDocTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocTextLen"
               }"
               end

	xml_new_dtd (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlNewDtd (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDtd"
               }"
               end

	xml_new_global_ns (a_doc: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlNewGlobalNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewGlobalNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewGlobalNs"
               }"
               end

	xml_new_node (a_ns: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNode"
               }"
               end

	xml_new_node_eat_name (a_ns: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewNodeEatName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNodeEatName"
               }"
               end

	xml_new_ns (a_node: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlNewNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNs"
               }"
               end

	xml_new_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsProp"
               }"
               end

	xml_new_ns_prop_eat_name (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewNsPropEatName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewNsPropEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsPropEatName"
               }"
               end

	xml_new_pi (a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewPI (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewPI"
               }"
               end

	xml_new_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewProp"
               }"
               end

	xml_new_reference (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewReference (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewReference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewReference"
               }"
               end

	xml_new_text (a_content: POINTER): POINTER 

		-- function xmlNewText (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewText"
               }"
               end

	xml_new_text_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewTextChild (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewTextChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextChild"
               }"
               end

	xml_new_text_len (a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewTextLen (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNewTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextLen"
               }"
               end

	xml_next_element_sibling (a_node: POINTER): POINTER 

		-- function xmlNextElementSibling (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNextElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNextElementSibling"
               }"
               end

	xml_node_add_content (a_cur: POINTER; a_content: POINTER) 

		-- function xmlNodeAddContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeAddContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContent"
               }"
               end

	xml_node_add_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 

		-- function xmlNodeAddContentLen (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeAddContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContentLen"
               }"
               end

	xml_node_buf_get_content (a_buffer: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlNodeBufGetContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeBufGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeBufGetContent"
               }"
               end

	xml_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): INTEGER 

		-- function xmlNodeDump (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDump"
               }"
               end

	xml_node_dump_output (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER; an_encoding: POINTER) 

		-- function xmlNodeDumpOutput (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeDumpOutput
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDumpOutput"
               }"
               end

	xml_node_get_base (a_doc: POINTER; a_cur: POINTER): POINTER 

		-- function xmlNodeGetBase (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeGetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetBase"
               }"
               end

	xml_node_get_content (a_cur: POINTER): POINTER 

		-- function xmlNodeGetContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetContent"
               }"
               end

	xml_node_get_lang (a_cur: POINTER): POINTER 

		-- function xmlNodeGetLang (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeGetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetLang"
               }"
               end

	xml_node_get_space_preserve (a_cur: POINTER): INTEGER 

		-- function xmlNodeGetSpacePreserve (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeGetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetSpacePreserve"
               }"
               end

	xml_node_is_text (a_node: POINTER): INTEGER 

		-- function xmlNodeIsText (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeIsText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeIsText"
               }"
               end

	xml_node_list_get_raw_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 

		-- function xmlNodeListGetRawString (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeListGetRawString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetRawString"
               }"
               end

	xml_node_list_get_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 

		-- function xmlNodeListGetString (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeListGetString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetString"
               }"
               end

	xml_node_set_base (a_cur: POINTER; an_uri: POINTER) 

		-- function xmlNodeSetBase (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetBase"
               }"
               end

	xml_node_set_content (a_cur: POINTER; a_content: POINTER) 

		-- function xmlNodeSetContent (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContent"
               }"
               end

	xml_node_set_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 

		-- function xmlNodeSetContentLen (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContentLen"
               }"
               end

	xml_node_set_lang (a_cur: POINTER; a_lang: POINTER) 

		-- function xmlNodeSetLang (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetLang"
               }"
               end

	xml_node_set_name (a_cur: POINTER; a_name: POINTER) 

		-- function xmlNodeSetName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetName"
               }"
               end

	xml_node_set_space_preserve (a_cur: POINTER; a_val: INTEGER) 

		-- function xmlNodeSetSpacePreserve (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlNodeSetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetSpacePreserve"
               }"
               end

	xml_previous_element_sibling (a_node: POINTER): POINTER 

		-- function xmlPreviousElementSibling (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlPreviousElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPreviousElementSibling"
               }"
               end

	xml_reconciliate_ns (a_doc: POINTER; a_tree: POINTER): INTEGER 

		-- function xmlReconciliateNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlReconciliateNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReconciliateNs"
               }"
               end

	xml_remove_prop (a_cur: POINTER): INTEGER 

		-- function xmlRemoveProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlRemoveProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveProp"
               }"
               end

	xml_replace_node (an_old: POINTER; a_cur: POINTER): POINTER 

		-- function xmlReplaceNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlReplaceNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReplaceNode"
               }"
               end

	xml_save_file (a_filename: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlSaveFile (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFile"
               }"
               end

	xml_save_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 

		-- function xmlSaveFileEnc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileEnc"
               }"
               end

	xml_save_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 

		-- function xmlSaveFileTo (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileTo"
               }"
               end

	xml_save_format_file (a_filename: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFile (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFormatFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFile"
               }"
               end

	xml_save_format_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFileEnc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFormatFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileEnc"
               }"
               end

	xml_save_format_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFileTo (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSaveFormatFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileTo"
               }"
               end

	xml_search_ns (a_doc: POINTER; a_node: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlSearchNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSearchNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNs"
               }"
               end

	xml_search_ns_by_href (a_doc: POINTER; a_node: POINTER; a_href: POINTER): POINTER 

		-- function xmlSearchNsByHref (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSearchNsByHref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNsByHref"
               }"
               end

	xml_set_buffer_allocation_scheme (a_scheme: INTEGER) 

		-- function xmlSetBufferAllocationScheme (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetBufferAllocationScheme"
               }"
               end

	xml_set_compress_mode (a_mode: INTEGER) 

		-- function xmlSetCompressMode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetCompressMode"
               }"
               end

	xml_set_doc_compress_mode (a_doc: POINTER; a_mode: INTEGER) 

		-- function xmlSetDocCompressMode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetDocCompressMode"
               }"
               end

	xml_set_list_doc (a_list: POINTER; a_doc: POINTER) 

		-- function xmlSetListDoc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetListDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetListDoc"
               }"
               end

	xml_set_ns (a_node: POINTER; a_ns: POINTER) 

		-- function xmlSetNs (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNs"
               }"
               end

	xml_set_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlSetNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNsProp"
               }"
               end

	xml_set_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlSetProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetProp"
               }"
               end

	xml_set_tree_doc (a_tree: POINTER; a_doc: POINTER) 

		-- function xmlSetTreeDoc (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSetTreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetTreeDoc"
               }"
               end

	xml_split_qname2 (a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlSplitQName2 (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSplitQName2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName2"
               }"
               end

	xml_split_qname3 (a_name: POINTER; a_len: POINTER): POINTER 

		-- function xmlSplitQName3 (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlSplitQName3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName3"
               }"
               end

	xml_string_get_node_list (a_doc: POINTER; a_value: POINTER): POINTER 

		-- function xmlStringGetNodeList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlStringGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringGetNodeList"
               }"
               end

	xml_string_len_get_node_list (a_doc: POINTER; a_value: POINTER; a_len: INTEGER): POINTER 

		-- function xmlStringLenGetNodeList (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlStringLenGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringLenGetNodeList"
               }"
               end

	xml_text_concat (a_node: POINTER; a_content: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlTextConcat (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlTextConcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextConcat"
               }"
               end

	xml_text_merge (a_first: POINTER; a_second: POINTER): POINTER 

		-- function xmlTextMerge (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlTextMerge
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextMerge"
               }"
               end

	xml_unlink_node (a_cur: POINTER) 

		-- function xmlUnlinkNode (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlUnlinkNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnlinkNode"
               }"
               end

	xml_unset_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER): INTEGER 

		-- function xmlUnsetNsProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlUnsetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetNsProp"
               }"
               end

	xml_unset_prop (a_node: POINTER; a_name: POINTER): INTEGER 

		-- function xmlUnsetProp (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlUnsetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetProp"
               }"
               end

	xml_validate_name (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlValidateName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateName"
               }"
               end

	xml_validate_ncname (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateNCName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlValidateNCName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNCName"
               }"
               end

	xml_validate_nmtoken (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateNMToken (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlValidateNMToken
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNMToken"
               }"
               end

	xml_validate_qname (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateQName (in `/usr/include/libxml2/libxml/tree.h')
               -- xmlValidateQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateQName"
               }"
               end


end -- class TREE_EXTERNALS
