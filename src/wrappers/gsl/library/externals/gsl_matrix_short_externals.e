-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_SHORT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_matrix_short_add (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_short_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_add"
		}"
		end

	gsl_matrix_short_add_constant (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_short_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_add_constant"
		}"
		end

	gsl_matrix_short_add_diagonal (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_short_add_diagonal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_add_diagonal"
		}"
		end

	gsl_matrix_short_alloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_short_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_alloc"
		}"
		end

	gsl_matrix_short_alloc_from_block (a_b: POINTER; an_offset: like size_t; a_n1: like size_t; a_n2: like size_t; a_d2: like size_t): POINTER is
 		-- gsl_matrix_short_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_alloc_from_block"
		}"
		end

	gsl_matrix_short_alloc_from_matrix (a_m: POINTER; a_k1: like size_t; a_k2: like size_t; a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_short_alloc_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_alloc_from_matrix"
		}"
		end

	gsl_matrix_short_calloc (a_n1: like size_t; a_n2: like size_t): POINTER is
 		-- gsl_matrix_short_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_calloc"
		}"
		end

	-- function gsl_matrix_short_column (at line 109 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_column (at line 163 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_diagonal (at line 166 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	gsl_matrix_short_const_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_short_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_const_ptr"
		}"
		end

	-- function gsl_matrix_short_const_row (at line 159 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_subcolumn (at line 182 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_subdiagonal (at line 170 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_submatrix (at line 155 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_subrow (at line 178 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_superdiagonal (at line 174 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_view_array (at line 187 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_view_array_with_tda (at line 193 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_view_vector (at line 198 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_const_view_vector_with_tda (at line 204 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_diagonal (at line 112 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	gsl_matrix_short_div_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_short_div_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_div_elements"
		}"
		end

	gsl_matrix_short_equal (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_short_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_equal"
		}"
		end

	gsl_matrix_short_fprintf (a_stream: POINTER; a_m: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_matrix_short_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_fprintf"
		}"
		end

	gsl_matrix_short_fread (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_fread"
		}"
		end

	gsl_matrix_short_free (a_m: POINTER) is
 		-- gsl_matrix_short_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_free"
		}"
		end

	gsl_matrix_short_fscanf (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_fscanf"
		}"
		end

	gsl_matrix_short_fwrite (a_stream: POINTER; a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_fwrite"
		}"
		end

	gsl_matrix_short_get (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER_16 is
 		-- gsl_matrix_short_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_get"
		}"
		end

	gsl_matrix_short_get_col (a_v: POINTER; a_m: POINTER; a_j: like size_t): INTEGER is
 		-- gsl_matrix_short_get_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_get_col"
		}"
		end

	gsl_matrix_short_get_row (a_v: POINTER; a_m: POINTER; an_i: like size_t): INTEGER is
 		-- gsl_matrix_short_get_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_get_row"
		}"
		end

	gsl_matrix_short_isneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_isneg"
		}"
		end

	gsl_matrix_short_isnonneg (a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_isnonneg"
		}"
		end

	gsl_matrix_short_isnull (a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_isnull"
		}"
		end

	gsl_matrix_short_ispos (a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_ispos"
		}"
		end

	gsl_matrix_short_max (a_m: POINTER): INTEGER_16 is
 		-- gsl_matrix_short_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_max"
		}"
		end

	gsl_matrix_short_max_index (a_m: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_short_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_max_index"
		}"
		end

	gsl_matrix_short_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_short_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_memcpy"
		}"
		end

	gsl_matrix_short_min (a_m: POINTER): INTEGER_16 is
 		-- gsl_matrix_short_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_min"
		}"
		end

	gsl_matrix_short_min_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER) is
 		-- gsl_matrix_short_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_min_index"
		}"
		end

	gsl_matrix_short_minmax (a_m: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_matrix_short_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_minmax"
		}"
		end

	gsl_matrix_short_minmax_index (a_m: POINTER; an_imin: POINTER; a_jmin: POINTER; an_imax: POINTER; a_jmax: POINTER) is
 		-- gsl_matrix_short_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_minmax_index"
		}"
		end

	gsl_matrix_short_mul_elements (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_short_mul_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_mul_elements"
		}"
		end

	gsl_matrix_short_ptr (a_m: POINTER; an_i: like size_t; a_j: like size_t): POINTER is
 		-- gsl_matrix_short_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_ptr"
		}"
		end

	-- function gsl_matrix_short_row (at line 106 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	gsl_matrix_short_scale (an_a: POINTER; a_x: REAL): INTEGER is
 		-- gsl_matrix_short_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_scale"
		}"
		end

	gsl_matrix_short_set (a_m: POINTER; an_i: like size_t; a_j: like size_t; a_x: INTEGER_16) is
 		-- gsl_matrix_short_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set"
		}"
		end

	gsl_matrix_short_set_all (a_m: POINTER; a_x: INTEGER_16) is
 		-- gsl_matrix_short_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set_all"
		}"
		end

	gsl_matrix_short_set_col (a_m: POINTER; a_j: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_short_set_col
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set_col"
		}"
		end

	gsl_matrix_short_set_identity (a_m: POINTER) is
 		-- gsl_matrix_short_set_identity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set_identity"
		}"
		end

	gsl_matrix_short_set_row (a_m: POINTER; an_i: like size_t; a_v: POINTER): INTEGER is
 		-- gsl_matrix_short_set_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set_row"
		}"
		end

	gsl_matrix_short_set_zero (a_m: POINTER) is
 		-- gsl_matrix_short_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_set_zero"
		}"
		end

	gsl_matrix_short_sub (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_matrix_short_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_sub"
		}"
		end

	-- function gsl_matrix_short_subcolumn (at line 126 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_subdiagonal (at line 115 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_submatrix (at line 103 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_subrow (at line 122 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_superdiagonal (at line 118 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	gsl_matrix_short_swap (a_m1: POINTER; a_m2: POINTER): INTEGER is
 		-- gsl_matrix_short_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_swap"
		}"
		end

	gsl_matrix_short_swap_columns (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_short_swap_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_swap_columns"
		}"
		end

	gsl_matrix_short_swap_rowcol (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_short_swap_rowcol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_swap_rowcol"
		}"
		end

	gsl_matrix_short_swap_rows (a_m: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_matrix_short_swap_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_swap_rows"
		}"
		end

	gsl_matrix_short_transpose (a_m: POINTER): INTEGER is
 		-- gsl_matrix_short_transpose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_transpose"
		}"
		end

	gsl_matrix_short_transpose_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_matrix_short_transpose_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_short_transpose_memcpy"
		}"
		end

	-- function gsl_matrix_short_view_array (at line 131 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_view_array_with_tda (at line 137 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_view_vector (at line 143 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	-- function gsl_matrix_short_view_vector_with_tda (at line 149 in file /usr/include/gsl/gsl_matrix_short.h is not wrappable
	gsl_vector_short_alloc_col_from_matrix (a_m: POINTER; a_j: like size_t): POINTER is
 		-- gsl_vector_short_alloc_col_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_short_alloc_col_from_matrix"
		}"
		end

	gsl_vector_short_alloc_row_from_matrix (a_m: POINTER; an_i: like size_t): POINTER is
 		-- gsl_vector_short_alloc_row_from_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_short_alloc_row_from_matrix"
		}"
		end


end -- class GSL_MATRIX_SHORT_EXTERNALS
