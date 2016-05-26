-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVALUE_ARRAY_STRUCT
-- Wrapper of struct _GValueArray defined in file /usr/include/glib-2.0/gobject/gvaluearray.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gvalue_array_struct_set_n_values (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_values field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_set_n_values"
      }"
      end

   gvalue_array_struct_set_values (a_structure: POINTER; a_value: POINTER) 
         -- Setter for values field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_set_values"
      }"
      end

   gvalue_array_struct_set_n_prealloced (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_prealloced field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_set_n_prealloced"
      }"
      end

feature {} -- Low-level queries

   gvalue_array_struct_get_n_values (a_structure: POINTER): NATURAL 
         -- Query for n_values field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_get_n_values"
      }"
      end

   gvalue_array_struct_get_values (a_structure: POINTER): POINTER 
         -- Query for values field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_get_values"
      }"
      end

   gvalue_array_struct_get_n_prealloced (a_structure: POINTER): NATURAL 
         -- Query for n_prealloced field of GVALUE_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gvalue_array_struct_get_n_prealloced"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gvalue_array"
               }"
               end

end -- class GVALUE_ARRAY_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
