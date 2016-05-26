-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGSET_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/x86_64-linux-gnu/bits/sigset.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __val.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof___sigset_t"
               }"
               end

end -- class SIGSET_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
