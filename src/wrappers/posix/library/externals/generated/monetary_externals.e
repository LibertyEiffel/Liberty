-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MONETARY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	strfmon (a_s: POINTER; a_maxsize: like size_t; a_format: POINTER): like ssize_t 

		-- function strfmon (in `/usr/include/monetary.h')
               -- strfmon (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strfmon"
               }"
               end

	strfmon_l (a_s: POINTER; a_maxsize: like size_t; a_loc: POINTER; a_format: POINTER): like ssize_t 

		-- function strfmon_l (in `/usr/include/monetary.h')
               -- strfmon_l (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strfmon_l"
               }"
               end


end -- class MONETARY_EXTERNALS
