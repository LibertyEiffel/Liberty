-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ITIMERSPEC_STRUCT
-- Wrapper of struct itimerspec defined in file /usr/include/time.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field it_interval.
	-- Unwrappable field it_value.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_itimerspec"
               }"
               end

end -- class ITIMERSPEC_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
