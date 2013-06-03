-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTATION_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permutation_alloc (a_n: like size_t): POINTER is
 		-- gsl_permutation_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_alloc"
		}"
		end

	gsl_permutation_calloc (a_n: like size_t): POINTER is
 		-- gsl_permutation_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_calloc"
		}"
		end

	gsl_permutation_canonical_cycles (a_q: POINTER): like size_t is
 		-- gsl_permutation_canonical_cycles
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_canonical_cycles"
		}"
		end

	gsl_permutation_canonical_to_linear (a_p: POINTER; a_q: POINTER): INTEGER is
 		-- gsl_permutation_canonical_to_linear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_canonical_to_linear"
		}"
		end

	gsl_permutation_data (a_p: POINTER): POINTER is
 		-- gsl_permutation_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_data"
		}"
		end

	gsl_permutation_fprintf (a_stream: POINTER; a_p: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_permutation_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_fprintf"
		}"
		end

	gsl_permutation_fread (a_stream: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_permutation_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_fread"
		}"
		end

	gsl_permutation_free (a_p: POINTER) is
 		-- gsl_permutation_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_free"
		}"
		end

	gsl_permutation_fscanf (a_stream: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_permutation_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_fscanf"
		}"
		end

	gsl_permutation_fwrite (a_stream: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_permutation_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_fwrite"
		}"
		end

	gsl_permutation_get (a_p: POINTER; an_i: like size_t): like size_t is
 		-- gsl_permutation_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_get"
		}"
		end

	gsl_permutation_init (a_p: POINTER) is
 		-- gsl_permutation_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_init"
		}"
		end

	gsl_permutation_inverse (an_inv: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_permutation_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_inverse"
		}"
		end

	gsl_permutation_inversions (a_p: POINTER): like size_t is
 		-- gsl_permutation_inversions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_inversions"
		}"
		end

	gsl_permutation_linear_cycles (a_p: POINTER): like size_t is
 		-- gsl_permutation_linear_cycles
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_linear_cycles"
		}"
		end

	gsl_permutation_linear_to_canonical (a_q: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_permutation_linear_to_canonical
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_linear_to_canonical"
		}"
		end

	gsl_permutation_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_permutation_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_memcpy"
		}"
		end

	gsl_permutation_mul (a_p: POINTER; a_pa: POINTER; a_pb: POINTER): INTEGER is
 		-- gsl_permutation_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_mul"
		}"
		end

	gsl_permutation_next (a_p: POINTER): INTEGER is
 		-- gsl_permutation_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_next"
		}"
		end

	gsl_permutation_prev (a_p: POINTER): INTEGER is
 		-- gsl_permutation_prev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_prev"
		}"
		end

	gsl_permutation_reverse (a_p: POINTER) is
 		-- gsl_permutation_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_reverse"
		}"
		end

	gsl_permutation_size (a_p: POINTER): like size_t is
 		-- gsl_permutation_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_size"
		}"
		end

	gsl_permutation_swap (a_p: POINTER; an_i: like size_t; a_j: like size_t): INTEGER is
 		-- gsl_permutation_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_swap"
		}"
		end

	gsl_permutation_valid (a_p: POINTER): INTEGER is
 		-- gsl_permutation_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permutation_valid"
		}"
		end


end -- class GSL_PERMUTATION_EXTERNALS
