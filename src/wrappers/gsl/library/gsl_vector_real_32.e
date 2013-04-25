indexing
	description: "gsl vector of REAL_32"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	
class GSL_VECTOR_REAL_32

inherit
	COLLECTION [REAL_32]
		undefine
			out, swap
		end

insert
	GSL_VECTOR_GENERAL[REAL_32]

create {ANY} 
	make, make_zero, make_one, manifest_creation, from_collection

feature {ANY}
	dot (other: like Current): REAL_32 is
		do
			handle_code(gsl_blas_sdot(handle, other.handle, $Result))
		end

	dot_64 (other: like Current): REAL_64 is
			-- scalar product of Current times other as REAL_64
		require
			same_size: has_same_size(other)
		do
			handle_code(gsl_blas_dsdot(handle, other.handle, $Result))
		end

feature {} -- External calls
	gsl_blas_sdot(x, y, res: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_sdot"
			}"
		end
	
	gsl_blas_dsdot(x, y, res: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_dsdot"
			}"
		end
	
feature {} -- External calls (from general)
	gsl_vector_alloc(a_count: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_alloc"
			}"
		end
	
	gsl_vector_calloc(a_count: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_calloc"
			}"
		end
	
	gsl_vector_alloc_from_block(a_block: POINTER; a_offset, a_count, a_stride: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_alloc_from_block"
			}"
		end

	gsl_vector_alloc_from_vector (a_vector: POINTER; a_offset, a_count, a_stride: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_alloc_from_vector"
			}"
		end

	gsl_vector_free(ptr: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_free"
			}"
		end

	gsl_vector_get (ptr: POINTER; i: INTEGER_32): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_get"
			}"
		end

	gsl_vector_set (ptr: POINTER; i: INTEGER_32; x: REAL_32) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_set"
			}"
		end

	gsl_vector_set_all (ptr: POINTER; x: REAL_32) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_set_all"
			}"
		end

	gsl_vector_set_zero (ptr: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_set_zero"
			}"
		end

	gsl_vector_set_basis (ptr: POINTER; i: INTEGER_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_set_basis"
			}"
		end

	gsl_vector_memcpy (dest: POINTER; src: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_memcpy"
			}"
		end

	gsl_vector_swap (ptr: POINTER; w: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_swap"
			}"
		end

	gsl_vector_swap_elements (ptr: POINTER; i: INTEGER_32; j: INTEGER_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_swap_elements"
			}"
		end

	gsl_vector_reverse (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_reverse"
			}"
		end

	gsl_vector_add (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_add"
			}"
		end

	gsl_vector_sub (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_sub"
			}"
		end

	gsl_vector_mul (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_mul"
			}"
		end

	gsl_vector_div (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_div"
			}"
		end

	gsl_vector_scale (a: POINTER; x: REAL_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_scale"
			}"
		end

	gsl_vector_add_constant (a: POINTER; x: REAL_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_add_constant"
			}"
		end

	gsl_vector_max (ptr: POINTER): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_max"
			}"
		end

	gsl_vector_min (ptr: POINTER): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_min"
			}"
		end

	gsl_vector_minmax (ptr: POINTER; min_out,max_out: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_minmax"
			}"
		end

	gsl_vector_max_index (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_max_index"
			}"
		end

	gsl_vector_min_index (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_min_index"
			}"
		end

	gsl_vector_minmax_index (ptr: POINTER; imin, imax: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_minmax_index"
			}"
		end

	gsl_vector_isnull (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_float_isnull"
			}"
		end

feature {} -- External structure
	c_structure_size: INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_float_c_struct_size"
			}"
		end

	gsl_vector_size(ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_double_size"
			}"
		end
	
	gsl_vector_stride(ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_float_stride"
			}"
		end
	
	gsl_vector_data(ptr: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_float_data"
			}"
		end

	gsl_vector_block(ptr: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_float_block"
			}"
		end

	gsl_vector_owner(ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_float_owner"
			}"
		end
	
	gsl_blas_nrm2 (ptr: POINTER): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_snrm2"
			}"
		end
	
	gsl_blas_asum (ptr: POINTER): REAL_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_sasum"
			}"
		end

	gsl_blas_axpy (alpha: REAL_32; other_p, ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_saxpy"
			}"
		end
end
