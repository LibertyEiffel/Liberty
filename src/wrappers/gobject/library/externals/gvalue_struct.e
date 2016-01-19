-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVALUE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

   gvalue_struct_set_g_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for g_type field of GVALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_struct_set_g_type"
      }"
      end

   gvalue_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GVALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_struct_set_data"
      }"
      end

feature {} -- Low-level queries

   gvalue_struct_get_g_type (a_structure: POINTER): like long_unsigned 
         -- Query for g_type field of GVALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_struct_get_g_type"
      }"
      end

   gvalue_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GVALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_struct_get_data"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GValue"
               }"
               end

end -- class GVALUE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
