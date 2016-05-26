-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ULIMIT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	ulimit (a_cmd: INTEGER): like long 

		-- function ulimit (in `/usr/include/ulimit.h')
               -- ulimit (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ulimit"
               }"
               end


end -- class ULIMIT_EXTERNALS
