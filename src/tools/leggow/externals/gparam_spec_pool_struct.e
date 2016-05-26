-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_POOL_STRUCT
-- Wrapper of struct _GParamSpecPool defined in file /usr/include/glib-2.0/gobject/gparam.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_pool"
               }"
               end

end -- class GPARAM_SPEC_POOL_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
