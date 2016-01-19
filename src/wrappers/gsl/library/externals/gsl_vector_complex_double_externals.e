-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_COMPLEX_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_vector_complex_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_add"
		}"
		end

	-- function gsl_vector_complex_add_constant (at line 180 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_alloc (a_n: like size_t): POINTER is
 		-- gsl_vector_complex_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_alloc"
		}"
		end

	gsl_vector_complex_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_complex_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_alloc_from_block"
		}"
		end

	gsl_vector_complex_alloc_from_vector (a_v: POINTER; an_offset: like size_t; a_n: like size_t; a_stride: like size_t): POINTER is
 		-- gsl_vector_complex_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_alloc_from_vector"
		}"
		end

	gsl_vector_complex_calloc (a_n: like size_t): POINTER is
 		-- gsl_vector_complex_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_calloc"
		}"
		end

	-- function gsl_vector_complex_const_imag (at line 140 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_const_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_complex_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_const_ptr"
		}"
		end

	-- function gsl_vector_complex_const_real (at line 137 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_const_subvector (at line 121 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_const_subvector_with_stride (at line 128 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_const_view_array (at line 99 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_const_view_array_with_stride (at line 104 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_div (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_div"
		}"
		end

	gsl_vector_complex_equal (an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_equal"
		}"
		end

	gsl_vector_complex_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_vector_complex_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_fprintf"
		}"
		end

	gsl_vector_complex_fread (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_fread"
		}"
		end

	gsl_vector_complex_free (a_v: POINTER) is
 		-- gsl_vector_complex_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_free"
		}"
		end

	gsl_vector_complex_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_fscanf"
		}"
		end

	gsl_vector_complex_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_fwrite"
		}"
		end

	-- function gsl_vector_complex_get (at line 182 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_imag (at line 134 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_isneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_isneg"
		}"
		end

	gsl_vector_complex_isnonneg (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_isnonneg"
		}"
		end

	gsl_vector_complex_isnull (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_isnull"
		}"
		end

	gsl_vector_complex_ispos (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_ispos"
		}"
		end

	gsl_vector_complex_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_vector_complex_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_memcpy"
		}"
		end

	gsl_vector_complex_mul (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_mul"
		}"
		end

	gsl_vector_complex_ptr (a_v: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_complex_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_ptr"
		}"
		end

	-- function gsl_vector_complex_real (at line 131 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_reverse (a_v: POINTER): INTEGER is
 		-- gsl_vector_complex_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_reverse"
		}"
		end

	-- function gsl_vector_complex_scale (at line 179 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_set (at line 183 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_set_all (at line 147 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_set_basis (a_v: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_vector_complex_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_set_basis"
		}"
		end

	gsl_vector_complex_set_zero (a_v: POINTER) is
 		-- gsl_vector_complex_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_set_zero"
		}"
		end

	gsl_vector_complex_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_vector_complex_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_sub"
		}"
		end

	-- function gsl_vector_complex_subvector (at line 109 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_subvector_with_stride (at line 116 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	gsl_vector_complex_swap (a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_vector_complex_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_swap"
		}"
		end

	gsl_vector_complex_swap_elements (a_v: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_vector_complex_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_swap_elements"
		}"
		end

	-- function gsl_vector_complex_view_array (at line 90 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable
	-- function gsl_vector_complex_view_array_with_stride (at line 95 in file /usr/include/gsl/gsl_vector_complex_double.h is not wrappable

end -- class GSL_VECTOR_COMPLEX_DOUBLE_EXTERNALS
