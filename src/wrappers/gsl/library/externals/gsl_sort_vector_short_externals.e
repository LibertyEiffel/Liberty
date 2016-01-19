-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SORT_VECTOR_SHORT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sort_vector_short (a_v: POINTER) is
 		-- gsl_sort_vector_short
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short"
		}"
		end

	gsl_sort_vector_short_index (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_sort_vector_short_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short_index"
		}"
		end

	gsl_sort_vector_short_largest (a_dest: POINTER; a_k: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_sort_vector_short_largest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short_largest"
		}"
		end

	gsl_sort_vector_short_largest_index (a_p: POINTER; a_k: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_sort_vector_short_largest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short_largest_index"
		}"
		end

	gsl_sort_vector_short_smallest (a_dest: POINTER; a_k: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_sort_vector_short_smallest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short_smallest"
		}"
		end

	gsl_sort_vector_short_smallest_index (a_p: POINTER; a_k: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_sort_vector_short_smallest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_short_smallest_index"
		}"
		end


end -- class GSL_SORT_VECTOR_SHORT_EXTERNALS
