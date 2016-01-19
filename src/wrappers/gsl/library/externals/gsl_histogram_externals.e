-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_HISTOGRAM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_histogram_accumulate (a_h: POINTER; a_x: REAL; a_weight: REAL): INTEGER is
 		-- gsl_histogram_accumulate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_accumulate"
		}"
		end

	gsl_histogram_add (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_add"
		}"
		end

	gsl_histogram_alloc (a_n: like size_t): POINTER is
 		-- gsl_histogram_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_alloc"
		}"
		end

	gsl_histogram_bins (a_h: POINTER): like size_t is
 		-- gsl_histogram_bins
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_bins"
		}"
		end

	gsl_histogram_calloc (a_n: like size_t): POINTER is
 		-- gsl_histogram_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_calloc"
		}"
		end

	gsl_histogram_calloc_range (a_n: like size_t; a_range: POINTER): POINTER is
 		-- gsl_histogram_calloc_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_calloc_range"
		}"
		end

	gsl_histogram_calloc_uniform (a_n: like size_t; a_xmin: REAL; a_xmax: REAL): POINTER is
 		-- gsl_histogram_calloc_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_calloc_uniform"
		}"
		end

	gsl_histogram_clone (a_source: POINTER): POINTER is
 		-- gsl_histogram_clone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_clone"
		}"
		end

	gsl_histogram_div (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_div"
		}"
		end

	gsl_histogram_equal_bins_p (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram_equal_bins_p
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_equal_bins_p"
		}"
		end

	gsl_histogram_find (a_h: POINTER; a_x: REAL; an_i: POINTER): INTEGER is
 		-- gsl_histogram_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_find"
		}"
		end

	gsl_histogram_fprintf (a_stream: POINTER; a_h: POINTER; a_range_format: POINTER; a_bin_format: POINTER): INTEGER is
 		-- gsl_histogram_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_fprintf"
		}"
		end

	gsl_histogram_fread (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_fread"
		}"
		end

	gsl_histogram_free (a_h: POINTER) is
 		-- gsl_histogram_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_free"
		}"
		end

	gsl_histogram_fscanf (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_fscanf"
		}"
		end

	gsl_histogram_fwrite (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_fwrite"
		}"
		end

	gsl_histogram_get (a_h: POINTER; an_i: like size_t): REAL is
 		-- gsl_histogram_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_get"
		}"
		end

	gsl_histogram_get_range (a_h: POINTER; an_i: like size_t; a_lower: POINTER; an_upper: POINTER): INTEGER is
 		-- gsl_histogram_get_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_get_range"
		}"
		end

	gsl_histogram_increment (a_h: POINTER; a_x: REAL): INTEGER is
 		-- gsl_histogram_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_increment"
		}"
		end

	gsl_histogram_max (a_h: POINTER): REAL is
 		-- gsl_histogram_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_max"
		}"
		end

	gsl_histogram_max_bin (a_h: POINTER): like size_t is
 		-- gsl_histogram_max_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_max_bin"
		}"
		end

	gsl_histogram_max_val (a_h: POINTER): REAL is
 		-- gsl_histogram_max_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_max_val"
		}"
		end

	gsl_histogram_mean (a_h: POINTER): REAL is
 		-- gsl_histogram_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_mean"
		}"
		end

	gsl_histogram_memcpy (a_dest: POINTER; a_source: POINTER): INTEGER is
 		-- gsl_histogram_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_memcpy"
		}"
		end

	gsl_histogram_min (a_h: POINTER): REAL is
 		-- gsl_histogram_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_min"
		}"
		end

	gsl_histogram_min_bin (a_h: POINTER): like size_t is
 		-- gsl_histogram_min_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_min_bin"
		}"
		end

	gsl_histogram_min_val (a_h: POINTER): REAL is
 		-- gsl_histogram_min_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_min_val"
		}"
		end

	gsl_histogram_mul (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_mul"
		}"
		end

	gsl_histogram_pdf_alloc (a_n: like size_t): POINTER is
 		-- gsl_histogram_pdf_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_pdf_alloc"
		}"
		end

	gsl_histogram_pdf_free (a_p: POINTER) is
 		-- gsl_histogram_pdf_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_pdf_free"
		}"
		end

	gsl_histogram_pdf_init (a_p: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram_pdf_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_pdf_init"
		}"
		end

	gsl_histogram_pdf_sample (a_p: POINTER; a_r: REAL): REAL is
 		-- gsl_histogram_pdf_sample
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_pdf_sample"
		}"
		end

	gsl_histogram_reset (a_h: POINTER) is
 		-- gsl_histogram_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_reset"
		}"
		end

	gsl_histogram_scale (a_h: POINTER; a_scale: REAL): INTEGER is
 		-- gsl_histogram_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_scale"
		}"
		end

	gsl_histogram_set_ranges (a_h: POINTER; a_range: POINTER; a_size: like size_t): INTEGER is
 		-- gsl_histogram_set_ranges
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_set_ranges"
		}"
		end

	gsl_histogram_set_ranges_uniform (a_h: POINTER; a_xmin: REAL; a_xmax: REAL): INTEGER is
 		-- gsl_histogram_set_ranges_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_set_ranges_uniform"
		}"
		end

	gsl_histogram_shift (a_h: POINTER; a_shift: REAL): INTEGER is
 		-- gsl_histogram_shift
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_shift"
		}"
		end

	gsl_histogram_sigma (a_h: POINTER): REAL is
 		-- gsl_histogram_sigma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_sigma"
		}"
		end

	gsl_histogram_sub (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_sub"
		}"
		end

	gsl_histogram_sum (a_h: POINTER): REAL is
 		-- gsl_histogram_sum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_sum"
		}"
		end


end -- class GSL_HISTOGRAM_EXTERNALS
