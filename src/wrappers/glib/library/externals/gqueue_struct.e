-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GQUEUE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gqueue_struct_set_head (a_structure: POINTER; a_value: POINTER) 
         -- Setter for head field of GQUEUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_set_head"
      }"
      end

   gqueue_struct_set_tail (a_structure: POINTER; a_value: POINTER) 
         -- Setter for tail field of GQUEUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_set_tail"
      }"
      end

   gqueue_struct_set_length (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for length field of GQUEUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_set_length"
      }"
      end

feature {} -- Low-level queries

   gqueue_struct_get_head (a_structure: POINTER): POINTER 
         -- Query for head field of GQUEUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_get_head"
      }"
      end

   gqueue_struct_get_tail (a_structure: POINTER): POINTER 
         -- Query for tail field of GQUEUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_get_tail"
      }"
      end

   gqueue_struct_get_length (a_structure: POINTER): NATURAL 
         -- Query for length field of GQUEUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gqueue_struct_get_length"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GQueue"
               }"
               end

end -- class GQUEUE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
