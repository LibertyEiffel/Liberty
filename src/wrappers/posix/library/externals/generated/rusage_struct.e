-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RUSAGE_STRUCT
-- Wrapper of struct rusage defined in file /usr/include/x86_64-linux-gnu/bits/resource.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field ru_utime.
	-- Unwrappable field ru_stime.
	-- Anonymous field at line 194.
	-- Anonymous field at line 202.
	-- Anonymous field at line 208.
	-- Anonymous field at line 214.
	-- Anonymous field at line 221.
	-- Anonymous field at line 227.
	-- Anonymous field at line 233.
	-- Anonymous field at line 240.
	-- Anonymous field at line 246.
	-- Anonymous field at line 252.
	-- Anonymous field at line 258.
	-- Anonymous field at line 264.
	-- Anonymous field at line 272.
	-- Anonymous field at line 279.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_rusage"
               }"
               end

end -- class RUSAGE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
