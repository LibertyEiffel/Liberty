-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVARIANT_DICT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gvariant_dict_struct_set_x (a_structure: POINTER; a_value: POINTER) 
         -- Setter for x field of GVARIANT_DICT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvariant_dict_struct_set_x"
      }"
      end

feature {} -- Low-level queries

   gvariant_dict_struct_get_x (a_structure: POINTER): POINTER 
         -- Query for x field of GVARIANT_DICT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvariant_dict_struct_get_x"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GVariantDict"
               }"
               end

end -- class GVARIANT_DICT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
