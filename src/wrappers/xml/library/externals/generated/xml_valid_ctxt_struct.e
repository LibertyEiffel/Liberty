-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_VALID_CTXT_STRUCT
-- Wrapper of struct _xmlValidCtxt defined in file /usr/include/libxml2/libxml/valid.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_valid_ctxt_struct_set_userdata (a_structure: POINTER; a_value: POINTER) 
         -- Setter for userData field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_userdata"
      }"
      end

   xml_valid_ctxt_struct_set_error (a_structure: POINTER; a_value: POINTER) 
         -- Setter for error field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_error"
      }"
      end

   xml_valid_ctxt_struct_set_warning (a_structure: POINTER; a_value: POINTER) 
         -- Setter for warning field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_warning"
      }"
      end

   xml_valid_ctxt_struct_set_node (a_structure: POINTER; a_value: POINTER) 
         -- Setter for node field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_node"
      }"
      end

   xml_valid_ctxt_struct_set_nodenr (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nodeNr field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_nodenr"
      }"
      end

   xml_valid_ctxt_struct_set_nodemax (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nodeMax field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_nodemax"
      }"
      end

   xml_valid_ctxt_struct_set_nodetab (a_structure: POINTER; a_value: POINTER) 
         -- Setter for nodeTab field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_nodetab"
      }"
      end

   xml_valid_ctxt_struct_set_finishdtd (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for finishDtd field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_finishdtd"
      }"
      end

   xml_valid_ctxt_struct_set_doc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for doc field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_doc"
      }"
      end

   xml_valid_ctxt_struct_set_valid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for valid field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_valid"
      }"
      end

   xml_valid_ctxt_struct_set_vstate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for vstate field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_vstate"
      }"
      end

   xml_valid_ctxt_struct_set_vstatenr (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for vstateNr field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_vstatenr"
      }"
      end

   xml_valid_ctxt_struct_set_vstatemax (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for vstateMax field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_vstatemax"
      }"
      end

   xml_valid_ctxt_struct_set_vstatetab (a_structure: POINTER; a_value: POINTER) 
         -- Setter for vstateTab field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_vstatetab"
      }"
      end

   xml_valid_ctxt_struct_set_am (a_structure: POINTER; a_value: POINTER) 
         -- Setter for am field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_am"
      }"
      end

   xml_valid_ctxt_struct_set_state (a_structure: POINTER; a_value: POINTER) 
         -- Setter for state field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_set_state"
      }"
      end

feature {} -- Low-level queries

   xml_valid_ctxt_struct_get_userdata (a_structure: POINTER): POINTER 
         -- Query for userData field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_userdata"
      }"
      end

   xml_valid_ctxt_struct_get_error (a_structure: POINTER): POINTER 
         -- Query for error field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_error"
      }"
      end

   xml_valid_ctxt_struct_get_warning (a_structure: POINTER): POINTER 
         -- Query for warning field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_warning"
      }"
      end

   xml_valid_ctxt_struct_get_node (a_structure: POINTER): POINTER 
         -- Query for node field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_node"
      }"
      end

   xml_valid_ctxt_struct_get_nodenr (a_structure: POINTER): INTEGER 
         -- Query for nodeNr field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_nodenr"
      }"
      end

   xml_valid_ctxt_struct_get_nodemax (a_structure: POINTER): INTEGER 
         -- Query for nodeMax field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_nodemax"
      }"
      end

   xml_valid_ctxt_struct_get_nodetab (a_structure: POINTER): POINTER 
         -- Query for nodeTab field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_nodetab"
      }"
      end

   xml_valid_ctxt_struct_get_finishdtd (a_structure: POINTER): NATURAL 
         -- Query for finishDtd field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_finishdtd"
      }"
      end

   xml_valid_ctxt_struct_get_doc (a_structure: POINTER): POINTER 
         -- Query for doc field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_doc"
      }"
      end

   xml_valid_ctxt_struct_get_valid (a_structure: POINTER): INTEGER 
         -- Query for valid field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_valid"
      }"
      end

   xml_valid_ctxt_struct_get_vstate (a_structure: POINTER): POINTER 
         -- Query for vstate field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_vstate"
      }"
      end

   xml_valid_ctxt_struct_get_vstatenr (a_structure: POINTER): INTEGER 
         -- Query for vstateNr field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_vstatenr"
      }"
      end

   xml_valid_ctxt_struct_get_vstatemax (a_structure: POINTER): INTEGER 
         -- Query for vstateMax field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_vstatemax"
      }"
      end

   xml_valid_ctxt_struct_get_vstatetab (a_structure: POINTER): POINTER 
         -- Query for vstateTab field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_vstatetab"
      }"
      end

   xml_valid_ctxt_struct_get_am (a_structure: POINTER): POINTER 
         -- Query for am field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_am"
      }"
      end

   xml_valid_ctxt_struct_get_state (a_structure: POINTER): POINTER 
         -- Query for state field of XML_VALID_CTXT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_valid_ctxt_struct_get_state"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_valid_ctxt"
               }"
               end

end -- class XML_VALID_CTXT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
