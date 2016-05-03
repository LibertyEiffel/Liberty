-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XML_PARSER_INPUT_BUFFER_STRUCT
-- Wrapper of struct _xmlParserInputBuffer defined in file /usr/include/libxml2/libxml/xmlIO.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   xml_parser_input_buffer_struct_set_context (a_structure: POINTER; a_value: POINTER) 
         -- Setter for context field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_context"
      }"
      end

   xml_parser_input_buffer_struct_set_readcallback (a_structure: POINTER; a_value: POINTER) 
         -- Setter for readcallback field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_readcallback"
      }"
      end

   xml_parser_input_buffer_struct_set_closecallback (a_structure: POINTER; a_value: POINTER) 
         -- Setter for closecallback field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_closecallback"
      }"
      end

   xml_parser_input_buffer_struct_set_encoder (a_structure: POINTER; a_value: POINTER) 
         -- Setter for encoder field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_encoder"
      }"
      end

   xml_parser_input_buffer_struct_set_buffer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for buffer field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_buffer"
      }"
      end

   xml_parser_input_buffer_struct_set_raw (a_structure: POINTER; a_value: POINTER) 
         -- Setter for raw field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_raw"
      }"
      end

   xml_parser_input_buffer_struct_set_compressed (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for compressed field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_compressed"
      }"
      end

   xml_parser_input_buffer_struct_set_error (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for error field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_error"
      }"
      end

   xml_parser_input_buffer_struct_set_rawconsumed (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for rawconsumed field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_set_rawconsumed"
      }"
      end

feature {} -- Low-level queries

   xml_parser_input_buffer_struct_get_context (a_structure: POINTER): POINTER 
         -- Query for context field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_context"
      }"
      end

   xml_parser_input_buffer_struct_get_readcallback (a_structure: POINTER): POINTER 
         -- Query for readcallback field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_readcallback"
      }"
      end

   xml_parser_input_buffer_struct_get_closecallback (a_structure: POINTER): POINTER 
         -- Query for closecallback field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_closecallback"
      }"
      end

   xml_parser_input_buffer_struct_get_encoder (a_structure: POINTER): POINTER 
         -- Query for encoder field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_encoder"
      }"
      end

   xml_parser_input_buffer_struct_get_buffer (a_structure: POINTER): POINTER 
         -- Query for buffer field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_buffer"
      }"
      end

   xml_parser_input_buffer_struct_get_raw (a_structure: POINTER): POINTER 
         -- Query for raw field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_raw"
      }"
      end

   xml_parser_input_buffer_struct_get_compressed (a_structure: POINTER): INTEGER 
         -- Query for compressed field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_compressed"
      }"
      end

   xml_parser_input_buffer_struct_get_error (a_structure: POINTER): INTEGER 
         -- Query for error field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_error"
      }"
      end

   xml_parser_input_buffer_struct_get_rawconsumed (a_structure: POINTER): like long_unsigned 
         -- Query for rawconsumed field of XML_PARSER_INPUT_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "xml_parser_input_buffer_struct_get_rawconsumed"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_xml_parser_input_buffer"
               }"
               end

end -- class XML_PARSER_INPUT_BUFFER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
