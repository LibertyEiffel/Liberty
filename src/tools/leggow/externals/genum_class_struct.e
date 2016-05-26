-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GENUM_CLASS_STRUCT
-- Wrapper of struct _GEnumClass defined in file /usr/include/glib-2.0/gobject/genums.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   genum_class_struct_set_minimum (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for minimum field of GENUM_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_set_minimum"
      }"
      end

   genum_class_struct_set_maximum (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for maximum field of GENUM_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_set_maximum"
      }"
      end

   genum_class_struct_set_n_values (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_values field of GENUM_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_set_n_values"
      }"
      end

   genum_class_struct_set_values (a_structure: POINTER; a_value: POINTER) 
         -- Setter for values field of GENUM_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_set_values"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field g_type_class.
   genum_class_struct_get_minimum (a_structure: POINTER): INTEGER 
         -- Query for minimum field of GENUM_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_get_minimum"
      }"
      end

   genum_class_struct_get_maximum (a_structure: POINTER): INTEGER 
         -- Query for maximum field of GENUM_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_get_maximum"
      }"
      end

   genum_class_struct_get_n_values (a_structure: POINTER): NATURAL 
         -- Query for n_values field of GENUM_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_get_n_values"
      }"
      end

   genum_class_struct_get_values (a_structure: POINTER): POINTER 
         -- Query for values field of GENUM_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "genum_class_struct_get_values"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_genum_class"
               }"
               end

end -- class GENUM_CLASS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
