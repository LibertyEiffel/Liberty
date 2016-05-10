-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FNMATCH_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	fnmatch (a_pattern: POINTER; a_name: POINTER; a_flags: INTEGER): INTEGER 

		-- function fnmatch (in `/usr/include/fnmatch.h')
               -- fnmatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fnmatch"
               }"
               end


end -- class FNMATCH_EXTERNALS
