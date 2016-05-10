-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTIME_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	utime (a_file: POINTER; a_file_times: POINTER): INTEGER 

		-- function utime (in `/usr/include/utime.h')
               -- utime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "utime"
               }"
               end


end -- class UTIME_EXTERNALS
