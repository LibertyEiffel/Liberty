-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LANGINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	nl_langinfo (an_item: INTEGER): POINTER 

		-- function nl_langinfo (in `/usr/include/langinfo.h')
               -- nl_langinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nl_langinfo"
               }"
               end

	nl_langinfo_l (an_item: INTEGER; a_l: POINTER): POINTER 

		-- function nl_langinfo_l (in `/usr/include/langinfo.h')
               -- nl_langinfo_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nl_langinfo_l"
               }"
               end


end -- class LANGINFO_EXTERNALS
