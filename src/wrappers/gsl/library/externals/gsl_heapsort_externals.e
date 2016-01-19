-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_HEAPSORT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_heapsort (an_array: POINTER; a_count: like size_t; a_size: like size_t; a_compare: POINTER) is
 		-- gsl_heapsort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_heapsort"
		}"
		end

	gsl_heapsort_index (a_p: POINTER; an_array: POINTER; a_count: like size_t; a_size: like size_t; a_compare: POINTER): INTEGER is
 		-- gsl_heapsort_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_heapsort_index"
		}"
		end


end -- class GSL_HEAPSORT_EXTERNALS
