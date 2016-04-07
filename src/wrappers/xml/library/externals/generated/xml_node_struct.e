-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_NODE_STRUCT
-- Wrapper of struct _xmlNode defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_node_struct_set_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_type"
      }"
      end

   xml_node_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_name"
      }"
      end

   xml_node_struct_set_children (a_structure: POINTER; a_value: POINTER) 
         -- Setter for children field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_children"
      }"
      end

   xml_node_struct_set_last (a_structure: POINTER; a_value: POINTER) 
         -- Setter for last field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_last"
      }"
      end

   xml_node_struct_set_parent (a_structure: POINTER; a_value: POINTER) 
         -- Setter for parent field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_parent"
      }"
      end

   xml_node_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_next"
      }"
      end

   xml_node_struct_set_prev (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prev field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_prev"
      }"
      end

   xml_node_struct_set_doc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for doc field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_doc"
      }"
      end

   xml_node_struct_set_ns (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ns field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_ns"
      }"
      end

   xml_node_struct_set_content (a_structure: POINTER; a_value: POINTER) 
         -- Setter for content field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_content"
      }"
      end

   xml_node_struct_set_properties (a_structure: POINTER; a_value: POINTER) 
         -- Setter for properties field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_properties"
      }"
      end

   xml_node_struct_set_nsdef (a_structure: POINTER; a_value: POINTER) 
         -- Setter for nsDef field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_nsdef"
      }"
      end

   xml_node_struct_set_psvi (a_structure: POINTER; a_value: POINTER) 
         -- Setter for psvi field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_psvi"
      }"
      end

   xml_node_struct_set_line (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for line field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_line"
      }"
      end

   xml_node_struct_set_extra (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for extra field of XML_NODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_set_extra"
      }"
      end

feature {} -- Low-level queries

	-- Unwrapped private field _private.
   xml_node_struct_get_type (a_structure: POINTER): INTEGER 
         -- Query for type field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_type"
      }"
      end

   xml_node_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_name"
      }"
      end

   xml_node_struct_get_children (a_structure: POINTER): POINTER 
         -- Query for children field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_children"
      }"
      end

   xml_node_struct_get_last (a_structure: POINTER): POINTER 
         -- Query for last field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_last"
      }"
      end

   xml_node_struct_get_parent (a_structure: POINTER): POINTER 
         -- Query for parent field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_parent"
      }"
      end

   xml_node_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_next"
      }"
      end

   xml_node_struct_get_prev (a_structure: POINTER): POINTER 
         -- Query for prev field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_prev"
      }"
      end

   xml_node_struct_get_doc (a_structure: POINTER): POINTER 
         -- Query for doc field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_doc"
      }"
      end

   xml_node_struct_get_ns (a_structure: POINTER): POINTER 
         -- Query for ns field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_ns"
      }"
      end

   xml_node_struct_get_content (a_structure: POINTER): POINTER 
         -- Query for content field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_content"
      }"
      end

   xml_node_struct_get_properties (a_structure: POINTER): POINTER 
         -- Query for properties field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_properties"
      }"
      end

   xml_node_struct_get_nsdef (a_structure: POINTER): POINTER 
         -- Query for nsDef field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_nsdef"
      }"
      end

   xml_node_struct_get_psvi (a_structure: POINTER): POINTER 
         -- Query for psvi field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_psvi"
      }"
      end

   xml_node_struct_get_line (a_structure: POINTER): NATURAL_16 
         -- Query for line field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_line"
      }"
      end

   xml_node_struct_get_extra (a_structure: POINTER): NATURAL_16 
         -- Query for extra field of XML_NODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_node_struct_get_extra"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_node"
               }"
               end

end -- class XML_NODE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
