-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class INTTYPES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	imaxabs (a_n: like intmax_t): like intmax_t 

		-- function imaxabs (in `/usr/include/inttypes.h')
               -- imaxabs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "imaxabs"
               }"
               end

       -- unwrappable function imaxdiv in file `/usr/include/inttypes.h'
	strtoimax (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like intmax_t 

		-- function strtoimax (in `/usr/include/inttypes.h')
               -- strtoimax
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoimax"
               }"
               end

	strtoumax (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like uintmax_t 

		-- function strtoumax (in `/usr/include/inttypes.h')
               -- strtoumax
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoumax"
               }"
               end

	wcstoimax (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like intmax_t 

		-- function wcstoimax (in `/usr/include/inttypes.h')
               -- wcstoimax
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wcstoimax"
               }"
               end

	wcstoumax (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like uintmax_t 

		-- function wcstoumax (in `/usr/include/inttypes.h')
               -- wcstoumax
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wcstoumax"
               }"
               end


end -- class INTTYPES_EXTERNALS
