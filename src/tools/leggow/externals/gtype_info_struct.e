-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_INFO_STRUCT
-- Wrapper of struct _GTypeInfo defined in file /usr/include/glib-2.0/gobject/gtype.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_info_struct_set_class_size (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for class_size field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_class_size"
      }"
      end

   gtype_info_struct_set_base_init (a_structure: POINTER; a_value: POINTER) 
         -- Setter for base_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_base_init"
      }"
      end

   gtype_info_struct_set_base_finalize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for base_finalize field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_base_finalize"
      }"
      end

   gtype_info_struct_set_class_init (a_structure: POINTER; a_value: POINTER) 
         -- Setter for class_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_class_init"
      }"
      end

   gtype_info_struct_set_class_finalize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for class_finalize field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_class_finalize"
      }"
      end

   gtype_info_struct_set_class_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for class_data field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_class_data"
      }"
      end

   gtype_info_struct_set_instance_size (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for instance_size field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_instance_size"
      }"
      end

   gtype_info_struct_set_n_preallocs (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for n_preallocs field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_n_preallocs"
      }"
      end

   gtype_info_struct_set_instance_init (a_structure: POINTER; a_value: POINTER) 
         -- Setter for instance_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_instance_init"
      }"
      end

   gtype_info_struct_set_value_table (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_table field of GTYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_set_value_table"
      }"
      end

feature {} -- Low-level queries

   gtype_info_struct_get_class_size (a_structure: POINTER): NATURAL_16 
         -- Query for class_size field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_class_size"
      }"
      end

   gtype_info_struct_get_base_init (a_structure: POINTER): POINTER 
         -- Query for base_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_base_init"
      }"
      end

   gtype_info_struct_get_base_finalize (a_structure: POINTER): POINTER 
         -- Query for base_finalize field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_base_finalize"
      }"
      end

   gtype_info_struct_get_class_init (a_structure: POINTER): POINTER 
         -- Query for class_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_class_init"
      }"
      end

   gtype_info_struct_get_class_finalize (a_structure: POINTER): POINTER 
         -- Query for class_finalize field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_class_finalize"
      }"
      end

   gtype_info_struct_get_class_data (a_structure: POINTER): POINTER 
         -- Query for class_data field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_class_data"
      }"
      end

   gtype_info_struct_get_instance_size (a_structure: POINTER): NATURAL_16 
         -- Query for instance_size field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_instance_size"
      }"
      end

   gtype_info_struct_get_n_preallocs (a_structure: POINTER): NATURAL_16 
         -- Query for n_preallocs field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_n_preallocs"
      }"
      end

   gtype_info_struct_get_instance_init (a_structure: POINTER): POINTER 
         -- Query for instance_init field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_instance_init"
      }"
      end

   gtype_info_struct_get_value_table (a_structure: POINTER): POINTER 
         -- Query for value_table field of GTYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_info_struct_get_value_table"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_info"
               }"
               end

end -- class GTYPE_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
