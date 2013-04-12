-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_IEEE_UTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_ieee_double_to_rep (a_x: POINTER; a_r: POINTER) is
 		-- gsl_ieee_double_to_rep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_to_rep"
		}"
		end

	gsl_ieee_env_setup is
 		-- gsl_ieee_env_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_env_setup()"
		}"
		end

	gsl_ieee_float_to_rep (a_x: POINTER; a_r: POINTER) is
 		-- gsl_ieee_float_to_rep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_float_to_rep"
		}"
		end

	gsl_ieee_fprintf_double (a_stream: POINTER; a_x: POINTER) is
 		-- gsl_ieee_fprintf_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_fprintf_double"
		}"
		end

	gsl_ieee_fprintf_float (a_stream: POINTER; a_x: POINTER) is
 		-- gsl_ieee_fprintf_float
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_fprintf_float"
		}"
		end

	gsl_ieee_printf_double (a_x: POINTER) is
 		-- gsl_ieee_printf_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_printf_double"
		}"
		end

	gsl_ieee_printf_float (a_x: POINTER) is
 		-- gsl_ieee_printf_float
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_printf_float"
		}"
		end

	gsl_ieee_read_mode_string (a_description: POINTER; a_precision: POINTER; a_rounding: POINTER; an_exception_mask: POINTER): INTEGER_32 is
 		-- gsl_ieee_read_mode_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_read_mode_string"
		}"
		end

	gsl_ieee_set_mode (a_precision: INTEGER_32; a_rounding: INTEGER_32; an_exception_mask: INTEGER_32): INTEGER_32 is
 		-- gsl_ieee_set_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_set_mode"
		}"
		end


end -- class GSL_IEEE_UTILS_EXTERNALS
