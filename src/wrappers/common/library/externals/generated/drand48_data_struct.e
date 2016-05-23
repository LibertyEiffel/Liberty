-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DRAND48_DATA_STRUCT
-- Wrapper of struct drand48_data defined in file /usr/include/stdlib.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __x.
	-- Unwrapped private field __old_x.
	-- Unwrapped private field __c.
	-- Unwrapped private field __init.
	-- Unwrapped private field __a.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_drand48_data"
               }"
               end

end -- class DRAND48_DATA_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
