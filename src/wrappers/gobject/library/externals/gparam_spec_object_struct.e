-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_OBJECT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GParamSpecObject"
               }"
               end

end -- class GPARAM_SPEC_OBJECT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
