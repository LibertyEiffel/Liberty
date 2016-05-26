-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IFREQ_STRUCT
-- Wrapper of struct ifreq defined in file /usr/include/net/if.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field ifr_ifrn.
	-- Unwrappable field ifr_ifru.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ifreq"
               }"
               end

end -- class IFREQ_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
