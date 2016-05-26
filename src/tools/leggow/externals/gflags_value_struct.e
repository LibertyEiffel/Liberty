-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GFLAGS_VALUE_STRUCT
-- Wrapper of struct _GFlagsValue defined in file /usr/include/glib-2.0/gobject/genums.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gflags_value_struct_set_value (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for value field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_set_value"
      }"
      end

   gflags_value_struct_set_value_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_name field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_set_value_name"
      }"
      end

   gflags_value_struct_set_value_nick (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_nick field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_set_value_nick"
      }"
      end

feature {} -- Low-level queries

   gflags_value_struct_get_value (a_structure: POINTER): NATURAL 
         -- Query for value field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_get_value"
      }"
      end

   gflags_value_struct_get_value_name (a_structure: POINTER): POINTER 
         -- Query for value_name field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_get_value_name"
      }"
      end

   gflags_value_struct_get_value_nick (a_structure: POINTER): POINTER 
         -- Query for value_nick field of GFLAGS_VALUE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_value_struct_get_value_nick"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gflags_value"
               }"
               end

end -- class GFLAGS_VALUE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
