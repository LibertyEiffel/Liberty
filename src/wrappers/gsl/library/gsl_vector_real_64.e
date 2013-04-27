indexing
	description: "gsl vector of REAL_64"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GSL_VECTOR_REAL_64

inherit
	COLLECTION [REAL_64]
		undefine
			out, swap
		end
	
insert
	GSL_VECTOR_GENERAL[REAL_64]   
	
create {ANY} 
	make, make_zero, make_one, manifest_creation, from_collection

feature {ANY}
	dot (other: like Current): REAL_64 is
		do
			handle_code(gsl_blas_ddot(handle, other.handle, $Result))
		end

feature {} -- External calls
	gsl_blas_ddot(x, y, res: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_ddot"
			}"
		end
	
feature {} -- External calls (from general)
	gsl_vector_alloc(a_count: INTEGER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_alloc"
			}"
		end
	
	gsl_vector_calloc(a_count: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_calloc"
			}"
		end
	
	gsl_vector_alloc_from_block(a_block: POINTER; a_offset, a_count, a_stride: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_alloc_from_block"
			}"
		end

	gsl_vector_free(ptr: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_free"
			}"
		end

	gsl_vector_get (ptr: POINTER; i: INTEGER_32): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_get"
			}"
		end

	gsl_vector_set (ptr: POINTER; i: INTEGER_32; x: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_set"
			}"
		end

	gsl_vector_set_all (ptr: POINTER; x: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_set_all"
			}"
		end

	gsl_vector_set_zero (ptr: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_set_zero"
			}"
		end

	gsl_vector_set_basis (ptr: POINTER; i: INTEGER_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_set_basis"
			}"
		end

	gsl_vector_memcpy (dest: POINTER; src: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_memcpy"
			}"
		end

	gsl_vector_swap (ptr: POINTER; w: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_swap"
			}"
		end

	gsl_vector_swap_elements (ptr: POINTER; i: INTEGER_32; j: INTEGER_32): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_swap_elements"
			}"
		end

	gsl_vector_reverse (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_reverse"
			}"
		end

	gsl_vector_add (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_add"
			}"
		end

	gsl_vector_sub (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_sub"
			}"
		end

	gsl_vector_mul (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_mul"
			}"
		end

	gsl_vector_div (a: POINTER; b: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_div"
			}"
		end

	gsl_vector_scale (a: POINTER; x: REAL_64): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_scale"
			}"
		end

	gsl_vector_add_constant (a: POINTER; x: REAL_64): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_add_constant"
			}"
		end

	gsl_vector_max (ptr: POINTER): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_max"
			}"
		end

	gsl_vector_min (ptr: POINTER): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_min"
			}"
		end

	gsl_vector_minmax (ptr: POINTER; min_out, max_out: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_minmax"
			}"
		end

	gsl_vector_max_index (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_max_index"
			}"
		end

	gsl_vector_min_index (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_min_index"
			}"
		end

	gsl_vector_minmax_index (ptr: POINTER; imin, imax: POINTER) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_minmax_index"
			}"
		end

	gsl_vector_isnull (ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_vector_isnull"
			}"
		end

feature {} -- External structure
	c_structure_size: INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_double_c_struct_size"
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
			feature_name: "vector_double_stride"
			}"
		end
	
	gsl_vector_data(ptr: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_double_data"
			}"
		end

	gsl_vector_block(ptr: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_double_block"
			}"
		end

	gsl_vector_owner(ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "vector_double_owner"
			}"
		end

	gsl_blas_nrm2 (ptr: POINTER): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_dnrm2"
			}"
		end

	gsl_blas_asum (ptr: POINTER): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_dasum"
			}"
		end

	gsl_blas_axpy (alpha: REAL_64; other_p, ptr: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_blas_daxpy"
			}"
		end

end
