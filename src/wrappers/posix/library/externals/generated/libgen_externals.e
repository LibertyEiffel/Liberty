-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LIBGEN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	dirname (a_path: POINTER): POINTER 

		-- function dirname (in `/usr/include/libgen.h')
               -- dirname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dirname"
               }"
               end

	-- `hidden' function __xpg_basename skipped.

end -- class LIBGEN_EXTERNALS
