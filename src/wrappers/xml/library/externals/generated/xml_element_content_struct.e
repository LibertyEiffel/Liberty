-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_ELEMENT_CONTENT_STRUCT
-- Wrapper of struct _xmlElementContent defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_element_content_struct_set_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_type"
      }"
      end

   xml_element_content_struct_set_ocur (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ocur field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_ocur"
      }"
      end

   xml_element_content_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_name"
      }"
      end

   xml_element_content_struct_set_c1 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for c1 field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_c1"
      }"
      end

   xml_element_content_struct_set_c2 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for c2 field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_c2"
      }"
      end

   xml_element_content_struct_set_parent (a_structure: POINTER; a_value: POINTER) 
         -- Setter for parent field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_parent"
      }"
      end

   xml_element_content_struct_set_prefix (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prefix field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_set_prefix"
      }"
      end

feature {} -- Low-level queries

   xml_element_content_struct_get_type (a_structure: POINTER): INTEGER 
         -- Query for type field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_type"
      }"
      end

   xml_element_content_struct_get_ocur (a_structure: POINTER): INTEGER 
         -- Query for ocur field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_ocur"
      }"
      end

   xml_element_content_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_name"
      }"
      end

   xml_element_content_struct_get_c1 (a_structure: POINTER): POINTER 
         -- Query for c1 field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_c1"
      }"
      end

   xml_element_content_struct_get_c2 (a_structure: POINTER): POINTER 
         -- Query for c2 field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_c2"
      }"
      end

   xml_element_content_struct_get_parent (a_structure: POINTER): POINTER 
         -- Query for parent field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_parent"
      }"
      end

   xml_element_content_struct_get_prefix (a_structure: POINTER): POINTER 
         -- Query for prefix field of XML_ELEMENT_CONTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_element_content_struct_get_prefix"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_element_content"
               }"
               end

end -- class XML_ELEMENT_CONTENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
