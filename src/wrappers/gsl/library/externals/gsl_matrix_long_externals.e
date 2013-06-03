-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_LONG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_long_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_add"
		}"
		end

	gsl_matrix_long_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_add_constant"
		}"
		end

	gsl_matrix_long_add_diagonal (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_add_diagonal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_add_diagonal"
		}"
		end

	gsl_matrix_long_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_alloc"
		}"
		end

	gsl_matrix_long_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_long_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_alloc_from_block"
		}"
		end

	gsl_matrix_long_alloc_from_matrix (a_m: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_alloc_from_matrix"
		}"
		end

	gsl_matrix_long_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_long_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_calloc"
		}"
		end

	-- function gsl_matrix_long_column (at line 109 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_column (at line 163 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_diagonal (at line 166 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	gsl_matrix_long_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_long_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_const_ptr"
		}"
		end

	-- function gsl_matrix_long_const_row (at line 159 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_subdiagonal (at line 170 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_submatrix (at line 155 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_subrow (at line 178 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_superdiagonal (at line 174 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_diagonal (at line 112 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	gsl_matrix_long_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_div_elements"
		}"
		end

	gsl_matrix_long_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_equal"
		}"
		end

	gsl_matrix_long_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_long_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_fprintf"
		}"
		end

	gsl_matrix_long_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_fread"
		}"
		end

	gsl_matrix_long_free (a_m: POINTER) is
 		-- gsl_matrix_long_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_free"
		}"
		end

	gsl_matrix_long_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_fscanf"
		}"
		end

	gsl_matrix_long_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_fwrite"
		}"
		end

	gsl_matrix_long_get (a_m: POINTER; an_i: like size_t; a_j: like size_t): like long is
 		-- gsl_matrix_long_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_get"
		}"
		end

	gsl_matrix_long_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_get_col"
		}"
		end

	gsl_matrix_long_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_long_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_get_row"
		}"
		end

	gsl_matrix_long_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_isneg"
		}"
		end

	gsl_matrix_long_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_isnonneg"
		}"
		end

	gsl_matrix_long_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_isnull"
		}"
		end

	gsl_matrix_long_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_ispos"
		}"
		end

	gsl_matrix_long_max (a_m: POINTER): like long is
 		-- gsl_matrix_long_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_max"
		}"
		end

	gsl_matrix_long_max_index (a_m: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_long_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_max_index"
		}"
		end

	gsl_matrix_long_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_long_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_memcpy"
		}"
		end

	gsl_matrix_long_min (a_m: POINTER): like long is
 		-- gsl_matrix_long_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_min"
		}"
		end

	gsl_matrix_long_min_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER) is
 		-- gsl_matrix_long_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_min_index"
		}"
		end

	gsl_matrix_long_minmax (a_m: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_matrix_long_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_minmax"
		}"
		end

	gsl_matrix_long_minmax_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_long_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_minmax_index"
		}"
		end

	gsl_matrix_long_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_mul_elements"
		}"
		end

	gsl_matrix_long_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_long_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_ptr"
		}"
		end

	-- function gsl_matrix_long_row (at line 106 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	gsl_matrix_long_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_long_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_scale"
		}"
		end

	gsl_matrix_long_set (a_m: POINTER; an_i: like size_t; a_j: like size_t; a_x: like long) is
 		-- gsl_matrix_long_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set"
		}"
		end

	gsl_matrix_long_set_all (a_m: POINTER; a_x: like long) is
 		-- gsl_matrix_long_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set_all"
		}"
		end

	gsl_matrix_long_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_long_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set_col"
		}"
		end

	gsl_matrix_long_set_identity (a_m: POINTER) is
 		-- gsl_matrix_long_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set_identity"
		}"
		end

	gsl_matrix_long_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_long_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set_row"
		}"
		end

	gsl_matrix_long_set_zero (a_m: POINTER) is
 		-- gsl_matrix_long_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_set_zero"
		}"
		end

	gsl_matrix_long_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_long_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_sub"
		}"
		end

	-- function gsl_matrix_long_subcolumn (at line 126 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_subdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_submatrix (at line 103 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_subrow (at line 122 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_superdiagonal (at line 118 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	gsl_matrix_long_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_long_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_swap"
		}"
		end

	gsl_matrix_long_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_swap_columns"
		}"
		end

	gsl_matrix_long_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_swap_rowcol"
		}"
		end

	gsl_matrix_long_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_long_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_swap_rows"
		}"
		end

	gsl_matrix_long_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_long_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_transpose"
		}"
		end

	gsl_matrix_long_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_long_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_long_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_long_view_array (at line 131 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_view_array_with_tda (at line 137 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_view_vector (at line 143 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	-- function gsl_matrix_long_view_vector_with_tda (at line 149 in file /usr/include/gsl/gsl_matrix_long.h is not wrappable
	gsl_vector_long_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_long_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_long_alloc_col_from_matrix"
		}"
		end

	gsl_vector_long_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_long_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_long_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_LONG_EXTERNALS
