deferred class LIBXML2_EXTERNALS
	-- Minimal low-level class to bootstrap eiffel-gcc-xml. This class
	-- provides minimal wrapping of xml in order to get a working
	-- eiffel-gcc-xml which can process gccxml output and produce full
	-- low-level wrapper classes for any C library.

inherit ANY undefine copy, is_equal end 

feature {} -- Externals
	xml_node_list_get_string(a_doc,a_cur: POINTER; an_int: INTEGER_32): POINTER
		-- xmlNodeListGetString
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlNodeListGetString"
		}"
	end

	xml_free (a_ptr: POINTER)
		-- xmlFree
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlFree"
		}"
	end

	xml_parse_file (a_name: POINTER): POINTER
		-- doc = xmlParseFile(docname);
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlParseFile"
		}"
	end

	xml_doc_get_root_element (a_doc: POINTER): POINTER
		-- cur = xmlDocGetRootElement(doc);
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlDocGetRootElement"
		}"
	end

	xml_free_doc (a_doc: POINTER)
		-- xmlFreeDoc(doc);
		external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlFreeDoc"
		}"
	end

	xml_str_cmp (a_str, another: POINTER): INTEGER_32
		-- xmlStrcmp(cur->name, (const xmlChar *) "story"))
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlStrcmp"
		}"
	end

	xml_get_prop (a_node, a_name: POINTER): POINTER
		-- uri = xmlGetProp(cur, "uri");
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xmlGetProp"
		}"
	end

feature {} -- xmlNode structure accessing
	-- TODO: Accessing xmlNode structure fields
	-- xmlNodePtr fields: name, xmlChildrenNode, next
	xml_node_get_name (a_node: POINTER): POINTER
		-- xmlNode->name
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_name"
		}"
	end

	xml_node_get_children (a_node: POINTER): POINTER
		-- xmlNode->children
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_children"
		}"
	end

	xml_node_get_last (a_node: POINTER): POINTER
		-- xmlNode->last
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_last"
		}"
	end

	xml_node_get_parent (a_node: POINTER): POINTER
		-- xmlNode->parent
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_parent"
		}"
	end

	xml_node_get_next (a_node: POINTER): POINTER
		-- xmlNode->next
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_next"
		}"
	end

	xml_node_get_prev (a_node: POINTER): POINTER
		-- xmlNode->prev
	external "plug_in"
	alias "{
		location: "${eiffel_libraries}/plugins"
		module_name: "xml"
		feature_name: "xml_node_get_prev"
		}"
	end

feature {} 

end -- class LIBXML_EXTERNALS
