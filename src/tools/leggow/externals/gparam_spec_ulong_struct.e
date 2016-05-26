-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_ULONG_STRUCT
-- Wrapper of struct _GParamSpecULong defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_ulong_struct_set_minimum (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for minimum field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_set_minimum"
      }"
      end

   gparam_spec_ulong_struct_set_maximum (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for maximum field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_set_maximum"
      }"
      end

   gparam_spec_ulong_struct_set_default_value (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for default_value field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_set_default_value"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_ulong_struct_get_minimum (a_structure: POINTER): like long_unsigned 
         -- Query for minimum field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_get_minimum"
      }"
      end

   gparam_spec_ulong_struct_get_maximum (a_structure: POINTER): like long_unsigned 
         -- Query for maximum field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_get_maximum"
      }"
      end

   gparam_spec_ulong_struct_get_default_value (a_structure: POINTER): like long_unsigned 
         -- Query for default_value field of GPARAM_SPEC_ULONG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_ulong_struct_get_default_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_ulong"
               }"
               end

end -- class GPARAM_SPEC_ULONG_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
