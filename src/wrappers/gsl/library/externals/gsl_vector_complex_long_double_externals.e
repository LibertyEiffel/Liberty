-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_COMPLEX_LONG_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_vector_complex_long_double_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_add"
		}"
		end

	-- function gsl_vector_complex_long_double_add_constant (at line 180 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_alloc (a_n: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_alloc"
		}"
		end

	gsl_vector_complex_long_double_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_alloc_from_block"
		}"
		end

	gsl_vector_complex_long_double_alloc_from_vector (a_v: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_alloc_from_vector"
		}"
		end

	gsl_vector_complex_long_double_calloc (a_n: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_calloc"
		}"
		end

	-- function gsl_vector_complex_long_double_const_imag (at line 140 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_const_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_const_ptr"
		}"
		end

	-- function gsl_vector_complex_long_double_const_real (at line 137 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_const_subvector (at line 121 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_const_subvector_with_stride (at line 128 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_const_view_array (at line 99 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_const_view_array_with_stride (at line 104 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_div (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_div"
		}"
		end

	gsl_vector_complex_long_double_equal (an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_equal"
		}"
		end

	gsl_vector_complex_long_double_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_fprintf"
		}"
		end

	gsl_vector_complex_long_double_fread (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_fread"
		}"
		end

	gsl_vector_complex_long_double_free (a_v: POINTER) is
 		-- gsl_vector_complex_long_double_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_free"
		}"
		end

	gsl_vector_complex_long_double_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_fscanf"
		}"
		end

	gsl_vector_complex_long_double_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_fwrite"
		}"
		end

	-- function gsl_vector_complex_long_double_get (at line 182 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_imag (at line 134 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_isneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_isneg"
		}"
		end

	gsl_vector_complex_long_double_isnonneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_isnonneg"
		}"
		end

	gsl_vector_complex_long_double_isnull (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_isnull"
		}"
		end

	gsl_vector_complex_long_double_ispos (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_ispos"
		}"
		end

	gsl_vector_complex_long_double_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_memcpy"
		}"
		end

	gsl_vector_complex_long_double_mul (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_mul"
		}"
		end

	gsl_vector_complex_long_double_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_complex_long_double_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_ptr"
		}"
		end

	-- function gsl_vector_complex_long_double_real (at line 131 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_reverse (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_reverse"
		}"
		end

	-- function gsl_vector_complex_long_double_scale (at line 179 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_set (at line 183 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_set_all (at line 147 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_set_basis (a_v: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_vector_complex_long_double_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_set_basis"
		}"
		end

	gsl_vector_complex_long_double_set_zero (a_v: POINTER) is
 		-- gsl_vector_complex_long_double_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_set_zero"
		}"
		end

	gsl_vector_complex_long_double_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_sub"
		}"
		end

	-- function gsl_vector_complex_long_double_subvector (at line 109 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_subvector_with_stride (at line 116 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	gsl_vector_complex_long_double_swap (a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_vector_complex_long_double_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_swap"
		}"
		end

	gsl_vector_complex_long_double_swap_elements (a_v: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_vector_complex_long_double_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_long_double_swap_elements"
		}"
		end

	-- function gsl_vector_complex_long_double_view_array (at line 90 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable
	-- function gsl_vector_complex_long_double_view_array_with_stride (at line 95 in file /usr/include/gsl/gsl_vector_complex_long_double.h is not wrappable

end -- class GSL_VECTOR_COMPLEX_LONG_DOUBLE_EXTERNALS
