-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_PARSER_NODE_INFO_STRUCT
-- Wrapper of struct _xmlParserNodeInfo defined in file /usr/include/libxml2/libxml/parser.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_parser_node_info_struct_set_node (a_structure: POINTER; a_value: POINTER) 
         -- Setter for node field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_set_node"
      }"
      end

   xml_parser_node_info_struct_set_begin_pos (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for begin_pos field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_set_begin_pos"
      }"
      end

   xml_parser_node_info_struct_set_begin_line (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for begin_line field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_set_begin_line"
      }"
      end

   xml_parser_node_info_struct_set_end_pos (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for end_pos field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_set_end_pos"
      }"
      end

   xml_parser_node_info_struct_set_end_line (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for end_line field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_set_end_line"
      }"
      end

feature {} -- Low-level queries

   xml_parser_node_info_struct_get_node (a_structure: POINTER): POINTER 
         -- Query for node field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_get_node"
      }"
      end

   xml_parser_node_info_struct_get_begin_pos (a_structure: POINTER): like long_unsigned 
         -- Query for begin_pos field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_get_begin_pos"
      }"
      end

   xml_parser_node_info_struct_get_begin_line (a_structure: POINTER): like long_unsigned 
         -- Query for begin_line field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_get_begin_line"
      }"
      end

   xml_parser_node_info_struct_get_end_pos (a_structure: POINTER): like long_unsigned 
         -- Query for end_pos field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_get_end_pos"
      }"
      end

   xml_parser_node_info_struct_get_end_line (a_structure: POINTER): like long_unsigned 
         -- Query for end_line field of XML_PARSER_NODE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_node_info_struct_get_end_line"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_parser_node_info"
               }"
               end

end -- class XML_PARSER_NODE_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
