-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPELIB_STRUCT
-- Wrapper of struct _GITypelib defined in file /usr/include/gobject-introspection-1.0/gitypes.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtypelib"
               }"
               end

end -- class GTYPELIB_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
