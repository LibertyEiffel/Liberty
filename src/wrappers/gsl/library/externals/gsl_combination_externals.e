-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_COMBINATION_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_combination_alloc (a_n: like size_t; a_k: like size_t): POINTER is
 		-- gsl_combination_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_alloc"
		}"
		end

	gsl_combination_calloc (a_n: like size_t; a_k: like size_t): POINTER is
 		-- gsl_combination_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_calloc"
		}"
		end

	gsl_combination_data (a_c: POINTER): POINTER is
 		-- gsl_combination_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_data"
		}"
		end

	gsl_combination_fprintf (a_stream: POINTER; a_c: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_combination_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_fprintf"
		}"
		end

	gsl_combination_fread (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_combination_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_fread"
		}"
		end

	gsl_combination_free (a_c: POINTER) is
 		-- gsl_combination_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_free"
		}"
		end

	gsl_combination_fscanf (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_combination_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_fscanf"
		}"
		end

	gsl_combination_fwrite (a_stream: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_combination_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_fwrite"
		}"
		end

	gsl_combination_get (a_c: POINTER; an_i: like size_t): like size_t is
 		-- gsl_combination_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_get"
		}"
		end

	gsl_combination_init_first (a_c: POINTER) is
 		-- gsl_combination_init_first
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_init_first"
		}"
		end

	gsl_combination_init_last (a_c: POINTER) is
 		-- gsl_combination_init_last
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_init_last"
		}"
		end

	gsl_combination_k (a_c: POINTER): like size_t is
 		-- gsl_combination_k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_k"
		}"
		end

	gsl_combination_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_combination_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_memcpy"
		}"
		end

	gsl_combination_n (a_c: POINTER): like size_t is
 		-- gsl_combination_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_n"
		}"
		end

	gsl_combination_next (a_c: POINTER): INTEGER is
 		-- gsl_combination_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_next"
		}"
		end

	gsl_combination_prev (a_c: POINTER): INTEGER is
 		-- gsl_combination_prev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_prev"
		}"
		end

	gsl_combination_valid (a_c: POINTER): INTEGER is
 		-- gsl_combination_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_combination_valid"
		}"
		end


end -- class GSL_COMBINATION_EXTERNALS
