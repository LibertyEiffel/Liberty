-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class NL_TYPES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	catclose (a_catalog: POINTER): INTEGER 

		-- function catclose (in `/usr/include/nl_types.h')
               -- catclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "catclose"
               }"
               end

	catgets (a_catalog: POINTER; a_set: INTEGER; a_number: INTEGER; a_string: POINTER): POINTER 

		-- function catgets (in `/usr/include/nl_types.h')
               -- catgets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "catgets"
               }"
               end

	catopen (a_cat_name: POINTER; a_flag: INTEGER): POINTER 

		-- function catopen (in `/usr/include/nl_types.h')
               -- catopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "catopen"
               }"
               end


end -- class NL_TYPES_EXTERNALS
