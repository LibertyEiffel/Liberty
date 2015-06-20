-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GMARKUP_PARSER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gmarkup_parser_struct_set_start_element (a_structure: POINTER; a_value: POINTER) 
         -- Setter for start_element field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_set_start_element"
      }"
      end

   gmarkup_parser_struct_set_end_element (a_structure: POINTER; a_value: POINTER) 
         -- Setter for end_element field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_set_end_element"
      }"
      end

   gmarkup_parser_struct_set_text (a_structure: POINTER; a_value: POINTER) 
         -- Setter for text field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_set_text"
      }"
      end

   gmarkup_parser_struct_set_passthrough (a_structure: POINTER; a_value: POINTER) 
         -- Setter for passthrough field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_set_passthrough"
      }"
      end

   gmarkup_parser_struct_set_error (a_structure: POINTER; a_value: POINTER) 
         -- Setter for error field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_set_error"
      }"
      end

feature {} -- Low-level queries

   gmarkup_parser_struct_get_start_element (a_structure: POINTER): POINTER 
         -- Query for start_element field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_get_start_element"
      }"
      end

   gmarkup_parser_struct_get_end_element (a_structure: POINTER): POINTER 
         -- Query for end_element field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_get_end_element"
      }"
      end

   gmarkup_parser_struct_get_text (a_structure: POINTER): POINTER 
         -- Query for text field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_get_text"
      }"
      end

   gmarkup_parser_struct_get_passthrough (a_structure: POINTER): POINTER 
         -- Query for passthrough field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_get_passthrough"
      }"
      end

   gmarkup_parser_struct_get_error (a_structure: POINTER): POINTER 
         -- Query for error field of GMARKUP_PARSER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmarkup_parser_struct_get_error"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GMarkupParser"
               }"
               end

end -- class GMARKUP_PARSER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
