-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBINDING_STRUCT
-- Wrapper of struct _GBinding defined in file /usr/include/glib-2.0/gobject/gbinding.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gbinding"
               }"
               end

end -- class GBINDING_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
