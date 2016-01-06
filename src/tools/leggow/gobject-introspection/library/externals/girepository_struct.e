-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIREPOSITORY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   girepository_struct_set_priv (a_structure: POINTER; a_value: POINTER) 
         -- Setter for priv field of GIREPOSITORY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "girepository_struct_set_priv"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent.
   girepository_struct_get_priv (a_structure: POINTER): POINTER 
         -- Query for priv field of GIREPOSITORY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "girepository_struct_get_priv"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GIRepository"
               }"
               end

end -- class GIREPOSITORY_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
