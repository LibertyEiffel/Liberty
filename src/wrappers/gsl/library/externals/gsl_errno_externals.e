-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ERRNO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_error (a_reason: POINTER; a_file: POINTER; a_line: INTEGER; a_gsl_errno: INTEGER) is
 		-- gsl_error
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_error"
		}"
		end

	gsl_set_error_handler (a_new_handler: POINTER): POINTER is
 		-- gsl_set_error_handler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_set_error_handler"
		}"
		end

	gsl_set_error_handler_off: POINTER is
 		-- gsl_set_error_handler_off
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_set_error_handler_off()"
		}"
		end

	gsl_set_stream (a_new_stream: POINTER): POINTER is
 		-- gsl_set_stream
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_set_stream"
		}"
		end

	gsl_set_stream_handler (a_new_handler: POINTER): POINTER is
 		-- gsl_set_stream_handler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_set_stream_handler"
		}"
		end

	gsl_stream_printf (a_label: POINTER; a_file: POINTER; a_line: INTEGER; a_reason: POINTER) is
 		-- gsl_stream_printf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stream_printf"
		}"
		end

	gsl_strerror (a_gsl_errno: INTEGER): POINTER is
 		-- gsl_strerror
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_strerror"
		}"
		end


end -- class GSL_ERRNO_EXTERNALS
