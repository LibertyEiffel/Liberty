-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_DOUBLE_STRUCT
-- Wrapper of struct _GParamSpecDouble defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_double_struct_set_minimum (a_structure: POINTER; a_value: REAL) 
         -- Setter for minimum field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_set_minimum"
      }"
      end

   gparam_spec_double_struct_set_maximum (a_structure: POINTER; a_value: REAL) 
         -- Setter for maximum field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_set_maximum"
      }"
      end

   gparam_spec_double_struct_set_default_value (a_structure: POINTER; a_value: REAL) 
         -- Setter for default_value field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_set_default_value"
      }"
      end

   gparam_spec_double_struct_set_epsilon (a_structure: POINTER; a_value: REAL) 
         -- Setter for epsilon field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_set_epsilon"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_double_struct_get_minimum (a_structure: POINTER): REAL 
         -- Query for minimum field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_get_minimum"
      }"
      end

   gparam_spec_double_struct_get_maximum (a_structure: POINTER): REAL 
         -- Query for maximum field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_get_maximum"
      }"
      end

   gparam_spec_double_struct_get_default_value (a_structure: POINTER): REAL 
         -- Query for default_value field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_get_default_value"
      }"
      end

   gparam_spec_double_struct_get_epsilon (a_structure: POINTER): REAL 
         -- Query for epsilon field of GPARAM_SPEC_DOUBLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_double_struct_get_epsilon"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_double"
               }"
               end

end -- class GPARAM_SPEC_DOUBLE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
