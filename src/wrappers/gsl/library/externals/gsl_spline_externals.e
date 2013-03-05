-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SPLINE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_spline_alloc (a_t: POINTER; a_size: NATURAL_32): POINTER is
 		-- gsl_spline_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_alloc"
		}"
		end

	gsl_spline_eval (a_spline: POINTER; a_x: REAL_64; an_a: POINTER): REAL_64 is
 		-- gsl_spline_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval"
		}"
		end

	gsl_spline_eval_deriv (a_spline: POINTER; a_x: REAL_64; an_a: POINTER): REAL_64 is
 		-- gsl_spline_eval_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_deriv"
		}"
		end

	gsl_spline_eval_deriv2 (a_spline: POINTER; a_x: REAL_64; an_a: POINTER): REAL_64 is
 		-- gsl_spline_eval_deriv2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_deriv2"
		}"
		end

	gsl_spline_eval_deriv2_e (a_spline: POINTER; a_x: REAL_64; an_a: POINTER; a_y: POINTER): INTEGER_32 is
 		-- gsl_spline_eval_deriv2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_deriv2_e"
		}"
		end

	gsl_spline_eval_deriv_e (a_spline: POINTER; a_x: REAL_64; an_a: POINTER; a_y: POINTER): INTEGER_32 is
 		-- gsl_spline_eval_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_deriv_e"
		}"
		end

	gsl_spline_eval_e (a_spline: POINTER; a_x: REAL_64; an_a: POINTER; a_y: POINTER): INTEGER_32 is
 		-- gsl_spline_eval_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_e"
		}"
		end

	gsl_spline_eval_integ (a_spline: POINTER; an_a: REAL_64; a_b: REAL_64; an_acc: POINTER): REAL_64 is
 		-- gsl_spline_eval_integ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_integ"
		}"
		end

	gsl_spline_eval_integ_e (a_spline: POINTER; an_a: REAL_64; a_b: REAL_64; an_acc: POINTER; a_y: POINTER): INTEGER_32 is
 		-- gsl_spline_eval_integ_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_eval_integ_e"
		}"
		end

	gsl_spline_free (a_spline: POINTER) is
 		-- gsl_spline_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_free"
		}"
		end

	gsl_spline_init (a_spline: POINTER; a_xa: POINTER; a_ya: POINTER; a_size: NATURAL_32): INTEGER_32 is
 		-- gsl_spline_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_init"
		}"
		end

	gsl_spline_min_size (a_spline: POINTER): NATURAL_32 is
 		-- gsl_spline_min_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_min_size"
		}"
		end

	gsl_spline_name (a_spline: POINTER): POINTER is
 		-- gsl_spline_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_name"
		}"
		end


end -- class GSL_SPLINE_EXTERNALS
