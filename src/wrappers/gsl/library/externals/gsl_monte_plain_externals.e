-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_PLAIN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_monte_plain_alloc (a_dim: NATURAL_32): POINTER is
 		-- gsl_monte_plain_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_alloc"
		}"
		end

	gsl_monte_plain_free (a_state: POINTER) is
 		-- gsl_monte_plain_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_free"
		}"
		end

	gsl_monte_plain_init (a_state: POINTER): INTEGER_32 is
 		-- gsl_monte_plain_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_init"
		}"
		end

	gsl_monte_plain_integrate (a_f: POINTER; a_xl: POINTER; a_xu: POINTER; a_dim: NATURAL_32; a_calls: NATURAL_32; a_r: POINTER; a_state: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_monte_plain_integrate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_integrate"
		}"
		end


end -- class GSL_MONTE_PLAIN_EXTERNALS
