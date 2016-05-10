-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTMP_STRUCT
-- Wrapper of struct utmp defined in file /usr/include/utmpx.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_utmp"
               }"
               end

end -- class UTMP_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
