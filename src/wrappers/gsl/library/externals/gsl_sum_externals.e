-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SUM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sum_levin_u_accel (an_array: POINTER; a_n: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_u_accel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_u_accel"
		}"
		end

	gsl_sum_levin_u_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_sum_levin_u_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_u_alloc"
		}"
		end

	gsl_sum_levin_u_free (a_w: POINTER) is
 		-- gsl_sum_levin_u_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_u_free"
		}"
		end

	gsl_sum_levin_u_minmax (an_array: POINTER; a_n: NATURAL_32; a_min_terms: NATURAL_32; a_max_terms: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_u_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_u_minmax"
		}"
		end

	gsl_sum_levin_u_step (a_term: REAL_64; a_n: NATURAL_32; a_nmax: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_u_step
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_u_step"
		}"
		end

	gsl_sum_levin_utrunc_accel (an_array: POINTER; a_n: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER; an_abserr_trunc: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_utrunc_accel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_accel"
		}"
		end

	gsl_sum_levin_utrunc_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_sum_levin_utrunc_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_alloc"
		}"
		end

	gsl_sum_levin_utrunc_free (a_w: POINTER) is
 		-- gsl_sum_levin_utrunc_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_free"
		}"
		end

	gsl_sum_levin_utrunc_minmax (an_array: POINTER; a_n: NATURAL_32; a_min_terms: NATURAL_32; a_max_terms: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER; an_abserr_trunc: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_utrunc_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_minmax"
		}"
		end

	gsl_sum_levin_utrunc_step (a_term: REAL_64; a_n: NATURAL_32; a_w: POINTER; a_sum_accel: POINTER): INTEGER_32 is
 		-- gsl_sum_levin_utrunc_step
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_step"
		}"
		end


end -- class GSL_SUM_EXTERNALS
