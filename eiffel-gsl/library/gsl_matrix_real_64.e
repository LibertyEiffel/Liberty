indexing
	description: "real 64 matrix"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>%
              %    2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GSL_MATRIX_REAL_64
   
inherit
   COLLECTION2 [REAL_64]
      undefine
         out
      end

insert
	GSL_MATRIX_GENERAL[REAL_64]


creation make, make_zero, make_identity, from_model, from_collection2, manifest_creation

feature {} -- External calls

	gsl_matrix_alloc (a_n1, a_n2: INTEGER): POINTER is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_calloc (n1,n2: INTEGER): POINTER is
      external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_free (a_gsl_matrix: POINTER) is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_get (a_gsl_matrix: POINTER; a_i, a_j: INTEGER): REAL is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set (a_gsl_matrix: POINTER; a_i, a_j: INTEGER; an_x: REAL) is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_ptr (a_gsl_matrix: POINTER; a_i, a_j: INTEGER): POINTER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set_all (a_gsl_matrix: POINTER; an_x: REAL) is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set_zero (a_gsl_matrix: POINTER)  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set_identity (a_gsl_matrix: POINTER)  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_fwrite (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_fread (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_fprintf (a_stream, a_gsl_matrix, a_format: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_fscanf (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	-- TODO: gsl_matrix_view gsl_matrix_submatrix (a_gsl_matrix: POINTER, k1: INTEGER, k2: INTEGER, n1: INTEGER, n2: INTEGER)
	-- TODO gsl_matrix_const_view gsl_matrix_const_submatrix (const a_gsl_matrix: POINTER, k1: INTEGER, k2: INTEGER, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_array (double * base, n1: INTEGER, n2: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_array (const double * base, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_array_with_tda (double * base, n1: INTEGER, n2: INTEGER, tda: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_array_with_tda (const double * base, n1: INTEGER, n2: INTEGER, tda: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_vector (gsl_vector * v, n1: INTEGER, n2: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_vector (const gsl_vector * v, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_vector_with_tda (gsl_vector * v, n1: INTEGER, n2: INTEGER, tda: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_vector_with_tda (const gsl_vector * v, n1: INTEGER, n2: INTEGER, tda: INTEGER)

	gsl_matrix_memcpy (a_dest, a_src: POINTER): INTEGER   is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_swap (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_get_row (a_vector, a_gsl_matrix: POINTER; an_i: INTEGER): INTEGER   is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_get_col (a_gsl_vector, a_gsl_matrix: POINTER; a_j: INTEGER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set_row (a_gsl_matrix: POINTER; an_i: INTEGER; a_gsl_vector: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_set_col (a_gsl_matrix: POINTER; an_j: INTEGER; a_gsl_vector: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_swap_rows (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_swap_columns (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_swap_rowcol (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_transpose_memcpy (a_gsl_matrix_dest, a_gsl_matrix_src: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_transpose (a_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end


	gsl_matrix_add (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_sub (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_mul_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_div_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_scale (a_gsl_matrix: POINTER; a_scale: REAL): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_add_constant (a_gsl_matrix: POINTER; a_constant: REAL): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

	
	gsl_matrix_max (a_gsl_matrix: POINTER): REAL  is
		external "C use <gsl/gsl_matrix.h>"
		end
	
	gsl_matrix_min (a_gsl_matrix: POINTER): REAL  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_minmax (a_gsl_matrix, a_min_out, a_max_out: POINTER)  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_max_index (a_gsl_matrix, an_imax_ptr, a_jmax_ptr: POINTER)  is
		external "C use <gsl/gsl_matrix.h>"
		end

	gsl_matrix_min_index (a_gsl_matrix, an_imin_ptr, a_jmin_ptr: POINTER)  is
		external "C use <gsl/gsl_matrix.h>"
		end

		-- TODO: void gsl_matrix_minmax_index (const a_gsl_matrix: POINTER, size_t * imin, size_t * imax)
		-- Documentation and declaration mismatch! This function returns the indices of the minimum and maximum values in the matrix m, storing them in (imin,jmin) and (imax,jmax). When there are several equal minimum or maximum elements then the first elements found are returned, searching in row-major order. 
	
	gsl_matrix_isnull (a_gsl_matrix: POINTER): INTEGER  is
		external "C use <gsl/gsl_matrix.h>"
		end

feature {}-- Accessing gsl_matrix struct

	c_structure_size: INTEGER is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_c_struct_size"
         }"
		end

	get_size1 (a_matrix: POINTER): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_size1"
         }"
		end

	get_size2 (a_matrix: POINTER): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_size2"
         }"
		end

	get_tda (a_matrix: POINTER): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_tda"
         }"
		end

	get_data (a_matrix: POINTER): POINTER is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_data"
         }"
		end
	
	get_block  (a_matrix: POINTER): POINTER is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_block"
         }"
		end

	get_owner (a_matrix: POINTER): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "eiffel-gsl"
         feature_name: "matrix_double_owner"
         }"
		end
	
end
