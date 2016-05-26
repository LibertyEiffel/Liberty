-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GLOB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	glob (a_pattern: POINTER; a_flags: INTEGER; an_errfunc: POINTER; a_pglob: POINTER): INTEGER 

		-- function glob (in `/usr/include/glob.h')
               -- glob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glob"
               }"
               end

	glob64 (a_pattern: POINTER; a_flags: INTEGER; an_errfunc: POINTER; a_pglob: POINTER): INTEGER 

		-- function glob64 (in `/usr/include/glob.h')
               -- glob64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glob64"
               }"
               end

	glob_pattern_p (a_pattern: POINTER; a_quote: INTEGER): INTEGER 

		-- function glob_pattern_p (in `/usr/include/glob.h')
               -- glob_pattern_p
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glob_pattern_p"
               }"
               end

	globfree (a_pglob: POINTER) 

		-- function globfree (in `/usr/include/glob.h')
               -- globfree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "globfree"
               }"
               end

	globfree64 (a_pglob: POINTER) 

		-- function globfree64 (in `/usr/include/glob.h')
               -- globfree64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "globfree64"
               }"
               end


end -- class GLOB_EXTERNALS
