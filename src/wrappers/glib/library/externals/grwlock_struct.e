-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GRWLOCK_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   grwlock_struct_set_p (a_structure: POINTER; a_value: POINTER) 
         -- Setter for p field of GRWLOCK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "grwlock_struct_set_p"
      }"
      end

   grwlock_struct_set_i (a_structure: POINTER; a_value: POINTER) 
         -- Setter for i field of GRWLOCK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "grwlock_struct_set_i"
      }"
      end

feature {} -- Low-level queries

   grwlock_struct_get_p (a_structure: POINTER): POINTER 
         -- Query for p field of GRWLOCK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "grwlock_struct_get_p"
      }"
      end

   grwlock_struct_get_i (a_structure: POINTER): POINTER 
         -- Query for i field of GRWLOCK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "grwlock_struct_get_i"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GRWLock"
               }"
               end

end -- class GRWLOCK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
