-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BLOCK_UINT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_block_uint_alloc (a_n: like size_t): POINTER is
 		-- gsl_block_uint_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_alloc"
		}"
		end

	gsl_block_uint_calloc (a_n: like size_t): POINTER is
 		-- gsl_block_uint_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_calloc"
		}"
		end

	gsl_block_uint_data (a_b: POINTER): POINTER is
 		-- gsl_block_uint_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_data"
		}"
		end

	gsl_block_uint_fprintf (a_stream: POINTER; a_b: POINTER; a_format: POINTER): INTEGER is
 		-- gsl_block_uint_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_fprintf"
		}"
		end

	gsl_block_uint_fread (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_uint_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_fread"
		}"
		end

	gsl_block_uint_free (a_b: POINTER) is
 		-- gsl_block_uint_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_free"
		}"
		end

	gsl_block_uint_fscanf (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_uint_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_fscanf"
		}"
		end

	gsl_block_uint_fwrite (a_stream: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_block_uint_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_fwrite"
		}"
		end

	gsl_block_uint_raw_fprintf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t; a_format: POINTER): INTEGER is
 		-- gsl_block_uint_raw_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_raw_fprintf"
		}"
		end

	gsl_block_uint_raw_fread (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_uint_raw_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_raw_fread"
		}"
		end

	gsl_block_uint_raw_fscanf (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_uint_raw_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_raw_fscanf"
		}"
		end

	gsl_block_uint_raw_fwrite (a_stream: POINTER; a_b: POINTER; a_n: like size_t; a_stride: like size_t): INTEGER is
 		-- gsl_block_uint_raw_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_raw_fwrite"
		}"
		end

	gsl_block_uint_size (a_b: POINTER): like size_t is
 		-- gsl_block_uint_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_uint_size"
		}"
		end


end -- class GSL_BLOCK_UINT_EXTERNALS
