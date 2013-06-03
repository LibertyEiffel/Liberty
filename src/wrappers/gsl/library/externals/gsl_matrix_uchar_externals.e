-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_UCHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_uchar_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_uchar_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_add"
		}"
		end

	gsl_matrix_uchar_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_uchar_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_add_constant"
		}"
		end

	gsl_matrix_uchar_add_diagonal (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_uchar_add_diagonal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_add_diagonal"
		}"
		end

	gsl_matrix_uchar_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_uchar_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_alloc"
		}"
		end

	gsl_matrix_uchar_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_uchar_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_alloc_from_block"
		}"
		end

	gsl_matrix_uchar_alloc_from_matrix (a_m: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_uchar_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_alloc_from_matrix"
		}"
		end

	gsl_matrix_uchar_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_uchar_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_calloc"
		}"
		end

	-- function gsl_matrix_uchar_column (at line 109 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_column (at line 163 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_diagonal (at line 166 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	gsl_matrix_uchar_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_uchar_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_const_ptr"
		}"
		end

	-- function gsl_matrix_uchar_const_row (at line 159 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_subdiagonal (at line 170 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_submatrix (at line 155 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_subrow (at line 178 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_superdiagonal (at line 174 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_diagonal (at line 112 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	gsl_matrix_uchar_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_uchar_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_div_elements"
		}"
		end

	gsl_matrix_uchar_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_uchar_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_equal"
		}"
		end

	gsl_matrix_uchar_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_uchar_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_fprintf"
		}"
		end

	gsl_matrix_uchar_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_fread"
		}"
		end

	gsl_matrix_uchar_free (a_m: POINTER) is
 		-- gsl_matrix_uchar_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_free"
		}"
		end

	gsl_matrix_uchar_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_fscanf"
		}"
		end

	gsl_matrix_uchar_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_fwrite"
		}"
		end

	gsl_matrix_uchar_get (a_m: POINTER; an_i: like size_t; a_j: like size_t): CHARACTER is
 		-- gsl_matrix_uchar_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_get"
		}"
		end

	gsl_matrix_uchar_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_uchar_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_get_col"
		}"
		end

	gsl_matrix_uchar_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_uchar_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_get_row"
		}"
		end

	gsl_matrix_uchar_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_isneg"
		}"
		end

	gsl_matrix_uchar_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_isnonneg"
		}"
		end

	gsl_matrix_uchar_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_isnull"
		}"
		end

	gsl_matrix_uchar_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_ispos"
		}"
		end

	gsl_matrix_uchar_max (a_m: POINTER): CHARACTER is
 		-- gsl_matrix_uchar_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_max"
		}"
		end

	gsl_matrix_uchar_max_index (a_m: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_uchar_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_max_index"
		}"
		end

	gsl_matrix_uchar_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_uchar_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_memcpy"
		}"
		end

	gsl_matrix_uchar_min (a_m: POINTER): CHARACTER is
 		-- gsl_matrix_uchar_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_min"
		}"
		end

	gsl_matrix_uchar_min_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER) is
 		-- gsl_matrix_uchar_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_min_index"
		}"
		end

	gsl_matrix_uchar_minmax (a_m: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_matrix_uchar_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_minmax"
		}"
		end

	gsl_matrix_uchar_minmax_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_uchar_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_minmax_index"
		}"
		end

	gsl_matrix_uchar_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_uchar_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_mul_elements"
		}"
		end

	gsl_matrix_uchar_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_uchar_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_ptr"
		}"
		end

	-- function gsl_matrix_uchar_row (at line 106 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	gsl_matrix_uchar_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_uchar_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_scale"
		}"
		end

	gsl_matrix_uchar_set (a_m: POINTER; an_i: like size_t; a_j: like size_t; a_x: CHARACTER) is
 		-- gsl_matrix_uchar_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set"
		}"
		end

	gsl_matrix_uchar_set_all (a_m: POINTER; a_x: CHARACTER) is
 		-- gsl_matrix_uchar_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set_all"
		}"
		end

	gsl_matrix_uchar_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_uchar_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set_col"
		}"
		end

	gsl_matrix_uchar_set_identity (a_m: POINTER) is
 		-- gsl_matrix_uchar_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set_identity"
		}"
		end

	gsl_matrix_uchar_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_uchar_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set_row"
		}"
		end

	gsl_matrix_uchar_set_zero (a_m: POINTER) is
 		-- gsl_matrix_uchar_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_set_zero"
		}"
		end

	gsl_matrix_uchar_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_uchar_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_sub"
		}"
		end

	-- function gsl_matrix_uchar_subcolumn (at line 126 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_subdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_submatrix (at line 103 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_subrow (at line 122 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_superdiagonal (at line 118 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	gsl_matrix_uchar_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_uchar_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_swap"
		}"
		end

	gsl_matrix_uchar_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_uchar_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_swap_columns"
		}"
		end

	gsl_matrix_uchar_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_uchar_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_swap_rowcol"
		}"
		end

	gsl_matrix_uchar_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_uchar_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_swap_rows"
		}"
		end

	gsl_matrix_uchar_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_uchar_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_transpose"
		}"
		end

	gsl_matrix_uchar_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_uchar_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_uchar_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_uchar_view_array (at line 131 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_view_array_with_tda (at line 137 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_view_vector (at line 143 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	-- function gsl_matrix_uchar_view_vector_with_tda (at line 149 in file /usr/include/gsl/gsl_matrix_uchar.h is not wrappable
	gsl_vector_uchar_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_uchar_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_alloc_col_from_matrix"
		}"
		end

	gsl_vector_uchar_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_uchar_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_UCHAR_EXTERNALS
