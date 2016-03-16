-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_ENUMERATION_STRUCT
-- Wrapper of struct _xmlEnumeration defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_enumeration_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of XML_ENUMERATION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_enumeration_struct_set_next"
      }"
      end

   xml_enumeration_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of XML_ENUMERATION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_enumeration_struct_set_name"
      }"
      end

feature {} -- Low-level queries

   xml_enumeration_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of XML_ENUMERATION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_enumeration_struct_get_next"
      }"
      end

   xml_enumeration_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of XML_ENUMERATION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_enumeration_struct_get_name"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_enumeration"
               }"
               end

end -- class XML_ENUMERATION_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
