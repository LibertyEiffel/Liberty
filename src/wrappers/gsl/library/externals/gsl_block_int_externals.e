-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BLOCK_INT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_block_int_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_block_int_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_alloc"
		}"
		end

	gsl_block_int_calloc (a_n: NATURAL_32): POINTER is
 		-- gsl_block_int_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_calloc"
		}"
		end

	gsl_block_int_data (a_b: POINTER): POINTER is
 		-- gsl_block_int_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_data"
		}"
		end

	gsl_block_int_fprintf (a_stream: POINTER; a_b: POINTER; a_format: POINTER): INTEGER_32 is
 		-- gsl_block_int_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_fprintf"
		}"
		end

	gsl_block_int_fread (a_stream: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_block_int_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_fread"
		}"
		end

	gsl_block_int_free (a_b: POINTER) is
 		-- gsl_block_int_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_free"
		}"
		end

	gsl_block_int_fscanf (a_stream: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_block_int_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_fscanf"
		}"
		end

	gsl_block_int_fwrite (a_stream: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_block_int_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_fwrite"
		}"
		end

	gsl_block_int_raw_fprintf (a_stream: POINTER; a_b: POINTER; a_n: NATURAL_32; a_stride: NATURAL_32; a_format: POINTER): INTEGER_32 is
 		-- gsl_block_int_raw_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_raw_fprintf"
		}"
		end

	gsl_block_int_raw_fread (a_stream: POINTER; a_b: POINTER; a_n: NATURAL_32; a_stride: NATURAL_32): INTEGER_32 is
 		-- gsl_block_int_raw_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_raw_fread"
		}"
		end

	gsl_block_int_raw_fscanf (a_stream: POINTER; a_b: POINTER; a_n: NATURAL_32; a_stride: NATURAL_32): INTEGER_32 is
 		-- gsl_block_int_raw_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_raw_fscanf"
		}"
		end

	gsl_block_int_raw_fwrite (a_stream: POINTER; a_b: POINTER; a_n: NATURAL_32; a_stride: NATURAL_32): INTEGER_32 is
 		-- gsl_block_int_raw_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_raw_fwrite"
		}"
		end

	gsl_block_int_size (a_b: POINTER): NATURAL_32 is
 		-- gsl_block_int_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_block_int_size"
		}"
		end


end -- class GSL_BLOCK_INT_EXTERNALS
