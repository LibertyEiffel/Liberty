indexing
	description: "External calls for GSL_VECTOR"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_VECTOR_EXTERNALS_64
feature {NONE} -- External calls
	gsl_vector_alloc (a_n: INTEGER): POINTER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_calloc (a_n: INTEGER): POINTER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_free (v: POINTER) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_get (v: POINTER; a_i: INTEGER): REAL is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_set (v: POINTER; a_i: INTEGER; x: REAL) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_ptr (v: POINTER; a_i: INTEGER): POINTER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_const_ptr (v: POINTER; a_i: INTEGER): POINTER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_set_all (v: POINTER; x: REAL) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_set_zero (v: POINTER) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_set_basis (v: POINTER; a_i: INTEGER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_fwrite (a_stream: POINTER; v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_fread (a_stream: POINTER; v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end
--TODO
--	gsl_vector_fprintf (a_stream: POINTER; v: POINTER; const char * format): INTEGER is
--		external "C use <gsl/gsl_vector.h>"
--		end

	gsl_vector_fscanf (a_stream: POINTER; v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	-- gsl_vector_view gsl_vector_subvector_with_stride (v: POINTER; a_offset: INTEGER; a_stride: INTEGER; a_n: INTEGER)
	-- gsl_vector_const_view gsl_vector_const_subvector_with_stride (v: POINTER; a_offset: INTEGER; a_stride: INTEGER; a_n: INTEGER)
	-- gsl_vector_view gsl_vector_complex_real (gsl_vector_complex * v)
	-- gsl_vector_const_view gsl_vector_complex_const_real (const gsl_vector_complex * v)
	-- gsl_vector_view gsl_vector_complex_imag (gsl_vector_complex * v)
	-- gsl_vector_const_view gsl_vector_complex_const_imag (const gsl_vector_complex * v)
	-- gsl_vector_view gsl_vector_view_array (double * base; a_n: INTEGER)
	-- gsl_vector_const_view gsl_vector_const_view_array (const double * base; a_n: INTEGER)
	-- gsl_vector_view gsl_vector_view_array_with_stride (double * base; a_stride: INTEGER; a_n: INTEGER)
	-- gsl_vector_const_view gsl_vector_const_view_array_with_stride (const double * base; a_stride: INTEGER; a_n: INTEGER)
	gsl_vector_memcpy (dest: POINTER; src: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_swap (v: POINTER; w: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_swap_elements (v: POINTER; i: INTEGER; j: INTEGER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_reverse (v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_add (a: POINTER; b: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_sub (a: POINTER; b: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_mul (a: POINTER; b: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_div (a: POINTER; b: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_scale (a: POINTER; x: REAL): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_add_constant (a: POINTER; x:REAL): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_max (v: POINTER): REAL is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_min (v: POINTER): REAL is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_minmax (v: POINTER; min_out,max_out: POINTER) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_max_index (v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_min_index (v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_minmax_index (v: POINTER; imin, imax: POINTER) is
		external "C use <gsl/gsl_vector.h>"
		end

	gsl_vector_isnull (v: POINTER): INTEGER is
		external "C use <gsl/gsl_vector.h>"
		end
end
