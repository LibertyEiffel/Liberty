-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTISET_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_multiset_alloc (a_n: like size_t; a_k: like size_t): POINTER is
 		-- gsl_multiset_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_alloc"
		}"
		end

	gsl_multiset_calloc (a_n: like size_t; a_k: like size_t): POINTER is
 		-- gsl_multiset_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_calloc"
		}"
		end

	gsl_multiset_data (a_c: POINTER): POINTER is
 		-- gsl_multiset_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_data"
		}"
		end

	gsl_multiset_fprintf (a_stream: POINTER; a_c: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_multiset_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_fprintf"
		}"
		end

	gsl_multiset_fread (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_multiset_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_fread"
		}"
		end

	gsl_multiset_free (a_c: POINTER) is
 		-- gsl_multiset_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_free"
		}"
		end

	gsl_multiset_fscanf (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_multiset_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_fscanf"
		}"
		end

	gsl_multiset_fwrite (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_multiset_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_fwrite"
		}"
		end

	gsl_multiset_get (a_c: POINTER; an_i: like size_t): like size_t is
 		-- gsl_multiset_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_get"
		}"
		end

	gsl_multiset_init_first (a_c: POINTER) is
 		-- gsl_multiset_init_first
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_init_first"
		}"
		end

	gsl_multiset_init_last (a_c: POINTER) is
 		-- gsl_multiset_init_last
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_init_last"
		}"
		end

	gsl_multiset_k (a_c: POINTER): like size_t is
 		-- gsl_multiset_k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_k"
		}"
		end

	gsl_multiset_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_multiset_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_memcpy"
		}"
		end

	gsl_multiset_n (a_c: POINTER): like size_t is
 		-- gsl_multiset_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_n"
		}"
		end

	gsl_multiset_next (a_c: POINTER): INTEGER is
 		-- gsl_multiset_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_next"
		}"
		end

	gsl_multiset_prev (a_c: POINTER): INTEGER is
 		-- gsl_multiset_prev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_prev"
		}"
		end

	gsl_multiset_valid (a_c: POINTER): INTEGER is
 		-- gsl_multiset_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_valid"
		}"
		end


end -- class GSL_MULTISET_EXTERNALS
