-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_BOXED_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GParamSpecBoxed"
               }"
               end

end -- class GPARAM_SPEC_BOXED_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
