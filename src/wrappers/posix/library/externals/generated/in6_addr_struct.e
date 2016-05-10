-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IN6_ADDR_STRUCT
-- Wrapper of struct in6_addr defined in file /usr/include/netinet/in.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __in6_u.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_in6_addr"
               }"
               end

end -- class IN6_ADDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
