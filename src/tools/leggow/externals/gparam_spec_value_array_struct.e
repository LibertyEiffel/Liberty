-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_VALUE_ARRAY_STRUCT
-- Wrapper of struct _GParamSpecValueArray defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_value_array_struct_set_element_spec (a_structure: POINTER; a_value: POINTER) 
         -- Setter for element_spec field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_value_array_struct_set_element_spec"
      }"
      end

   gparam_spec_value_array_struct_set_fixed_n_elements (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for fixed_n_elements field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_value_array_struct_set_fixed_n_elements"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_value_array_struct_get_element_spec (a_structure: POINTER): POINTER 
         -- Query for element_spec field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_value_array_struct_get_element_spec"
      }"
      end

   gparam_spec_value_array_struct_get_fixed_n_elements (a_structure: POINTER): NATURAL 
         -- Query for fixed_n_elements field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_value_array_struct_get_fixed_n_elements"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_value_array"
               }"
               end

end -- class GPARAM_SPEC_VALUE_ARRAY_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
