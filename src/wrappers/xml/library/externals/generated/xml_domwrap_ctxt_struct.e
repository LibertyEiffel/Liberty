-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_DOMWRAP_CTXT_STRUCT
-- Wrapper of struct _xmlDOMWrapCtxt defined in file /usr/include/libxml2/libxml/tree.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_domwrap_ctxt_struct_set_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_set_type"
      }"
      end

   xml_domwrap_ctxt_struct_set_namespacemap (a_structure: POINTER; a_value: POINTER) 
         -- Setter for namespaceMap field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_set_namespacemap"
      }"
      end

   xml_domwrap_ctxt_struct_set_getnsfornodefunc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for getNsForNodeFunc field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_set_getnsfornodefunc"
      }"
      end

feature {} -- Low-level queries

	-- Unwrapped private field _private.
   xml_domwrap_ctxt_struct_get_type (a_structure: POINTER): INTEGER 
         -- Query for type field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_get_type"
      }"
      end

   xml_domwrap_ctxt_struct_get_namespacemap (a_structure: POINTER): POINTER 
         -- Query for namespaceMap field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_get_namespacemap"
      }"
      end

   xml_domwrap_ctxt_struct_get_getnsfornodefunc (a_structure: POINTER): POINTER 
         -- Query for getNsForNodeFunc field of XML_DOMWRAP_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_domwrap_ctxt_struct_get_getnsfornodefunc"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_domwrap_ctxt"
               }"
               end

end -- class XML_DOMWRAP_CTXT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
