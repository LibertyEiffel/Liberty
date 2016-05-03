-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_BUFFER_STRUCT
-- Wrapper of struct _xmlBuffer defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_buffer_struct_set_content (a_structure: POINTER; a_value: POINTER) 
         -- Setter for content field of XML_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_set_content"
      }"
      end

   xml_buffer_struct_set_use (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for use field of XML_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_set_use"
      }"
      end

   xml_buffer_struct_set_size (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for size field of XML_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_set_size"
      }"
      end

   xml_buffer_struct_set_alloc (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for alloc field of XML_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_set_alloc"
      }"
      end

   xml_buffer_struct_set_contentio (a_structure: POINTER; a_value: POINTER) 
         -- Setter for contentIO field of XML_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_set_contentio"
      }"
      end

feature {} -- Low-level queries

   xml_buffer_struct_get_content (a_structure: POINTER): POINTER 
         -- Query for content field of XML_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_get_content"
      }"
      end

   xml_buffer_struct_get_use (a_structure: POINTER): NATURAL 
         -- Query for use field of XML_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_get_use"
      }"
      end

   xml_buffer_struct_get_size (a_structure: POINTER): NATURAL 
         -- Query for size field of XML_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_get_size"
      }"
      end

   xml_buffer_struct_get_alloc (a_structure: POINTER): INTEGER 
         -- Query for alloc field of XML_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_get_alloc"
      }"
      end

   xml_buffer_struct_get_contentio (a_structure: POINTER): POINTER 
         -- Query for contentIO field of XML_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_buffer_struct_get_contentio"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_buffer"
               }"
               end

end -- class XML_BUFFER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
