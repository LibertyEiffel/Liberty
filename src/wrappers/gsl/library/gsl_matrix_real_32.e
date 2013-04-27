indexing
	description: "real 32 matrix"
	copyright: "(C) 2006 Paolo Redaelli %
	%Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GSL_MATRIX_REAL_32

inherit
	COLLECTION2 [REAL_32]
		undefine
			out
		end
	
insert
	GSL_MATRIX_GENERAL[REAL_32]
	
create {ANY} make, make_zero, make_identity, from_collection2, from_model, copy, manifest_creation
	
feature {ANY}
	get_column (i: INTEGER_32): GSL_VECTOR_REAL_32 is
		do
			create Result.make(line_count)
			handle_code(gsl_matrix_get_col (Result.handle, handle, i))
		end

	get_row (i: INTEGER_32): GSL_VECTOR_REAL_32 is
		do
			create Result.make(column_count)
			handle_code(gsl_matrix_get_row (Result.handle, handle, i))
		end

feature {} -- External calls

	gsl_matrix_alloc (a_n1, a_n2: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_alloc"
			}"
		end
	
	gsl_matrix_calloc (n1,n2: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_calloc"
			}"
		end
	
	gsl_matrix_free (a_gsl_matrix: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_free"
			}"
		end

	gsl_matrix_get (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get"
			}"
		end

	gsl_matrix_set (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32; an_x: REAL_32) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set"
			}"
		end

	gsl_matrix_ptr (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32): POINTER  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_ptr"
			}"
		end

	gsl_matrix_set_all (a_gsl_matrix: POINTER; an_x: REAL_32) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_all"
			}"
		end

	gsl_matrix_set_zero (a_gsl_matrix: POINTER)  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_zero"
			}"
		end

	gsl_matrix_set_identity (a_gsl_matrix: POINTER)  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_identity"
			}"
		end

	gsl_matrix_fwrite (a_stream, a_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fwrite"
			}"
		end

	gsl_matrix_fread (a_stream, a_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fread"
			}"
		end

	gsl_matrix_fprintf (a_stream, a_gsl_matrix, a_format: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fprintf"
			}"
		end
	
	gsl_matrix_fscanf (a_stream, a_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_fscanf"
			}"
		end
	
	gsl_matrix_memcpy (a_dest, a_src: POINTER): INTEGER_32   is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_memcpy"
			}"
		end

	gsl_matrix_swap (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap"
			}"
		end

	gsl_matrix_get_row (a_vector, a_gsl_matrix: POINTER; an_i: INTEGER_32): INTEGER_32   is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get_row"
			}"
		end

	gsl_matrix_get_col (a_gsl_vector, a_gsl_matrix: POINTER; a_j: INTEGER_32): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_get_col"
			}"
		end

	gsl_matrix_set_row (a_gsl_matrix: POINTER; an_i: INTEGER_32; a_gsl_vector: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_row"
			}"
		end

	gsl_matrix_set_col (a_gsl_matrix: POINTER; an_j: INTEGER_32; a_gsl_vector: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_set_col"
			}"
		end

	gsl_matrix_swap_rows (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_rows"
			}"
		end

	gsl_matrix_swap_columns (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_columns"
			}"
		end

	gsl_matrix_swap_rowcol (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_swap_rowcol"
			}"
		end

	gsl_matrix_transpose_memcpy (a_gsl_matrix_dest, a_gsl_matrix_src: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_transpose_memcpy"
			}"
		end

	gsl_matrix_transpose (a_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_transpose"
			}"
		end


	gsl_matrix_add (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_add"
			}"
		end

	gsl_matrix_sub (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_sub"
			}"
		end

	gsl_matrix_mul_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_mul_elements"
			}"
		end
	
	gsl_matrix_div_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_div_elements"
			}"
		end
	
	gsl_matrix_scale (a_gsl_matrix: POINTER; a_scale: REAL_64): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_scale"
			}"
		end
	
	gsl_matrix_add_constant (a_gsl_matrix: POINTER; a_constant: REAL_64): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_add_constant"
			}"
		end

	
	gsl_matrix_max (a_gsl_matrix: POINTER): REAL_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_max"
			}"
		end
	
	gsl_matrix_min (a_gsl_matrix: POINTER): REAL_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_min"
			}"
		end

	gsl_matrix_minmax (a_gsl_matrix, a_min_out, a_max_out: POINTER)  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_minmax"
			}"
		end

	gsl_matrix_max_index (a_gsl_matrix, an_imax_ptr, a_jmax_ptr: POINTER)  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_max_index"
			}"
		end

	gsl_matrix_min_index (a_gsl_matrix, an_imin_ptr, a_jmin_ptr: POINTER)  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_min_index"
			}"
		end

	gsl_matrix_minmax_index (matrix, imin_ptr, jmin_ptr, imax_ptr, jmax_ptr : POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_minmax_index"
		}"
		end

	gsl_matrix_isnull (a_gsl_matrix: POINTER): INTEGER_32  is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_matrix_float_isnull"
			}"
		end

feature {} -- Accessing gsl_matrix struct

	c_structure_size: INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_c_struct_size"
			}"
		end

	get_size1 (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_size1"
			}"
		end

	get_size2 (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_size2"
			}"
		end

	get_tda (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_tda"
			}"
		end

	get_data (a_matrix: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_data"
			}"
		end
	
	get_block  (a_matrix: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_block"
			}"
		end

	get_owner (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "matrix_float_owner"
			}"
		end

	gsl_blas_gemv(trans_a: INTEGER_32; alpha: REAL_32; a_p, x_p:POINTER; beta: REAL_32; y_p: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_sgemv"
			}"
		end
	
	gsl_blas_gemm(trans_a, trans_b: INTEGER_32; alpha: REAL_32; a_p: POINTER; b_p: POINTER; beta: REAL_32; c_p: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_sgemm"
			}"
		end	
	
end
