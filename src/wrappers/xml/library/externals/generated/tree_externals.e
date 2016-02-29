-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TREE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_child (a_parent: POINTER; a_cur: POINTER): POINTER 

		-- function xmlAddChild (in 942 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAddChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChild"
               }"
               end

	xml_add_child_list (a_parent: POINTER; a_cur: POINTER): POINTER 

		-- function xmlAddChildList (in 945 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAddChildList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddChildList"
               }"
               end

	xml_add_next_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddNextSibling (in 962 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAddNextSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddNextSibling"
               }"
               end

	xml_add_prev_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddPrevSibling (in 955 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAddPrevSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddPrevSibling"
               }"
               end

	xml_add_sibling (a_cur: POINTER; an_elem: POINTER): POINTER 

		-- function xmlAddSibling (in 959 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAddSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddSibling"
               }"
               end

	xml_attr_serialize_txt_content (a_buf: POINTER; a_doc: POINTER; an_attr: POINTER; a_string: POINTER) 

		-- function xmlAttrSerializeTxtContent (in 1135 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlAttrSerializeTxtContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAttrSerializeTxtContent"
               }"
               end

	xml_buf_content (a_buf: POINTER): POINTER 

		-- function xmlBufContent (in 120 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufContent"
               }"
               end

	xml_buf_end (a_buf: POINTER): POINTER 

		-- function xmlBufEnd (in 121 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufEnd"
               }"
               end

	xml_buf_get_node_content (a_buf: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlBufGetNodeContent (in 1082 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufGetNodeContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufGetNodeContent"
               }"
               end

	xml_buf_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): like size_t 

		-- function xmlBufNodeDump (in 1193 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufNodeDump"
               }"
               end

	xml_buf_shrink (a_buf: POINTER; a_len: like size_t): like size_t 

		-- function xmlBufShrink (in 123 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufShrink"
               }"
               end

	xml_buf_use (a_buf: POINTER): like size_t 

		-- function xmlBufUse (in 122 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufUse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufUse"
               }"
               end

	xml_buffer_add (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlBufferAdd (in 717 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferAdd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAdd"
               }"
               end

	xml_buffer_add_head (a_buf: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlBufferAddHead (in 721 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferAddHead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferAddHead"
               }"
               end

	xml_buffer_cat (a_buf: POINTER; a_str: POINTER): INTEGER 

		-- function xmlBufferCat (in 725 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCat"
               }"
               end

	xml_buffer_ccat (a_buf: POINTER; a_str: POINTER): INTEGER 

		-- function xmlBufferCCat (in 728 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferCCat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCCat"
               }"
               end

	xml_buffer_content (a_buf: POINTER): POINTER 

		-- function xmlBufferContent (in 739 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferContent"
               }"
               end

	xml_buffer_create: POINTER 

		-- function xmlBufferCreate (in 702 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreate"
               }"
               end

	xml_buffer_create_size (a_size: like size_t): POINTER 

		-- function xmlBufferCreateSize (in 704 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferCreateSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateSize"
               }"
               end

	xml_buffer_create_static (a_mem: POINTER; a_size: like size_t): POINTER 

		-- function xmlBufferCreateStatic (in 706 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferCreateStatic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferCreateStatic"
               }"
               end

	xml_buffer_detach (a_buf: POINTER): POINTER 

		-- function xmlBufferDetach (in 741 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferDetach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDetach"
               }"
               end

	xml_buffer_dump (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function xmlBufferDump (in 714 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferDump"
               }"
               end

	xml_buffer_empty (a_buf: POINTER) 

		-- function xmlBufferEmpty (in 737 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferEmpty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferEmpty"
               }"
               end

	xml_buffer_free (a_buf: POINTER) 

		-- function xmlBufferFree (in 712 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferFree"
               }"
               end

	xml_buffer_grow (a_buf: POINTER; a_len: NATURAL): INTEGER 

		-- function xmlBufferGrow (in 734 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferGrow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferGrow"
               }"
               end

	xml_buffer_length (a_buf: POINTER): INTEGER 

		-- function xmlBufferLength (in 746 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferLength
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferLength"
               }"
               end

	xml_buffer_resize (a_buf: POINTER; a_size: NATURAL): INTEGER 

		-- function xmlBufferResize (in 709 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferResize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferResize"
               }"
               end

	xml_buffer_set_allocation_scheme (a_buf: POINTER; a_scheme: INTEGER) 

		-- function xmlBufferSetAllocationScheme (in 743 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferSetAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferSetAllocationScheme"
               }"
               end

	xml_buffer_shrink (a_buf: POINTER; a_len: NATURAL): INTEGER 

		-- function xmlBufferShrink (in 731 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferShrink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferShrink"
               }"
               end

	xml_buffer_write_char (a_buf: POINTER; a_string: POINTER) 

		-- function xmlBufferWriteChar (in 1128 at line /usr/include/libxml2/libxml/tree.h)i
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

		-- function xmlBufferWriteQuotedString (in 1131 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBufferWriteQuotedString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBufferWriteQuotedString"
               }"
               end

	xml_build_qname (a_ncname: POINTER; a_prefix: POINTER; a_memory: POINTER; a_len: INTEGER): POINTER 

		-- function xmlBuildQName (in 681 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlBuildQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlBuildQName"
               }"
               end

	xml_child_element_count (a_parent: POINTER): like long_unsigned 

		-- function xmlChildElementCount (in 1293 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlChildElementCount
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlChildElementCount"
               }"
               end

	xml_copy_doc (a_doc: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlCopyDoc (in 820 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDoc"
               }"
               end

	xml_copy_dtd (a_dtd: POINTER): POINTER 

		-- function xmlCopyDtd (in 816 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyDtd"
               }"
               end

	xml_copy_namespace (a_cur: POINTER): POINTER 

		-- function xmlCopyNamespace (in 1005 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyNamespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespace"
               }"
               end

	xml_copy_namespace_list (a_cur: POINTER): POINTER 

		-- function xmlCopyNamespaceList (in 1007 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyNamespaceList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNamespaceList"
               }"
               end

	xml_copy_node (a_node: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlCopyNode (in 884 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNode"
               }"
               end

	xml_copy_node_list (a_node: POINTER): POINTER 

		-- function xmlCopyNodeList (in 894 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyNodeList"
               }"
               end

	xml_copy_prop (a_target: POINTER; a_cur: POINTER): POINTER 

		-- function xmlCopyProp (in 809 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyProp"
               }"
               end

	xml_copy_prop_list (a_target: POINTER; a_cur: POINTER): POINTER 

		-- function xmlCopyPropList (in 812 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCopyPropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyPropList"
               }"
               end

	xml_create_int_subset (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlCreateIntSubset (in 752 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlCreateIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateIntSubset"
               }"
               end

	xml_doc_copy_node (a_node: POINTER; a_doc: POINTER; a_recursive: INTEGER): POINTER 

		-- function xmlDocCopyNode (in 887 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocCopyNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNode"
               }"
               end

	xml_doc_copy_node_list (a_doc: POINTER; a_node: POINTER): POINTER 

		-- function xmlDocCopyNodeList (in 891 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocCopyNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocCopyNodeList"
               }"
               end

	xml_doc_dump (a_f: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlDocDump (in 1179 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDump"
               }"
               end

	xml_doc_dump_format_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER; a_format: INTEGER) 

		-- function xmlDocDumpFormatMemory (in 1155 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocDumpFormatMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemory"
               }"
               end

	xml_doc_dump_format_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER; a_format: INTEGER) 

		-- function xmlDocDumpFormatMemoryEnc (in 1169 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocDumpFormatMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpFormatMemoryEnc"
               }"
               end

	xml_doc_dump_memory (a_cur: POINTER; a_mem: POINTER; a_size: POINTER) 

		-- function xmlDocDumpMemory (in 1160 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocDumpMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemory"
               }"
               end

	xml_doc_dump_memory_enc (an_out_doc: POINTER; a_doc_txt_ptr: POINTER; a_doc_txt_len: POINTER; a_txt_encoding: POINTER) 

		-- function xmlDocDumpMemoryEnc (in 1164 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocDumpMemoryEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocDumpMemoryEnc"
               }"
               end

	xml_doc_format_dump (a_f: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlDocFormatDump (in 1175 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocFormatDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocFormatDump"
               }"
               end

	xml_doc_get_root_element (a_doc: POINTER): POINTER 

		-- function xmlDocGetRootElement (in 920 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocGetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocGetRootElement"
               }"
               end

	xml_doc_set_root_element (a_doc: POINTER; a_root: POINTER): POINTER 

		-- function xmlDocSetRootElement (in 933 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDocSetRootElement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDocSetRootElement"
               }"
               end

	xml_domwrap_adopt_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapAdoptNode (in 1266 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapAdoptNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapAdoptNode"
               }"
               end

	xml_domwrap_clone_node (a_ctxt: POINTER; a_source_doc: POINTER; a_node: POINTER; a_cloned_node: POINTER; a_dest_doc: POINTER; a_dest_parent: POINTER; a_deep: INTEGER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapCloneNode (in 1278 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapCloneNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapCloneNode"
               }"
               end

	xml_domwrap_free_ctxt (a_ctxt: POINTER) 

		-- function xmlDOMWrapFreeCtxt (in 1260 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapFreeCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapFreeCtxt"
               }"
               end

	xml_domwrap_new_ctxt: POINTER 

		-- function xmlDOMWrapNewCtxt (in 1258 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapNewCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapNewCtxt"
               }"
               end

	xml_domwrap_reconcile_namespaces (a_ctxt: POINTER; an_elem: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapReconcileNamespaces (in 1262 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapReconcileNamespaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapReconcileNamespaces"
               }"
               end

	xml_domwrap_remove_node (a_ctxt: POINTER; a_doc: POINTER; a_node: POINTER; an_options: INTEGER): INTEGER 

		-- function xmlDOMWrapRemoveNode (in 1273 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlDOMWrapRemoveNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDOMWrapRemoveNode"
               }"
               end

	xml_elem_dump (a_f: POINTER; a_doc: POINTER; a_cur: POINTER) 

		-- function xmlElemDump (in 1182 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlElemDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlElemDump"
               }"
               end

	xml_first_element_child (a_parent: POINTER): POINTER 

		-- function xmlFirstElementChild (in 1297 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFirstElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFirstElementChild"
               }"
               end

	xml_free_doc (a_cur: POINTER) 

		-- function xmlFreeDoc (in 782 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDoc"
               }"
               end

	xml_free_dtd (a_cur: POINTER) 

		-- function xmlFreeDtd (in 764 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeDtd"
               }"
               end

	xml_free_node (a_cur: POINTER) 

		-- function xmlFreeNode (in 976 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNode"
               }"
               end

	xml_free_node_list (a_cur: POINTER) 

		-- function xmlFreeNodeList (in 974 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNodeList"
               }"
               end

	xml_free_ns (a_cur: POINTER) 

		-- function xmlFreeNs (in 776 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNs"
               }"
               end

	xml_free_ns_list (a_cur: POINTER) 

		-- function xmlFreeNsList (in 778 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeNsList"
               }"
               end

	xml_free_prop (a_cur: POINTER) 

		-- function xmlFreeProp (in 807 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreeProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeProp"
               }"
               end

	xml_free_prop_list (a_cur: POINTER) 

		-- function xmlFreePropList (in 805 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlFreePropList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreePropList"
               }"
               end

	xml_get_buffer_allocation_scheme: INTEGER 

		-- function xmlGetBufferAllocationScheme (in 699 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetBufferAllocationScheme"
               }"
               end

	xml_get_compress_mode: INTEGER 

		-- function xmlGetCompressMode (in 1250 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetCompressMode"
               }"
               end

	xml_get_doc_compress_mode (a_doc: POINTER): INTEGER 

		-- function xmlGetDocCompressMode (in 1245 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDocCompressMode"
               }"
               end

	xml_get_int_subset (a_doc: POINTER): POINTER 

		-- function xmlGetIntSubset (in 762 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetIntSubset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetIntSubset"
               }"
               end

	xml_get_last_child (a_parent: POINTER): POINTER 

		-- function xmlGetLastChild (in 922 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetLastChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLastChild"
               }"
               end

	xml_get_line_no (a_node: POINTER): like long 

		-- function xmlGetLineNo (in 914 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetLineNo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetLineNo"
               }"
               end

	xml_get_no_ns_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetNoNsProp (in 1026 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetNoNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNoNsProp"
               }"
               end

	xml_get_node_path (a_node: POINTER): POINTER 

		-- function xmlGetNodePath (in 917 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetNodePath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNodePath"
               }"
               end

	xml_get_ns_list (a_doc: POINTER; a_node: POINTER): POINTER 

		-- function xmlGetNsList (in 997 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetNsList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsList"
               }"
               end

	xml_get_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlGetNsProp (in 1039 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetNsProp"
               }"
               end

	xml_get_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetProp (in 1029 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlGetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetProp"
               }"
               end

	xml_has_ns_prop (a_node: POINTER; a_name: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlHasNsProp (in 1035 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlHasNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasNsProp"
               }"
               end

	xml_has_prop (a_node: POINTER; a_name: POINTER): POINTER 

		-- function xmlHasProp (in 1032 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlHasProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHasProp"
               }"
               end

	xml_is_blank_node (a_node: POINTER): INTEGER 

		-- function xmlIsBlankNode (in 926 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlIsBlankNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsBlankNode"
               }"
               end

	xml_is_xhtml (a_system_id: POINTER; a_public_id: POINTER): INTEGER 

		-- function xmlIsXHTML (in 1238 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlIsXHTML
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsXHTML"
               }"
               end

	xml_last_element_child (a_parent: POINTER): POINTER 

		-- function xmlLastElementChild (in 1299 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlLastElementChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLastElementChild"
               }"
               end

	xml_new_cdata_block (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewCDataBlock (in 874 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewCDataBlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCDataBlock"
               }"
               end

	xml_new_char_ref (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewCharRef (in 878 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewCharRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewCharRef"
               }"
               end

	xml_new_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewChild (in 844 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewChild"
               }"
               end

	xml_new_comment (a_content: POINTER): POINTER 

		-- function xmlNewComment (in 872 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewComment"
               }"
               end

	xml_new_doc (a_version: POINTER): POINTER 

		-- function xmlNewDoc (in 780 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDoc"
               }"
               end

	xml_new_doc_comment (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocComment (in 869 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocComment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocComment"
               }"
               end

	xml_new_doc_fragment (a_doc: POINTER): POINTER 

		-- function xmlNewDocFragment (in 907 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocFragment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocFragment"
               }"
               end

	xml_new_doc_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocNode (in 827 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNode"
               }"
               end

	xml_new_doc_node_eat_name (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocNodeEatName (in 832 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocNodeEatName"
               }"
               end

	xml_new_doc_pi (a_doc: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocPI (in 855 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocPI"
               }"
               end

	xml_new_doc_prop (a_doc: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewDocProp (in 784 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocProp"
               }"
               end

	xml_new_doc_raw_node (a_doc: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocRawNode (in 902 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocRawNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocRawNode"
               }"
               end

	xml_new_doc_text (a_doc: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewDocText (in 850 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocText"
               }"
               end

	xml_new_doc_text_len (a_doc: POINTER; a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewDocTextLen (in 862 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDocTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDocTextLen"
               }"
               end

	xml_new_dtd (a_doc: POINTER; a_name: POINTER; an_external_id: POINTER; a_system_id: POINTER): POINTER 

		-- function xmlNewDtd (in 757 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewDtd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewDtd"
               }"
               end

	xml_new_global_ns (a_doc: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlNewGlobalNs (in 767 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewGlobalNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewGlobalNs"
               }"
               end

	xml_new_node (a_ns: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewNode (in 837 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNode"
               }"
               end

	xml_new_node_eat_name (a_ns: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewNodeEatName (in 840 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewNodeEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNodeEatName"
               }"
               end

	xml_new_ns (a_node: POINTER; a_href: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlNewNs (in 772 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNs"
               }"
               end

	xml_new_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewNsProp (in 795 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsProp"
               }"
               end

	xml_new_ns_prop_eat_name (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewNsPropEatName (in 800 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewNsPropEatName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewNsPropEatName"
               }"
               end

	xml_new_pi (a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewPI (in 859 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewPI
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewPI"
               }"
               end

	xml_new_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlNewProp (in 790 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewProp"
               }"
               end

	xml_new_reference (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlNewReference (in 881 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewReference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewReference"
               }"
               end

	xml_new_text (a_content: POINTER): POINTER 

		-- function xmlNewText (in 853 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewText"
               }"
               end

	xml_new_text_child (a_parent: POINTER; a_ns: POINTER; a_name: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewTextChild (in 897 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewTextChild
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextChild"
               }"
               end

	xml_new_text_len (a_content: POINTER; a_len: INTEGER): POINTER 

		-- function xmlNewTextLen (in 866 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNewTextLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewTextLen"
               }"
               end

	xml_next_element_sibling (a_node: POINTER): POINTER 

		-- function xmlNextElementSibling (in 1295 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNextElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNextElementSibling"
               }"
               end

	xml_node_add_content (a_cur: POINTER; a_content: POINTER) 

		-- function xmlNodeAddContent (in 1069 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeAddContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContent"
               }"
               end

	xml_node_add_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 

		-- function xmlNodeAddContentLen (in 1072 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeAddContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeAddContentLen"
               }"
               end

	xml_node_buf_get_content (a_buffer: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlNodeBufGetContent (in 1079 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeBufGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeBufGetContent"
               }"
               end

	xml_node_dump (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER): INTEGER 

		-- function xmlNodeDump (in 1199 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDump"
               }"
               end

	xml_node_dump_output (a_buf: POINTER; a_doc: POINTER; a_cur: POINTER; a_level: INTEGER; a_format: INTEGER; an_encoding: POINTER) 

		-- function xmlNodeDumpOutput (in 1215 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeDumpOutput
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeDumpOutput"
               }"
               end

	xml_node_get_base (a_doc: POINTER; a_cur: POINTER): POINTER 

		-- function xmlNodeGetBase (in 1098 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeGetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetBase"
               }"
               end

	xml_node_get_content (a_cur: POINTER): POINTER 

		-- function xmlNodeGetContent (in 1076 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeGetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetContent"
               }"
               end

	xml_node_get_lang (a_cur: POINTER): POINTER 

		-- function xmlNodeGetLang (in 1086 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeGetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetLang"
               }"
               end

	xml_node_get_space_preserve (a_cur: POINTER): INTEGER 

		-- function xmlNodeGetSpacePreserve (in 1088 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeGetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeGetSpacePreserve"
               }"
               end

	xml_node_is_text (a_node: POINTER): INTEGER 

		-- function xmlNodeIsText (in 924 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeIsText
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeIsText"
               }"
               end

	xml_node_list_get_raw_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 

		-- function xmlNodeListGetRawString (in 1055 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeListGetRawString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetRawString"
               }"
               end

	xml_node_list_get_string (a_doc: POINTER; a_list: POINTER; an_in_line: INTEGER): POINTER 

		-- function xmlNodeListGetString (in 1050 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeListGetString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeListGetString"
               }"
               end

	xml_node_set_base (a_cur: POINTER; an_uri: POINTER) 

		-- function xmlNodeSetBase (in 1102 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetBase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetBase"
               }"
               end

	xml_node_set_content (a_cur: POINTER; a_content: POINTER) 

		-- function xmlNodeSetContent (in 1060 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetContent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContent"
               }"
               end

	xml_node_set_content_len (a_cur: POINTER; a_content: POINTER; a_len: INTEGER) 

		-- function xmlNodeSetContentLen (in 1064 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetContentLen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetContentLen"
               }"
               end

	xml_node_set_lang (a_cur: POINTER; a_lang: POINTER) 

		-- function xmlNodeSetLang (in 1091 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetLang
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetLang"
               }"
               end

	xml_node_set_name (a_cur: POINTER; a_name: POINTER) 

		-- function xmlNodeSetName (in 938 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetName"
               }"
               end

	xml_node_set_space_preserve (a_cur: POINTER; a_val: INTEGER) 

		-- function xmlNodeSetSpacePreserve (in 1094 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlNodeSetSpacePreserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNodeSetSpacePreserve"
               }"
               end

	xml_previous_element_sibling (a_node: POINTER): POINTER 

		-- function xmlPreviousElementSibling (in 1301 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlPreviousElementSibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlPreviousElementSibling"
               }"
               end

	xml_reconciliate_ns (a_doc: POINTER; a_tree: POINTER): INTEGER 

		-- function xmlReconciliateNs (in 1146 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlReconciliateNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReconciliateNs"
               }"
               end

	xml_remove_prop (a_cur: POINTER): INTEGER 

		-- function xmlRemoveProp (in 1110 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlRemoveProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRemoveProp"
               }"
               end

	xml_replace_node (an_old: POINTER; a_cur: POINTER): POINTER 

		-- function xmlReplaceNode (in 949 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlReplaceNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlReplaceNode"
               }"
               end

	xml_save_file (a_filename: POINTER; a_cur: POINTER): INTEGER 

		-- function xmlSaveFile (in 1186 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFile"
               }"
               end

	xml_save_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 

		-- function xmlSaveFileEnc (in 1229 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileEnc"
               }"
               end

	xml_save_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER): INTEGER 

		-- function xmlSaveFileTo (in 1206 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFileTo"
               }"
               end

	xml_save_format_file (a_filename: POINTER; a_cur: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFile (in 1189 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFormatFile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFile"
               }"
               end

	xml_save_format_file_enc (a_filename: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFileEnc (in 1223 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFormatFileEnc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileEnc"
               }"
               end

	xml_save_format_file_to (a_buf: POINTER; a_cur: POINTER; an_encoding: POINTER; a_format: INTEGER): INTEGER 

		-- function xmlSaveFormatFileTo (in 1210 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSaveFormatFileTo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSaveFormatFileTo"
               }"
               end

	xml_search_ns (a_doc: POINTER; a_node: POINTER; a_name_space: POINTER): POINTER 

		-- function xmlSearchNs (in 987 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSearchNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNs"
               }"
               end

	xml_search_ns_by_href (a_doc: POINTER; a_node: POINTER; a_href: POINTER): POINTER 

		-- function xmlSearchNsByHref (in 991 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSearchNsByHref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSearchNsByHref"
               }"
               end

	xml_set_buffer_allocation_scheme (a_scheme: INTEGER) 

		-- function xmlSetBufferAllocationScheme (in 697 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetBufferAllocationScheme
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetBufferAllocationScheme"
               }"
               end

	xml_set_compress_mode (a_mode: INTEGER) 

		-- function xmlSetCompressMode (in 1252 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetCompressMode"
               }"
               end

	xml_set_doc_compress_mode (a_doc: POINTER; a_mode: INTEGER) 

		-- function xmlSetDocCompressMode (in 1247 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetDocCompressMode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetDocCompressMode"
               }"
               end

	xml_set_list_doc (a_list: POINTER; a_doc: POINTER) 

		-- function xmlSetListDoc (in 981 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetListDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetListDoc"
               }"
               end

	xml_set_ns (a_node: POINTER; a_ns: POINTER) 

		-- function xmlSetNs (in 1002 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetNs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNs"
               }"
               end

	xml_set_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlSetNsProp (in 1019 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetNsProp"
               }"
               end

	xml_set_prop (a_node: POINTER; a_name: POINTER; a_value: POINTER): POINTER 

		-- function xmlSetProp (in 1015 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetProp"
               }"
               end

	xml_set_tree_doc (a_tree: POINTER; a_doc: POINTER) 

		-- function xmlSetTreeDoc (in 978 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSetTreeDoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSetTreeDoc"
               }"
               end

	xml_split_qname2 (a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlSplitQName2 (in 686 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSplitQName2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName2"
               }"
               end

	xml_split_qname3 (a_name: POINTER; a_len: POINTER): POINTER 

		-- function xmlSplitQName3 (in 689 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlSplitQName3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlSplitQName3"
               }"
               end

	xml_string_get_node_list (a_doc: POINTER; a_value: POINTER): POINTER 

		-- function xmlStringGetNodeList (in 1043 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlStringGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringGetNodeList"
               }"
               end

	xml_string_len_get_node_list (a_doc: POINTER; a_value: POINTER; a_len: INTEGER): POINTER 

		-- function xmlStringLenGetNodeList (in 1046 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlStringLenGetNodeList
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStringLenGetNodeList"
               }"
               end

	xml_text_concat (a_node: POINTER; a_content: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlTextConcat (in 970 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlTextConcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextConcat"
               }"
               end

	xml_text_merge (a_first: POINTER; a_second: POINTER): POINTER 

		-- function xmlTextMerge (in 967 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlTextMerge
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlTextMerge"
               }"
               end

	xml_unlink_node (a_cur: POINTER) 

		-- function xmlUnlinkNode (in 965 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlUnlinkNode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnlinkNode"
               }"
               end

	xml_unset_ns_prop (a_node: POINTER; a_ns: POINTER; a_name: POINTER): INTEGER 

		-- function xmlUnsetNsProp (in 1113 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlUnsetNsProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetNsProp"
               }"
               end

	xml_unset_prop (a_node: POINTER; a_name: POINTER): INTEGER 

		-- function xmlUnsetProp (in 1117 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlUnsetProp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnsetProp"
               }"
               end

	xml_validate_name (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateName (in 673 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlValidateName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateName"
               }"
               end

	xml_validate_ncname (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateNCName (in 664 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlValidateNCName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNCName"
               }"
               end

	xml_validate_nmtoken (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateNMToken (in 676 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlValidateNMToken
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateNMToken"
               }"
               end

	xml_validate_qname (a_value: POINTER; a_space: INTEGER): INTEGER 

		-- function xmlValidateQName (in 670 at line /usr/include/libxml2/libxml/tree.h)i
               -- xmlValidateQName
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlValidateQName"
               }"
               end


end -- class TREE_EXTERNALS
