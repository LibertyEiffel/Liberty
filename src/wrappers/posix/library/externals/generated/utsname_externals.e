-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTSNAME_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	uname (a_name: POINTER): INTEGER 

		-- function uname (in `/usr/include/x86_64-linux-gnu/sys/utsname.h')
               -- uname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "uname"
               }"
               end


end -- class UTSNAME_EXTERNALS
