-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_FUNDAMENTAL_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_fundamental_info_struct_set_type_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type_flags field of GTYPE_FUNDAMENTAL_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_fundamental_info_struct_set_type_flags"
      }"
      end

feature {} -- Low-level queries

   gtype_fundamental_info_struct_get_type_flags (a_structure: POINTER): INTEGER 
         -- Query for type_flags field of GTYPE_FUNDAMENTAL_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_fundamental_info_struct_get_type_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GTypeFundamentalInfo"
               }"
               end

end -- class GTYPE_FUNDAMENTAL_INFO_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
