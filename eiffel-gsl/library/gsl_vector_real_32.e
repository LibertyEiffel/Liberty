indexing
	description: "gsl vector of REAL_32"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
-- todo: do the copy html doc trick and implemtn everything

class GSL_VECTOR_REAL_32
inherit
	GSL_VECTOR_GENERAL[REAL_32]
		redefine make_from_block
		end
creation
	make, make_with_zero, make_from_block, make_from_vector

feature {}

	make_from_block(a_block: GSL_BLOCK_32; a_offset, a_count, a_stride: INTEGER) is
		do
			Precursor(a_block, a_offset, a_count, a_stride)
		end
	
feature {}
	min_memo: NATIVE_ARRAY[REAL_32] is
		once
			Result := Result.calloc(1)
		end

	max_memo: NATIVE_ARRAY[REAL_32] is
		once
			Result := Result.calloc(1)
		end

	min_index_memo: NATIVE_ARRAY[INTEGER] is
		once
			Result := Result.calloc(1)
		end

	max_index_memo: NATIVE_ARRAY[INTEGER] is
		once
			Result := Result.calloc(1)
		end

feature {} -- External structure
	gsl_size(ptr: POINTER): INTEGER is
		external "C struct gsl_vector_float get size use <gsl/gsl_vector_float.h>"
		end
	
	gsl_stride(ptr: POINTER): INTEGER is
		external "C struct gsl_vector_float get stride use <gsl/gsl_vector_float.h>"
		end
	
	gsl_data(ptr: POINTER): POINTER is
		external "C struct gsl_vector_float get data use <gsl/gsl_vector_float.h>"
		end

	gsl_block(ptr: POINTER): POINTER is
		external "C struct gsl_vector_float get block use <gsl/gsl_vector_float.h>"
		end

	gsl_owner(ptr: POINTER): INTEGER is
		external "C struct gsl_vector_float get owner use <gsl/gsl_vector_float.h>"
		end
	
feature {} -- External calls
	gsl_alloc(a_count: INTEGER): POINTER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_alloc"
		end
	
	gsl_calloc(a_count: INTEGER): POINTER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_calloc"
		end
	
	gsl_alloc_from_block(a_block: POINTER; a_offset, a_count, a_stride: INTEGER): POINTER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_alloc_from_block"
		end

	gsl_alloc_from_vector (a_vector: POINTER; a_offset, a_count, a_stride: INTEGER): POINTER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_alloc_from_vector"
		end

	gsl_free(ptr: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_free"
		end

	gsl_get (ptr: POINTER; i: INTEGER): REAL_32 is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_get"
		end

	gsl_set (ptr: POINTER; i: INTEGER; x: REAL_32) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_set"
		end

	gsl_set_all (ptr: POINTER; x: REAL_32) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_set_all"
		end

	gsl_set_zero (ptr: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_set_zero"
		end

	gsl_set_basis (ptr: POINTER; i: INTEGER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_set_basis"
		end

	gsl_copy_from (dest: POINTER; src: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_memcpy"
		end

	gsl_swap (ptr: POINTER; w: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_swap"
		end

	gsl_swap_elements (ptr: POINTER; i: INTEGER; j: INTEGER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_swap_elements"
		end

	gsl_reverse (ptr: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_reverse"
		end

	gsl_add (a: POINTER; b: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_add"
		end

	gsl_sub (a: POINTER; b: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_sub"
		end

	gsl_mul (a: POINTER; b: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_mul"
		end

	gsl_div (a: POINTER; b: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_div"
		end

	gsl_scale (a: POINTER; x: REAL_32) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_scale"
		end

	gsl_add_constant (a: POINTER; x:REAL_32) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_add_constant"
		end

	gsl_max (ptr: POINTER): REAL_32 is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_max"
		end

	gsl_min (ptr: POINTER): REAL_32 is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_min"
		end

	gsl_minmax (ptr: POINTER; min_out,max_out: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_minmax"
		end

	gsl_max_index (ptr: POINTER): INTEGER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_max_index"
		end

	gsl_min_index (ptr: POINTER): INTEGER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_min_index"
		end

	gsl_minmax_index (ptr: POINTER; imin, imax: POINTER) is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_minmax_index"
		end

	gsl_isnull (ptr: POINTER): INTEGER is
		external "C use <gsl/gsl_vector_float.h>"
		alias "gsl_vector_float_isnull"
		end
end
