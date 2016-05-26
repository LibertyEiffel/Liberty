-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_PARAM_STRUCT
-- Wrapper of struct _GParamSpecParam defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

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
                       feature_name: "sizeof_gparam_spec_param"
               }"
               end

end -- class GPARAM_SPEC_PARAM_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
