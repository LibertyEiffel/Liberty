-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BLOCK_LONG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_block_long_alloc (a_n: like size_t): POINTER is
 		-- gsl_block_long_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_alloc"
		}"
		end

	gsl_block_long_calloc (a_n: like size_t): POINTER is
 		-- gsl_block_long_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_calloc"
		}"
		end

	gsl_block_long_data (a_b: POINTER): POINTER is
 		-- gsl_block_long_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_data"
		}"
		end

	gsl_block_long_fprintf (a_stream: POINTER; a_b: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_block_long_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_fprintf"
		}"
		end

	gsl_block_long_fread (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_long_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_fread"
		}"
		end

	gsl_block_long_free (a_b: POINTER) is
 		-- gsl_block_long_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_free"
		}"
		end

	gsl_block_long_fscanf (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_long_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_fscanf"
		}"
		end

	gsl_block_long_fwrite (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_long_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_fwrite"
		}"
		end

	gsl_block_long_raw_fprintf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t; a_format: POINTER): INTEGER is
 		-- gsl_block_long_raw_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_raw_fprintf"
		}"
		end

	gsl_block_long_raw_fread (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_long_raw_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_raw_fread"
		}"
		end

	gsl_block_long_raw_fscanf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_long_raw_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_raw_fscanf"
		}"
		end

	gsl_block_long_raw_fwrite (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_long_raw_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_raw_fwrite"
		}"
		end

	gsl_block_long_size (a_b: POINTER): like size_t is
 		-- gsl_block_long_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_long_size"
		}"
		end


end -- class GSL_BLOCK_LONG_EXTERNALS
