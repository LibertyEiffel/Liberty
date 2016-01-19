-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTRASH_STACK_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gtrash_stack_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of GTRASH_STACK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtrash_stack_struct_set_next"
      }"
      end

feature {} -- Low-level queries

   gtrash_stack_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of GTRASH_STACK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtrash_stack_struct_get_next"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GTrashStack"
               }"
               end

end -- class GTRASH_STACK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
