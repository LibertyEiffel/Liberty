-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TIMES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	times (a_buffer: POINTER): like long 

		-- function times (in `/usr/include/x86_64-linux-gnu/sys/times.h')
               -- times
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "times"
               }"
               end


end -- class TIMES_EXTERNALS
