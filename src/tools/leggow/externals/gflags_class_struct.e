-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GFLAGS_CLASS_STRUCT
-- Wrapper of struct _GFlagsClass defined in file /usr/include/glib-2.0/gobject/genums.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gflags_class_struct_set_mask (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for mask field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_set_mask"
      }"
      end

   gflags_class_struct_set_n_values (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_values field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_set_n_values"
      }"
      end

   gflags_class_struct_set_values (a_structure: POINTER; a_value: POINTER) 
         -- Setter for values field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_set_values"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field g_type_class.
   gflags_class_struct_get_mask (a_structure: POINTER): NATURAL 
         -- Query for mask field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_get_mask"
      }"
      end

   gflags_class_struct_get_n_values (a_structure: POINTER): NATURAL 
         -- Query for n_values field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_get_n_values"
      }"
      end

   gflags_class_struct_get_values (a_structure: POINTER): POINTER 
         -- Query for values field of GFLAGS_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gflags_class_struct_get_values"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gflags_class"
               }"
               end

end -- class GFLAGS_CLASS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
