-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BLOCK_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_block_float_alloc (a_n: like size_t): POINTER is
 		-- gsl_block_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_alloc"
		}"
		end

	gsl_block_float_calloc (a_n: like size_t): POINTER is
 		-- gsl_block_float_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_calloc"
		}"
		end

	gsl_block_float_data (a_b: POINTER): POINTER is
 		-- gsl_block_float_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_data"
		}"
		end

	gsl_block_float_fprintf (a_stream: POINTER; a_b: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_block_float_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_fprintf"
		}"
		end

	gsl_block_float_fread (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_float_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_fread"
		}"
		end

	gsl_block_float_free (a_b: POINTER) is
 		-- gsl_block_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_free"
		}"
		end

	gsl_block_float_fscanf (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_float_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_fscanf"
		}"
		end

	gsl_block_float_fwrite (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_float_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_fwrite"
		}"
		end

	gsl_block_float_raw_fprintf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t; a_format: POINTER): INTEGER is
 		-- gsl_block_float_raw_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_raw_fprintf"
		}"
		end

	gsl_block_float_raw_fread (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_float_raw_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_raw_fread"
		}"
		end

	gsl_block_float_raw_fscanf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_float_raw_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_raw_fscanf"
		}"
		end

	gsl_block_float_raw_fwrite (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_float_raw_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_raw_fwrite"
		}"
		end

	gsl_block_float_size (a_b: POINTER): like size_t is
 		-- gsl_block_float_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_float_size"
		}"
		end


end -- class GSL_BLOCK_FLOAT_EXTERNALS
