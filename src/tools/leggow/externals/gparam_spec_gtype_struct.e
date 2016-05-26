-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_GTYPE_STRUCT
-- Wrapper of struct _GParamSpecGType defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_gtype_struct_set_is_a_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for is_a_type field of GPARAM_SPEC_GTYPE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_gtype_struct_set_is_a_type"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_gtype_struct_get_is_a_type (a_structure: POINTER): like long_unsigned 
         -- Query for is_a_type field of GPARAM_SPEC_GTYPE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_gtype_struct_get_is_a_type"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_gtype"
               }"
               end

end -- class GPARAM_SPEC_GTYPE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
