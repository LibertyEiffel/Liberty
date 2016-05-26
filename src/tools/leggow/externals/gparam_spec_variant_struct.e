-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_VARIANT_STRUCT
-- Wrapper of struct _GParamSpecVariant defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_variant_struct_set_type (a_structure: POINTER; a_value: POINTER) 
         -- Setter for type field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_set_type"
      }"
      end

   gparam_spec_variant_struct_set_default_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for default_value field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_set_default_value"
      }"
      end

   gparam_spec_variant_struct_set_padding (a_structure: POINTER; a_value: POINTER) 
         -- Setter for padding field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_set_padding"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_variant_struct_get_type (a_structure: POINTER): POINTER 
         -- Query for type field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_get_type"
      }"
      end

   gparam_spec_variant_struct_get_default_value (a_structure: POINTER): POINTER 
         -- Query for default_value field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_get_default_value"
      }"
      end

   gparam_spec_variant_struct_get_padding (a_structure: POINTER): POINTER 
         -- Query for padding field of GPARAM_SPEC_VARIANT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_variant_struct_get_padding"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_variant"
               }"
               end

end -- class GPARAM_SPEC_VARIANT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
