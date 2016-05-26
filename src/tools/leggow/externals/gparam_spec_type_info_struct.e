-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_TYPE_INFO_STRUCT
-- Wrapper of struct _GParamSpecTypeInfo defined in file /usr/include/glib-2.0/gobject/gparam.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_type_info_struct_set_instance_size (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for instance_size field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_instance_size"
      }"
      end

   gparam_spec_type_info_struct_set_n_preallocs (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for n_preallocs field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_n_preallocs"
      }"
      end

   gparam_spec_type_info_struct_set_instance_init (a_structure: POINTER; a_value: POINTER) 
         -- Setter for instance_init field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_instance_init"
      }"
      end

   gparam_spec_type_info_struct_set_value_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for value_type field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_value_type"
      }"
      end

   gparam_spec_type_info_struct_set_finalize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for finalize field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_finalize"
      }"
      end

   gparam_spec_type_info_struct_set_value_set_default (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_set_default field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_value_set_default"
      }"
      end

   gparam_spec_type_info_struct_set_value_validate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_validate field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_value_validate"
      }"
      end

   gparam_spec_type_info_struct_set_values_cmp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for values_cmp field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_set_values_cmp"
      }"
      end

feature {} -- Low-level queries

   gparam_spec_type_info_struct_get_instance_size (a_structure: POINTER): NATURAL_16 
         -- Query for instance_size field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_instance_size"
      }"
      end

   gparam_spec_type_info_struct_get_n_preallocs (a_structure: POINTER): NATURAL_16 
         -- Query for n_preallocs field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_n_preallocs"
      }"
      end

   gparam_spec_type_info_struct_get_instance_init (a_structure: POINTER): POINTER 
         -- Query for instance_init field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_instance_init"
      }"
      end

   gparam_spec_type_info_struct_get_value_type (a_structure: POINTER): like long_unsigned 
         -- Query for value_type field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_value_type"
      }"
      end

   gparam_spec_type_info_struct_get_finalize (a_structure: POINTER): POINTER 
         -- Query for finalize field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_finalize"
      }"
      end

   gparam_spec_type_info_struct_get_value_set_default (a_structure: POINTER): POINTER 
         -- Query for value_set_default field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_value_set_default"
      }"
      end

   gparam_spec_type_info_struct_get_value_validate (a_structure: POINTER): POINTER 
         -- Query for value_validate field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_value_validate"
      }"
      end

   gparam_spec_type_info_struct_get_values_cmp (a_structure: POINTER): POINTER 
         -- Query for values_cmp field of GPARAM_SPEC_TYPE_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_type_info_struct_get_values_cmp"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_type_info"
               }"
               end

end -- class GPARAM_SPEC_TYPE_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
