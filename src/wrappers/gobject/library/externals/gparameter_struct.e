-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAMETER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

   gparameter_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of GPARAMETER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparameter_struct_set_name"
      }"
      end

feature {} -- Low-level queries

   gparameter_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of GPARAMETER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparameter_struct_get_name"
      }"
      end

	-- Unwrappable field value.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GParameter"
               }"
               end

end -- class GPARAMETER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
