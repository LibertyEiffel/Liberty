-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_NTUPLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_ntuple_bookdata (a_ntuple: POINTER): INTEGER is
 		-- gsl_ntuple_bookdata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_bookdata"
		}"
		end

	gsl_ntuple_close (a_ntuple: POINTER): INTEGER is
 		-- gsl_ntuple_close
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_close"
		}"
		end

	gsl_ntuple_create (a_filename: POINTER; a_ntuple_data: POINTER; a_size: like size_t): POINTER is
 		-- gsl_ntuple_create
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_create"
		}"
		end

	gsl_ntuple_open (a_filename: POINTER; a_ntuple_data: POINTER; a_size: like size_t): POINTER is
 		-- gsl_ntuple_open
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_open"
		}"
		end

	gsl_ntuple_project (a_h: POINTER; a_ntuple: POINTER; a_value_func: POINTER; a_select_func: POINTER): INTEGER is
 		-- gsl_ntuple_project
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_project"
		}"
		end

	gsl_ntuple_read (a_ntuple: POINTER): INTEGER is
 		-- gsl_ntuple_read
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_read"
		}"
		end

	gsl_ntuple_write (a_ntuple: POINTER): INTEGER is
 		-- gsl_ntuple_write
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_write"
		}"
		end


end -- class GSL_NTUPLE_EXTERNALS
