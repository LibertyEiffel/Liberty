-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GONCE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gonce_struct_set_status (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for status field of GONCE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gonce_struct_set_status"
      }"
      end

   gonce_struct_set_retval (a_structure: POINTER; a_value: POINTER) 
         -- Setter for retval field of GONCE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gonce_struct_set_retval"
      }"
      end

feature {} -- Low-level queries

   gonce_struct_get_status (a_structure: POINTER): INTEGER 
         -- Query for status field of GONCE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gonce_struct_get_status"
      }"
      end

   gonce_struct_get_retval (a_structure: POINTER): POINTER 
         -- Query for retval field of GONCE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gonce_struct_get_retval"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GOnce"
               }"
               end

end -- class GONCE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
