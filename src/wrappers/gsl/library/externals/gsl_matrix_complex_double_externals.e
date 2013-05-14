-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_COMPLEX_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_complex_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_complex_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_add"
		}"
		end

	-- function gsl_matrix_complex_add_constant (at line 239 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_add_diagonal (at line 240 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_complex_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_alloc"
		}"
		end

	gsl_matrix_complex_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_complex_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_alloc_from_block"
		}"
		end

	gsl_matrix_complex_alloc_from_matrix (a_b: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_complex_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_alloc_from_matrix"
		}"
		end

	gsl_matrix_complex_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_complex_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_calloc"
		}"
		end

	-- function gsl_matrix_complex_column (at line 106 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_column (at line 161 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_diagonal (at line 164 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_complex_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_const_ptr"
		}"
		end

	-- function gsl_matrix_complex_const_row (at line 157 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_subdiagonal (at line 168 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_submatrix (at line 153 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_subrow (at line 177 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_superdiagonal (at line 172 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_diagonal (at line 109 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_complex_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_div_elements"
		}"
		end

	gsl_matrix_complex_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_complex_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_equal"
		}"
		end

	gsl_matrix_complex_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_complex_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_fprintf"
		}"
		end

	gsl_matrix_complex_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_fread"
		}"
		end

	gsl_matrix_complex_free (a_m: POINTER) is
 		-- gsl_matrix_complex_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_free"
		}"
		end

	gsl_matrix_complex_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_fscanf"
		}"
		end

	gsl_matrix_complex_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_fwrite"
		}"
		end

	-- function gsl_matrix_complex_get (at line 253 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_complex_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_get_col"
		}"
		end

	gsl_matrix_complex_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_complex_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_get_row"
		}"
		end

	gsl_matrix_complex_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_isneg"
		}"
		end

	gsl_matrix_complex_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_isnonneg"
		}"
		end

	gsl_matrix_complex_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_isnull"
		}"
		end

	gsl_matrix_complex_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_ispos"
		}"
		end

	gsl_matrix_complex_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_complex_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_memcpy"
		}"
		end

	gsl_matrix_complex_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_complex_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_mul_elements"
		}"
		end

	gsl_matrix_complex_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_complex_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_ptr"
		}"
		end

	-- function gsl_matrix_complex_row (at line 103 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_scale (at line 238 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_set (at line 254 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_set_all (at line 210 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_complex_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_set_col"
		}"
		end

	gsl_matrix_complex_set_identity (a_m: POINTER) is
 		-- gsl_matrix_complex_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_set_identity"
		}"
		end

	gsl_matrix_complex_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_complex_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_set_row"
		}"
		end

	gsl_matrix_complex_set_zero (a_m: POINTER) is
 		-- gsl_matrix_complex_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_set_zero"
		}"
		end

	gsl_matrix_complex_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_complex_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_sub"
		}"
		end

	-- function gsl_matrix_complex_subcolumn (at line 125 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_subdiagonal (at line 112 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_submatrix (at line 100 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_subrow (at line 120 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_superdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_matrix_complex_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_complex_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_swap"
		}"
		end

	gsl_matrix_complex_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_complex_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_swap_columns"
		}"
		end

	gsl_matrix_complex_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_complex_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_swap_rowcol"
		}"
		end

	gsl_matrix_complex_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_complex_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_swap_rows"
		}"
		end

	gsl_matrix_complex_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_complex_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_transpose"
		}"
		end

	gsl_matrix_complex_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_complex_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_complex_view_array (at line 130 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_view_array_with_tda (at line 136 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_view_vector (at line 141 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	-- function gsl_matrix_complex_view_vector_with_tda (at line 147 in file /usr/include/gsl/gsl_matrix_complex_double.h is not wrappable
	gsl_vector_complex_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_complex_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_alloc_col_from_matrix"
		}"
		end

	gsl_vector_complex_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_complex_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_complex_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_COMPLEX_DOUBLE_EXTERNALS
