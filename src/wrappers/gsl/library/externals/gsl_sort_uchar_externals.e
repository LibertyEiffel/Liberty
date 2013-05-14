-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SORT_UCHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sort_uchar (a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_sort_uchar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar"
		}"
		end

	gsl_sort_uchar_index (a_p: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_sort_uchar_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar_index"
		}"
		end

	gsl_sort_uchar_largest (a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_uchar_largest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar_largest"
		}"
		end

	gsl_sort_uchar_largest_index (a_p: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_uchar_largest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar_largest_index"
		}"
		end

	gsl_sort_uchar_smallest (a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_uchar_smallest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar_smallest"
		}"
		end

	gsl_sort_uchar_smallest_index (a_p: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_uchar_smallest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_uchar_smallest_index"
		}"
		end


end -- class GSL_SORT_UCHAR_EXTERNALS
