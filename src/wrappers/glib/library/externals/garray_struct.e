-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GARRAY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   garray_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "garray_struct_set_data"
      }"
      end

   garray_struct_set_len (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for len field of GARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "garray_struct_set_len"
      }"
      end

feature {} -- Low-level queries

   garray_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "garray_struct_get_data"
      }"
      end

   garray_struct_get_len (a_structure: POINTER): NATURAL 
         -- Query for len field of GARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "garray_struct_get_len"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GArray"
               }"
               end

end -- class GARRAY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
