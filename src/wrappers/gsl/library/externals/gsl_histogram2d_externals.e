-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_HISTOGRAM2D_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_histogram2d_accumulate (a_h: POINTER; a_x: REAL; a_y: REAL; a_weight: REAL): INTEGER is
 		-- gsl_histogram2d_accumulate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_accumulate"
		}"
		end

	gsl_histogram2d_add (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram2d_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_add"
		}"
		end

	gsl_histogram2d_alloc (a_nx: like size_t; a_ny: like size_t): POINTER is
 		-- gsl_histogram2d_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_alloc"
		}"
		end

	gsl_histogram2d_calloc (a_nx: like size_t; a_ny: like size_t): POINTER is
 		-- gsl_histogram2d_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_calloc"
		}"
		end

	gsl_histogram2d_calloc_range (a_nx: like size_t; a_ny: like size_t; a_xrange: POINTER; a_yrange: POINTER): POINTER is
 		-- gsl_histogram2d_calloc_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_calloc_range"
		}"
		end

	gsl_histogram2d_calloc_uniform (a_nx: like size_t; a_ny: like size_t; a_xmin: REAL; a_xmax: REAL; a_ymin: REAL; a_ymax: REAL): POINTER is
 		-- gsl_histogram2d_calloc_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_calloc_uniform"
		}"
		end

	gsl_histogram2d_clone (a_source: POINTER): POINTER is
 		-- gsl_histogram2d_clone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_clone"
		}"
		end

	gsl_histogram2d_cov (a_h: POINTER): REAL is
 		-- gsl_histogram2d_cov
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_cov"
		}"
		end

	gsl_histogram2d_div (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram2d_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_div"
		}"
		end

	gsl_histogram2d_equal_bins_p (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram2d_equal_bins_p
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_equal_bins_p"
		}"
		end

	gsl_histogram2d_find (a_h: POINTER; a_x: REAL; a_y: REAL; an_i: POINTER; a_j: POINTER): INTEGER is
 		-- gsl_histogram2d_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_find"
		}"
		end

	gsl_histogram2d_fprintf (a_stream: POINTER; a_h: POINTER; a_range_format: POINTER; a_bin_format: POINTER): INTEGER is
 		-- gsl_histogram2d_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_fprintf"
		}"
		end

	gsl_histogram2d_fread (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram2d_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_fread"
		}"
		end

	gsl_histogram2d_free (a_h: POINTER) is
 		-- gsl_histogram2d_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_free"
		}"
		end

	gsl_histogram2d_fscanf (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram2d_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_fscanf"
		}"
		end

	gsl_histogram2d_fwrite (a_stream: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram2d_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_fwrite"
		}"
		end

	gsl_histogram2d_get (a_h: POINTER; an_i: like size_t; a_j: like size_t): REAL is
 		-- gsl_histogram2d_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_get"
		}"
		end

	gsl_histogram2d_get_xrange (a_h: POINTER; an_i: like size_t; a_xlower: POINTER; a_xupper: POINTER): INTEGER is
 		-- gsl_histogram2d_get_xrange
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_get_xrange"
		}"
		end

	gsl_histogram2d_get_yrange (a_h: POINTER; a_j: like size_t; a_ylower: POINTER; a_yupper: POINTER): INTEGER is
 		-- gsl_histogram2d_get_yrange
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_get_yrange"
		}"
		end

	gsl_histogram2d_increment (a_h: POINTER; a_x: REAL; a_y: REAL): INTEGER is
 		-- gsl_histogram2d_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_increment"
		}"
		end

	gsl_histogram2d_max_bin (a_h: POINTER; an_i: POINTER; a_j: POINTER) is
 		-- gsl_histogram2d_max_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_max_bin"
		}"
		end

	gsl_histogram2d_max_val (a_h: POINTER): REAL is
 		-- gsl_histogram2d_max_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_max_val"
		}"
		end

	gsl_histogram2d_memcpy (a_dest: POINTER; a_source: POINTER): INTEGER is
 		-- gsl_histogram2d_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_memcpy"
		}"
		end

	gsl_histogram2d_min_bin (a_h: POINTER; an_i: POINTER; a_j: POINTER) is
 		-- gsl_histogram2d_min_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_min_bin"
		}"
		end

	gsl_histogram2d_min_val (a_h: POINTER): REAL is
 		-- gsl_histogram2d_min_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_min_val"
		}"
		end

	gsl_histogram2d_mul (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram2d_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_mul"
		}"
		end

	gsl_histogram2d_nx (a_h: POINTER): like size_t is
 		-- gsl_histogram2d_nx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_nx"
		}"
		end

	gsl_histogram2d_ny (a_h: POINTER): like size_t is
 		-- gsl_histogram2d_ny
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_ny"
		}"
		end

	gsl_histogram2d_pdf_alloc (a_nx: like size_t; a_ny: like size_t): POINTER is
 		-- gsl_histogram2d_pdf_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_alloc"
		}"
		end

	gsl_histogram2d_pdf_free (a_p: POINTER) is
 		-- gsl_histogram2d_pdf_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_free"
		}"
		end

	gsl_histogram2d_pdf_init (a_p: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_histogram2d_pdf_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_init"
		}"
		end

	gsl_histogram2d_pdf_sample (a_p: POINTER; a_r1: REAL; a_r2: REAL; a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_histogram2d_pdf_sample
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_sample"
		}"
		end

	gsl_histogram2d_reset (a_h: POINTER) is
 		-- gsl_histogram2d_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_reset"
		}"
		end

	gsl_histogram2d_scale (a_h: POINTER; a_scale: REAL): INTEGER is
 		-- gsl_histogram2d_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_scale"
		}"
		end

	gsl_histogram2d_set_ranges (a_h: POINTER; a_xrange: POINTER; a_xsize: like size_t; a_yrange: POINTER; a_ysize: like size_t): INTEGER is
 		-- gsl_histogram2d_set_ranges
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_set_ranges"
		}"
		end

	gsl_histogram2d_set_ranges_uniform (a_h: POINTER; a_xmin: REAL; a_xmax: REAL; a_ymin: REAL; a_ymax: REAL): INTEGER is
 		-- gsl_histogram2d_set_ranges_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_set_ranges_uniform"
		}"
		end

	gsl_histogram2d_shift (a_h: POINTER; a_shift: REAL): INTEGER is
 		-- gsl_histogram2d_shift
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_shift"
		}"
		end

	gsl_histogram2d_sub (a_h1: POINTER; a_h2: POINTER): INTEGER is
 		-- gsl_histogram2d_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_sub"
		}"
		end

	gsl_histogram2d_sum (a_h: POINTER): REAL is
 		-- gsl_histogram2d_sum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_sum"
		}"
		end

	gsl_histogram2d_xmax (a_h: POINTER): REAL is
 		-- gsl_histogram2d_xmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_xmax"
		}"
		end

	gsl_histogram2d_xmean (a_h: POINTER): REAL is
 		-- gsl_histogram2d_xmean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_xmean"
		}"
		end

	gsl_histogram2d_xmin (a_h: POINTER): REAL is
 		-- gsl_histogram2d_xmin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_xmin"
		}"
		end

	gsl_histogram2d_xsigma (a_h: POINTER): REAL is
 		-- gsl_histogram2d_xsigma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_xsigma"
		}"
		end

	gsl_histogram2d_ymax (a_h: POINTER): REAL is
 		-- gsl_histogram2d_ymax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_ymax"
		}"
		end

	gsl_histogram2d_ymean (a_h: POINTER): REAL is
 		-- gsl_histogram2d_ymean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_ymean"
		}"
		end

	gsl_histogram2d_ymin (a_h: POINTER): REAL is
 		-- gsl_histogram2d_ymin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_ymin"
		}"
		end

	gsl_histogram2d_ysigma (a_h: POINTER): REAL is
 		-- gsl_histogram2d_ysigma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_ysigma"
		}"
		end


end -- class GSL_HISTOGRAM2D_EXTERNALS
