-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class INTERNAL_STATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	ZLIB_TYPES
feature {} -- Low-level setters

   internal_state_struct_set_dummy (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for dummy field of INTERNAL_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "internal_state_struct_set_dummy"
      }"
      end

feature {} -- Low-level queries

   internal_state_struct_get_dummy (a_structure: POINTER): INTEGER 
         -- Query for dummy field of INTERNAL_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "internal_state_struct_get_dummy"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_internal_state"
               }"
               end

end -- class INTERNAL_STATE_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
