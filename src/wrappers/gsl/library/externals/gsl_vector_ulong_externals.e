-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_ULONG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_vector_ulong_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_ulong_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_add"
		}"
		end

	gsl_vector_ulong_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_ulong_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_add_constant"
		}"
		end

	gsl_vector_ulong_alloc (a_n: like size_t): POINTER is
 		-- gsl_vector_ulong_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_alloc"
		}"
		end

	gsl_vector_ulong_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_ulong_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_alloc_from_block"
		}"
		end

	gsl_vector_ulong_alloc_from_vector (a_v: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_ulong_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_alloc_from_vector"
		}"
		end

	gsl_vector_ulong_calloc (a_n: like size_t): POINTER is
 		-- gsl_vector_ulong_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_calloc"
		}"
		end

	gsl_vector_ulong_const_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_ulong_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_const_ptr"
		}"
		end

	-- function gsl_vector_ulong_const_subvector (at line 116 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	-- function gsl_vector_ulong_const_subvector_with_stride (at line 122 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	-- function gsl_vector_ulong_const_view_array (at line 95 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	-- function gsl_vector_ulong_const_view_array_with_stride (at line 100 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	gsl_vector_ulong_div (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_ulong_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_div"
		}"
		end

	gsl_vector_ulong_equal (an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_equal"
		}"
		end

	gsl_vector_ulong_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_vector_ulong_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_fprintf"
		}"
		end

	gsl_vector_ulong_fread (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_fread"
		}"
		end

	gsl_vector_ulong_free (a_v: POINTER) is
 		-- gsl_vector_ulong_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_free"
		}"
		end

	gsl_vector_ulong_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_fscanf"
		}"
		end

	gsl_vector_ulong_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_fwrite"
		}"
		end

	gsl_vector_ulong_get (a_v: POINTER; an_i: like size_t): like long_unsigned is
 		-- gsl_vector_ulong_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_get"
		}"
		end

	gsl_vector_ulong_isneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_isneg"
		}"
		end

	gsl_vector_ulong_isnonneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_isnonneg"
		}"
		end

	gsl_vector_ulong_isnull (a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_isnull"
		}"
		end

	gsl_vector_ulong_ispos (a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_ispos"
		}"
		end

	gsl_vector_ulong_max (a_v: POINTER): like long_unsigned is
 		-- gsl_vector_ulong_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_max"
		}"
		end

	gsl_vector_ulong_max_index (a_v: POINTER): like size_t is
 		-- gsl_vector_ulong_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_max_index"
		}"
		end

	gsl_vector_ulong_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_vector_ulong_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_memcpy"
		}"
		end

	gsl_vector_ulong_min (a_v: POINTER): like long_unsigned is
 		-- gsl_vector_ulong_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_min"
		}"
		end

	gsl_vector_ulong_min_index (a_v: POINTER): like size_t is
 		-- gsl_vector_ulong_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_min_index"
		}"
		end

	gsl_vector_ulong_minmax (a_v: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_vector_ulong_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_minmax"
		}"
		end

	gsl_vector_ulong_minmax_index (a_v: POINTER; an_imin: POINTER; an_imax: POINTER) is
 		-- gsl_vector_ulong_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_minmax_index"
		}"
		end

	gsl_vector_ulong_mul (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_ulong_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_mul"
		}"
		end

	gsl_vector_ulong_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_ulong_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_ptr"
		}"
		end

	gsl_vector_ulong_reverse (a_v: POINTER): INTEGER is
 		-- gsl_vector_ulong_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_reverse"
		}"
		end

	gsl_vector_ulong_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_ulong_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_scale"
		}"
		end

	gsl_vector_ulong_set (a_v: POINTER; an_i: like size_t; a_x: like long_unsigned) is
 		-- gsl_vector_ulong_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_set"
		}"
		end

	gsl_vector_ulong_set_all (a_v: POINTER; a_x: like long_unsigned) is
 		-- gsl_vector_ulong_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_set_all"
		}"
		end

	gsl_vector_ulong_set_basis (a_v: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_vector_ulong_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_set_basis"
		}"
		end

	gsl_vector_ulong_set_zero (a_v: POINTER) is
 		-- gsl_vector_ulong_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_set_zero"
		}"
		end

	gsl_vector_ulong_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_ulong_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_sub"
		}"
		end

	-- function gsl_vector_ulong_subvector (at line 105 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	-- function gsl_vector_ulong_subvector_with_stride (at line 111 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	gsl_vector_ulong_swap (a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_vector_ulong_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_swap"
		}"
		end

	gsl_vector_ulong_swap_elements (a_v: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_vector_ulong_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_ulong_swap_elements"
		}"
		end

	-- function gsl_vector_ulong_view_array (at line 87 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable
	-- function gsl_vector_ulong_view_array_with_stride (at line 92 in file /usr/include/gsl/gsl_vector_ulong.h is not wrappable

end -- class GSL_VECTOR_ULONG_EXTERNALS
