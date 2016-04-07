-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGEVENT_STRUCT
-- Wrapper of struct sigevent defined in file /usr/include/time.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigevent"
               }"
               end

end -- class SIGEVENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
