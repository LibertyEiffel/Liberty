-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_vector_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_add"
		}"
		end

	gsl_vector_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_add_constant"
		}"
		end

	gsl_vector_alloc (a_n: like size_t): POINTER is
 		-- gsl_vector_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_alloc"
		}"
		end

	gsl_vector_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_alloc_from_block"
		}"
		end

	gsl_vector_alloc_from_vector (a_v: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_alloc_from_vector"
		}"
		end

	gsl_vector_calloc (a_n: like size_t): POINTER is
 		-- gsl_vector_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_calloc"
		}"
		end

	gsl_vector_const_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_const_ptr"
		}"
		end

	-- function gsl_vector_const_subvector (at line 116 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	-- function gsl_vector_const_subvector_with_stride (at line 122 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	-- function gsl_vector_const_view_array (at line 95 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	-- function gsl_vector_const_view_array_with_stride (at line 100 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	gsl_vector_div (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_div"
		}"
		end

	gsl_vector_equal (an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_equal"
		}"
		end

	gsl_vector_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_vector_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_fprintf"
		}"
		end

	gsl_vector_fread (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_fread"
		}"
		end

	gsl_vector_free (a_v: POINTER) is
 		-- gsl_vector_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_free"
		}"
		end

	gsl_vector_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_fscanf"
		}"
		end

	gsl_vector_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_fwrite"
		}"
		end

	gsl_vector_get (a_v: POINTER; an_i: like size_t): REAL is
 		-- gsl_vector_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_get"
		}"
		end

	gsl_vector_isneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_isneg"
		}"
		end

	gsl_vector_isnonneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_isnonneg"
		}"
		end

	gsl_vector_isnull (a_v: POINTER): INTEGER is
 		-- gsl_vector_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_isnull"
		}"
		end

	gsl_vector_ispos (a_v: POINTER): INTEGER is
 		-- gsl_vector_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ispos"
		}"
		end

	gsl_vector_max (a_v: POINTER): REAL is
 		-- gsl_vector_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_max"
		}"
		end

	gsl_vector_max_index (a_v: POINTER): like size_t is
 		-- gsl_vector_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_max_index"
		}"
		end

	gsl_vector_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_vector_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_memcpy"
		}"
		end

	gsl_vector_min (a_v: POINTER): REAL is
 		-- gsl_vector_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_min"
		}"
		end

	gsl_vector_min_index (a_v: POINTER): like size_t is
 		-- gsl_vector_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_min_index"
		}"
		end

	gsl_vector_minmax (a_v: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_vector_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_minmax"
		}"
		end

	gsl_vector_minmax_index (a_v: POINTER; an_imin: POINTER; an_imax: POINTER) is
 		-- gsl_vector_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_minmax_index"
		}"
		end

	gsl_vector_mul (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_mul"
		}"
		end

	gsl_vector_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ptr"
		}"
		end

	gsl_vector_reverse (a_v: POINTER): INTEGER is
 		-- gsl_vector_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_reverse"
		}"
		end

	gsl_vector_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_scale"
		}"
		end

	gsl_vector_set (a_v: POINTER; an_i: like size_t; a_x: REAL) is
 		-- gsl_vector_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_set"
		}"
		end

	gsl_vector_set_all (a_v: POINTER; a_x: REAL) is
 		-- gsl_vector_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_set_all"
		}"
		end

	gsl_vector_set_basis (a_v: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_vector_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_set_basis"
		}"
		end

	gsl_vector_set_zero (a_v: POINTER) is
 		-- gsl_vector_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_set_zero"
		}"
		end

	gsl_vector_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_sub"
		}"
		end

	-- function gsl_vector_subvector (at line 105 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	-- function gsl_vector_subvector_with_stride (at line 111 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	gsl_vector_swap (a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_vector_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_swap"
		}"
		end

	gsl_vector_swap_elements (a_v: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_vector_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_swap_elements"
		}"
		end

	-- function gsl_vector_view_array (at line 87 in file /usr/include/gsl/gsl_vector_double.h is not wrappable
	-- function gsl_vector_view_array_with_stride (at line 92 in file /usr/include/gsl/gsl_vector_double.h is not wrappable

end -- class GSL_VECTOR_DOUBLE_EXTERNALS
