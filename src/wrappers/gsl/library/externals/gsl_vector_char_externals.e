-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_CHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_vector_char_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_char_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_add"
		}"
		end

	gsl_vector_char_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_char_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_add_constant"
		}"
		end

	gsl_vector_char_alloc (a_n: like size_t): POINTER is
 		-- gsl_vector_char_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_alloc"
		}"
		end

	gsl_vector_char_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_char_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_alloc_from_block"
		}"
		end

	gsl_vector_char_alloc_from_vector (a_v: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_char_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_alloc_from_vector"
		}"
		end

	gsl_vector_char_calloc (a_n: like size_t): POINTER is
 		-- gsl_vector_char_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_calloc"
		}"
		end

	gsl_vector_char_const_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_char_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_const_ptr"
		}"
		end

	-- function gsl_vector_char_const_subvector (at line 116 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	-- function gsl_vector_char_const_subvector_with_stride (at line 122 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	-- function gsl_vector_char_const_view_array (at line 95 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	-- function gsl_vector_char_const_view_array_with_stride (at line 100 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	gsl_vector_char_div (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_char_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_div"
		}"
		end

	gsl_vector_char_equal (an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_char_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_equal"
		}"
		end

	gsl_vector_char_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_vector_char_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_fprintf"
		}"
		end

	gsl_vector_char_fread (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_char_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_fread"
		}"
		end

	gsl_vector_char_free (a_v: POINTER) is
 		-- gsl_vector_char_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_free"
		}"
		end

	gsl_vector_char_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_char_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_fscanf"
		}"
		end

	gsl_vector_char_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_char_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_fwrite"
		}"
		end

	gsl_vector_char_get (a_v: POINTER; an_i: like size_t): CHARACTER is
 		-- gsl_vector_char_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_get"
		}"
		end

	gsl_vector_char_isneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_char_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_isneg"
		}"
		end

	gsl_vector_char_isnonneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_char_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_isnonneg"
		}"
		end

	gsl_vector_char_isnull (a_v: POINTER): INTEGER is
 		-- gsl_vector_char_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_isnull"
		}"
		end

	gsl_vector_char_ispos (a_v: POINTER): INTEGER is
 		-- gsl_vector_char_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_ispos"
		}"
		end

	gsl_vector_char_max (a_v: POINTER): CHARACTER is
 		-- gsl_vector_char_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_max"
		}"
		end

	gsl_vector_char_max_index (a_v: POINTER): like size_t is
 		-- gsl_vector_char_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_max_index"
		}"
		end

	gsl_vector_char_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_vector_char_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_memcpy"
		}"
		end

	gsl_vector_char_min (a_v: POINTER): CHARACTER is
 		-- gsl_vector_char_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_min"
		}"
		end

	gsl_vector_char_min_index (a_v: POINTER): like size_t is
 		-- gsl_vector_char_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_min_index"
		}"
		end

	gsl_vector_char_minmax (a_v: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_vector_char_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_minmax"
		}"
		end

	gsl_vector_char_minmax_index (a_v: POINTER; an_imin: POINTER; an_imax: POINTER) is
 		-- gsl_vector_char_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_minmax_index"
		}"
		end

	gsl_vector_char_mul (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_char_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_mul"
		}"
		end

	gsl_vector_char_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_char_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_ptr"
		}"
		end

	gsl_vector_char_reverse (a_v: POINTER): INTEGER is
 		-- gsl_vector_char_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_reverse"
		}"
		end

	gsl_vector_char_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_vector_char_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_scale"
		}"
		end

	gsl_vector_char_set (a_v: POINTER; an_i: like size_t; a_x: CHARACTER) is
 		-- gsl_vector_char_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_set"
		}"
		end

	gsl_vector_char_set_all (a_v: POINTER; a_x: CHARACTER) is
 		-- gsl_vector_char_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_set_all"
		}"
		end

	gsl_vector_char_set_basis (a_v: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_vector_char_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_set_basis"
		}"
		end

	gsl_vector_char_set_zero (a_v: POINTER) is
 		-- gsl_vector_char_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_set_zero"
		}"
		end

	gsl_vector_char_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_char_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_sub"
		}"
		end

	-- function gsl_vector_char_subvector (at line 105 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	-- function gsl_vector_char_subvector_with_stride (at line 111 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	gsl_vector_char_swap (a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_vector_char_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_swap"
		}"
		end

	gsl_vector_char_swap_elements (a_v: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_vector_char_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_char_swap_elements"
		}"
		end

	-- function gsl_vector_char_view_array (at line 87 in file /usr/include/gsl/gsl_vector_char.h is not wrappable
	-- function gsl_vector_char_view_array_with_stride (at line 92 in file /usr/include/gsl/gsl_vector_char.h is not wrappable

end -- class GSL_VECTOR_CHAR_EXTERNALS
