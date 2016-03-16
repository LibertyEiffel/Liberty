-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_ELEMENT_STRUCT
-- Wrapper of struct _xmlElement defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_element_struct_set_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_type"
      }"
      end

   xml_element_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_name"
      }"
      end

   xml_element_struct_set_children (a_structure: POINTER; a_value: POINTER) 
         -- Setter for children field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_children"
      }"
      end

   xml_element_struct_set_last (a_structure: POINTER; a_value: POINTER) 
         -- Setter for last field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_last"
      }"
      end

   xml_element_struct_set_parent (a_structure: POINTER; a_value: POINTER) 
         -- Setter for parent field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_parent"
      }"
      end

   xml_element_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_next"
      }"
      end

   xml_element_struct_set_prev (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prev field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_prev"
      }"
      end

   xml_element_struct_set_doc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for doc field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_doc"
      }"
      end

   xml_element_struct_set_etype (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for etype field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_etype"
      }"
      end

   xml_element_struct_set_content (a_structure: POINTER; a_value: POINTER) 
         -- Setter for content field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_content"
      }"
      end

   xml_element_struct_set_attributes (a_structure: POINTER; a_value: POINTER) 
         -- Setter for attributes field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_attributes"
      }"
      end

   xml_element_struct_set_prefix (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prefix field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_prefix"
      }"
      end

   xml_element_struct_set_contmodel (a_structure: POINTER; a_value: POINTER) 
         -- Setter for contModel field of XML_ELEMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_set_contmodel"
      }"
      end

feature {} -- Low-level queries

	-- Unwrapped private field _private.
   xml_element_struct_get_type (a_structure: POINTER): INTEGER 
         -- Query for type field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_type"
      }"
      end

   xml_element_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_name"
      }"
      end

   xml_element_struct_get_children (a_structure: POINTER): POINTER 
         -- Query for children field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_children"
      }"
      end

   xml_element_struct_get_last (a_structure: POINTER): POINTER 
         -- Query for last field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_last"
      }"
      end

   xml_element_struct_get_parent (a_structure: POINTER): POINTER 
         -- Query for parent field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_parent"
      }"
      end

   xml_element_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_next"
      }"
      end

   xml_element_struct_get_prev (a_structure: POINTER): POINTER 
         -- Query for prev field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_prev"
      }"
      end

   xml_element_struct_get_doc (a_structure: POINTER): POINTER 
         -- Query for doc field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_doc"
      }"
      end

   xml_element_struct_get_etype (a_structure: POINTER): INTEGER 
         -- Query for etype field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_etype"
      }"
      end

   xml_element_struct_get_content (a_structure: POINTER): POINTER 
         -- Query for content field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_content"
      }"
      end

   xml_element_struct_get_attributes (a_structure: POINTER): POINTER 
         -- Query for attributes field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_attributes"
      }"
      end

   xml_element_struct_get_prefix (a_structure: POINTER): POINTER 
         -- Query for prefix field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_prefix"
      }"
      end

   xml_element_struct_get_contmodel (a_structure: POINTER): POINTER 
         -- Query for contModel field of XML_ELEMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_struct_get_contmodel"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_element"
               }"
               end

end -- class XML_ELEMENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
