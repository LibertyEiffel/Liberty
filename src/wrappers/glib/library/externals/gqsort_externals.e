-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GQSORT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_qsort_with_data (a_pbase: POINTER; a_total_elems: INTEGER; a_size: like long_unsigned; a_compare_func: POINTER; an_user_data: POINTER) 
               -- g_qsort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_qsort_with_data"
               }"
               end


end -- class GQSORT_EXTERNALS
