-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_ERROR_STRUCT
-- Wrapper of struct _xmlError defined in file /usr/include/libxml2/libxml/xmlerror.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_error_struct_set_domain (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for domain field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_domain"
      }"
      end

   xml_error_struct_set_code (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for code field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_code"
      }"
      end

   xml_error_struct_set_message (a_structure: POINTER; a_value: POINTER) 
         -- Setter for message field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_message"
      }"
      end

   xml_error_struct_set_level (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for level field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_level"
      }"
      end

   xml_error_struct_set_file (a_structure: POINTER; a_value: POINTER) 
         -- Setter for file field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_file"
      }"
      end

   xml_error_struct_set_line (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for line field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_line"
      }"
      end

   xml_error_struct_set_str1 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for str1 field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_str1"
      }"
      end

   xml_error_struct_set_str2 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for str2 field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_str2"
      }"
      end

   xml_error_struct_set_str3 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for str3 field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_str3"
      }"
      end

   xml_error_struct_set_int1 (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for int1 field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_int1"
      }"
      end

   xml_error_struct_set_int2 (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for int2 field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_int2"
      }"
      end

   xml_error_struct_set_ctxt (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ctxt field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_ctxt"
      }"
      end

   xml_error_struct_set_node (a_structure: POINTER; a_value: POINTER) 
         -- Setter for node field of XML_ERROR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_set_node"
      }"
      end

feature {} -- Low-level queries

   xml_error_struct_get_domain (a_structure: POINTER): INTEGER 
         -- Query for domain field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_domain"
      }"
      end

   xml_error_struct_get_code (a_structure: POINTER): INTEGER 
         -- Query for code field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_code"
      }"
      end

   xml_error_struct_get_message (a_structure: POINTER): POINTER 
         -- Query for message field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_message"
      }"
      end

   xml_error_struct_get_level (a_structure: POINTER): INTEGER 
         -- Query for level field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_level"
      }"
      end

   xml_error_struct_get_file (a_structure: POINTER): POINTER 
         -- Query for file field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_file"
      }"
      end

   xml_error_struct_get_line (a_structure: POINTER): INTEGER 
         -- Query for line field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_line"
      }"
      end

   xml_error_struct_get_str1 (a_structure: POINTER): POINTER 
         -- Query for str1 field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_str1"
      }"
      end

   xml_error_struct_get_str2 (a_structure: POINTER): POINTER 
         -- Query for str2 field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_str2"
      }"
      end

   xml_error_struct_get_str3 (a_structure: POINTER): POINTER 
         -- Query for str3 field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_str3"
      }"
      end

   xml_error_struct_get_int1 (a_structure: POINTER): INTEGER 
         -- Query for int1 field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_int1"
      }"
      end

   xml_error_struct_get_int2 (a_structure: POINTER): INTEGER 
         -- Query for int2 field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_int2"
      }"
      end

   xml_error_struct_get_ctxt (a_structure: POINTER): POINTER 
         -- Query for ctxt field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_ctxt"
      }"
      end

   xml_error_struct_get_node (a_structure: POINTER): POINTER 
         -- Query for node field of XML_ERROR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_error_struct_get_node"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_error"
               }"
               end

end -- class XML_ERROR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
