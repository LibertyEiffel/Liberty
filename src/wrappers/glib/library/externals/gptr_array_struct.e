-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPTR_ARRAY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gptr_array_struct_set_pdata (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pdata field of GPTR_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gptr_array_struct_set_pdata"
      }"
      end

   gptr_array_struct_set_len (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for len field of GPTR_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gptr_array_struct_set_len"
      }"
      end

feature {} -- Low-level queries

   gptr_array_struct_get_pdata (a_structure: POINTER): POINTER 
         -- Query for pdata field of GPTR_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gptr_array_struct_get_pdata"
      }"
      end

   gptr_array_struct_get_len (a_structure: POINTER): NATURAL 
         -- Query for len field of GPTR_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gptr_array_struct_get_len"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GPtrArray"
               }"
               end

end -- class GPTR_ARRAY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
