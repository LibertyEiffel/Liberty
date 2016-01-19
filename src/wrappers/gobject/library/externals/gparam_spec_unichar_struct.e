-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_UNICHAR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

   gparam_spec_unichar_struct_set_default_value (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for default_value field of GPARAM_SPEC_UNICHAR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_unichar_struct_set_default_value"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_unichar_struct_get_default_value (a_structure: POINTER): NATURAL 
         -- Query for default_value field of GPARAM_SPEC_UNICHAR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_unichar_struct_get_default_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GParamSpecUnichar"
               }"
               end

end -- class GPARAM_SPEC_UNICHAR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
