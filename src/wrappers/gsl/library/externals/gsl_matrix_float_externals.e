-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_float_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_float_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_add"
		}"
		end

	gsl_matrix_float_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_float_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_add_constant"
		}"
		end

	gsl_matrix_float_add_diagonal (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_float_add_diagonal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_add_diagonal"
		}"
		end

	gsl_matrix_float_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_alloc"
		}"
		end

	gsl_matrix_float_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_float_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_alloc_from_block"
		}"
		end

	gsl_matrix_float_alloc_from_matrix (a_m: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_float_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_alloc_from_matrix"
		}"
		end

	gsl_matrix_float_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_float_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_calloc"
		}"
		end

	-- function gsl_matrix_float_column (at line 109 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_column (at line 163 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_diagonal (at line 166 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	gsl_matrix_float_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_float_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_const_ptr"
		}"
		end

	-- function gsl_matrix_float_const_row (at line 159 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_subdiagonal (at line 170 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_submatrix (at line 155 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_subrow (at line 178 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_superdiagonal (at line 174 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_diagonal (at line 112 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	gsl_matrix_float_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_float_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_div_elements"
		}"
		end

	gsl_matrix_float_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_float_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_equal"
		}"
		end

	gsl_matrix_float_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_float_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fprintf"
		}"
		end

	gsl_matrix_float_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fread"
		}"
		end

	gsl_matrix_float_free (a_m: POINTER) is
 		-- gsl_matrix_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_free"
		}"
		end

	gsl_matrix_float_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fscanf"
		}"
		end

	gsl_matrix_float_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fwrite"
		}"
		end

	gsl_matrix_float_get (a_m: POINTER; an_i: like size_t; a_j: like size_t): REAL_32 is
 		-- gsl_matrix_float_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get"
		}"
		end

	gsl_matrix_float_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_float_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get_col"
		}"
		end

	gsl_matrix_float_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_float_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get_row"
		}"
		end

	gsl_matrix_float_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_isneg"
		}"
		end

	gsl_matrix_float_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_isnonneg"
		}"
		end

	gsl_matrix_float_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_isnull"
		}"
		end

	gsl_matrix_float_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_ispos"
		}"
		end

	gsl_matrix_float_max (a_m: POINTER): REAL_32 is
 		-- gsl_matrix_float_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_max"
		}"
		end

	gsl_matrix_float_max_index (a_m: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_float_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_max_index"
		}"
		end

	gsl_matrix_float_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_float_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_memcpy"
		}"
		end

	gsl_matrix_float_min (a_m: POINTER): REAL_32 is
 		-- gsl_matrix_float_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_min"
		}"
		end

	gsl_matrix_float_min_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER) is
 		-- gsl_matrix_float_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_min_index"
		}"
		end

	gsl_matrix_float_minmax (a_m: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_matrix_float_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_minmax"
		}"
		end

	gsl_matrix_float_minmax_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_float_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_minmax_index"
		}"
		end

	gsl_matrix_float_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_float_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_mul_elements"
		}"
		end

	gsl_matrix_float_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_float_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_ptr"
		}"
		end

	-- function gsl_matrix_float_row (at line 106 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	gsl_matrix_float_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_float_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_scale"
		}"
		end

	gsl_matrix_float_set (a_m: POINTER; an_i: like size_t; a_j: like size_t; a_x: REAL_32) is
 		-- gsl_matrix_float_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set"
		}"
		end

	gsl_matrix_float_set_all (a_m: POINTER; a_x: REAL_32) is
 		-- gsl_matrix_float_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_all"
		}"
		end

	gsl_matrix_float_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_float_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_col"
		}"
		end

	gsl_matrix_float_set_identity (a_m: POINTER) is
 		-- gsl_matrix_float_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_identity"
		}"
		end

	gsl_matrix_float_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_float_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_row"
		}"
		end

	gsl_matrix_float_set_zero (a_m: POINTER) is
 		-- gsl_matrix_float_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_zero"
		}"
		end

	gsl_matrix_float_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_float_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_sub"
		}"
		end

	-- function gsl_matrix_float_subcolumn (at line 126 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_subdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_submatrix (at line 103 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_subrow (at line 122 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_superdiagonal (at line 118 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	gsl_matrix_float_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_float_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap"
		}"
		end

	gsl_matrix_float_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_float_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_columns"
		}"
		end

	gsl_matrix_float_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_float_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_rowcol"
		}"
		end

	gsl_matrix_float_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_float_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_rows"
		}"
		end

	gsl_matrix_float_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_float_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_transpose"
		}"
		end

	gsl_matrix_float_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_float_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_float_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_float_view_array (at line 131 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_view_array_with_tda (at line 137 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_view_vector (at line 143 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	-- function gsl_matrix_float_view_vector_with_tda (at line 149 in file /usr/include/gsl/gsl_matrix_float.h is not wrappable
	gsl_vector_float_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_float_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_float_alloc_col_from_matrix"
		}"
		end

	gsl_vector_float_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_float_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_float_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_FLOAT_EXTERNALS
