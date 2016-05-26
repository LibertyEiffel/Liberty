-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GENUM_VALUE_STRUCT
-- Wrapper of struct _GEnumValue defined in file /usr/include/glib-2.0/gobject/genums.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   genum_value_struct_set_value (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for value field of GENUM_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_set_value"
      }"
      end

   genum_value_struct_set_value_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_name field of GENUM_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_set_value_name"
      }"
      end

   genum_value_struct_set_value_nick (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_nick field of GENUM_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_set_value_nick"
      }"
      end

feature {} -- Low-level queries

   genum_value_struct_get_value (a_structure: POINTER): INTEGER 
         -- Query for value field of GENUM_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_get_value"
      }"
      end

   genum_value_struct_get_value_name (a_structure: POINTER): POINTER 
         -- Query for value_name field of GENUM_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_get_value_name"
      }"
      end

   genum_value_struct_get_value_nick (a_structure: POINTER): POINTER 
         -- Query for value_nick field of GENUM_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_value_struct_get_value_nick"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_genum_value"
               }"
               end

end -- class GENUM_VALUE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
