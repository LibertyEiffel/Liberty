-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IFACE_STRUCT
-- Wrapper of struct iface defined in file /usr/include/net/if.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_iface"
               }"
               end

end -- class IFACE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
