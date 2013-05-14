-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_LONG_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_long_double_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_double_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_add"
		}"
		end

	gsl_matrix_long_double_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_double_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_add_constant"
		}"
		end

	gsl_matrix_long_double_add_diagonal (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_double_add_diagonal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_add_diagonal"
		}"
		end

	gsl_matrix_long_double_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_double_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_alloc"
		}"
		end

	gsl_matrix_long_double_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_long_double_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_alloc_from_block"
		}"
		end

	gsl_matrix_long_double_alloc_from_matrix (a_m: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_double_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_alloc_from_matrix"
		}"
		end

	gsl_matrix_long_double_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_double_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_calloc"
		}"
		end

	-- function gsl_matrix_long_double_column (at line 109 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_column (at line 163 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_diagonal (at line 166 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	gsl_matrix_long_double_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_long_double_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_const_ptr"
		}"
		end

	-- function gsl_matrix_long_double_const_row (at line 159 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_subdiagonal (at line 170 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_submatrix (at line 155 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_subrow (at line 178 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_superdiagonal (at line 174 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_diagonal (at line 112 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	gsl_matrix_long_double_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_double_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_div_elements"
		}"
		end

	gsl_matrix_long_double_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_double_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_equal"
		}"
		end

	gsl_matrix_long_double_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_long_double_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_fprintf"
		}"
		end

	gsl_matrix_long_double_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_fread"
		}"
		end

	gsl_matrix_long_double_free (a_m: POINTER) is
 		-- gsl_matrix_long_double_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_free"
		}"
		end

	gsl_matrix_long_double_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_fscanf"
		}"
		end

	gsl_matrix_long_double_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_fwrite"
		}"
		end

	gsl_matrix_long_double_get (a_m: POINTER; an_i: like size_t; a_j: like size_t): REAL_EXTENDED is
 		-- gsl_matrix_long_double_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_get"
		}"
		end

	gsl_matrix_long_double_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_double_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_get_col"
		}"
		end

	gsl_matrix_long_double_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_long_double_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_get_row"
		}"
		end

	gsl_matrix_long_double_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_isneg"
		}"
		end

	gsl_matrix_long_double_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_isnonneg"
		}"
		end

	gsl_matrix_long_double_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_isnull"
		}"
		end

	gsl_matrix_long_double_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_ispos"
		}"
		end

	gsl_matrix_long_double_max (a_m: POINTER): REAL_EXTENDED is
 		-- gsl_matrix_long_double_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_max"
		}"
		end

	gsl_matrix_long_double_max_index (a_m: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_long_double_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_max_index"
		}"
		end

	gsl_matrix_long_double_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_long_double_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_memcpy"
		}"
		end

	gsl_matrix_long_double_min (a_m: POINTER): REAL_EXTENDED is
 		-- gsl_matrix_long_double_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_min"
		}"
		end

	gsl_matrix_long_double_min_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER) is
 		-- gsl_matrix_long_double_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_min_index"
		}"
		end

	gsl_matrix_long_double_minmax (a_m: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_matrix_long_double_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_minmax"
		}"
		end

	gsl_matrix_long_double_minmax_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_long_double_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_minmax_index"
		}"
		end

	gsl_matrix_long_double_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_double_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_mul_elements"
		}"
		end

	gsl_matrix_long_double_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_long_double_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_ptr"
		}"
		end

	-- function gsl_matrix_long_double_row (at line 106 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	gsl_matrix_long_double_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_double_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_scale"
		}"
		end

	gsl_matrix_long_double_set (a_m: POINTER; an_i: like size_t; a_j: like size_t; a_x: REAL_EXTENDED) is
 		-- gsl_matrix_long_double_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set"
		}"
		end

	gsl_matrix_long_double_set_all (a_m: POINTER; a_x: REAL_EXTENDED) is
 		-- gsl_matrix_long_double_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set_all"
		}"
		end

	gsl_matrix_long_double_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_long_double_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set_col"
		}"
		end

	gsl_matrix_long_double_set_identity (a_m: POINTER) is
 		-- gsl_matrix_long_double_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set_identity"
		}"
		end

	gsl_matrix_long_double_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_long_double_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set_row"
		}"
		end

	gsl_matrix_long_double_set_zero (a_m: POINTER) is
 		-- gsl_matrix_long_double_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_set_zero"
		}"
		end

	gsl_matrix_long_double_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_double_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_sub"
		}"
		end

	-- function gsl_matrix_long_double_subcolumn (at line 126 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_subdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_submatrix (at line 103 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_subrow (at line 122 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_superdiagonal (at line 118 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	gsl_matrix_long_double_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_long_double_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_swap"
		}"
		end

	gsl_matrix_long_double_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_double_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_swap_columns"
		}"
		end

	gsl_matrix_long_double_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_double_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_swap_rowcol"
		}"
		end

	gsl_matrix_long_double_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_double_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_swap_rows"
		}"
		end

	gsl_matrix_long_double_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_double_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_transpose"
		}"
		end

	gsl_matrix_long_double_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_long_double_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_double_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_long_double_view_array (at line 131 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_view_array_with_tda (at line 137 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_view_vector (at line 143 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	-- function gsl_matrix_long_double_view_vector_with_tda (at line 149 in file /usr/include/gsl/gsl_matrix_long_double.h is not wrappable
	gsl_vector_long_double_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_long_double_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_long_double_alloc_col_from_matrix"
		}"
		end

	gsl_vector_long_double_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_long_double_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_long_double_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_LONG_DOUBLE_EXTERNALS
