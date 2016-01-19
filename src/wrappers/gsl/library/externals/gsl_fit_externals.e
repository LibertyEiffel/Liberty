-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FIT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_fit_linear (a_x: POINTER; a_xstride: like size_t; a_y: POINTER; a_ystride: like size_t; a_n: like size_t; a_c0: POINTER; a_c1: POINTER; a_cov00: POINTER; a_cov01: POINTER; a_cov11: POINTER; a_sumsq: POINTER): INTEGER is
 		-- gsl_fit_linear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_linear"
		}"
		end

	gsl_fit_linear_est (a_x: REAL; a_c0: REAL; a_c1: REAL; a_cov00: REAL; a_cov01: REAL; a_cov11: REAL; a_y: POINTER; a_y_err: POINTER): INTEGER is
 		-- gsl_fit_linear_est
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_linear_est"
		}"
		end

	gsl_fit_mul (a_x: POINTER; a_xstride: like size_t; a_y: POINTER; a_ystride: like size_t; a_n: like size_t; a_c1: POINTER; a_cov11: POINTER; a_sumsq: POINTER): INTEGER is
 		-- gsl_fit_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_mul"
		}"
		end

	gsl_fit_mul_est (a_x: REAL; a_c1: REAL; a_cov11: REAL; a_y: POINTER; a_y_err: POINTER): INTEGER is
 		-- gsl_fit_mul_est
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_mul_est"
		}"
		end

	gsl_fit_wlinear (a_x: POINTER; a_xstride: like size_t; a_w: POINTER; a_wstride: like size_t; a_y: POINTER; a_ystride: like size_t; a_n: like size_t; a_c0: POINTER; a_c1: POINTER; a_cov00: POINTER; a_cov01: POINTER; a_cov11: POINTER; a_chisq: POINTER): INTEGER is
 		-- gsl_fit_wlinear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_wlinear"
		}"
		end

	gsl_fit_wmul (a_x: POINTER; a_xstride: like size_t; a_w: POINTER; a_wstride: like size_t; a_y: POINTER; a_ystride: like size_t; a_n: like size_t; a_c1: POINTER; a_cov11: POINTER; a_sumsq: POINTER): INTEGER is
 		-- gsl_fit_wmul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fit_wmul"
		}"
		end


end -- class GSL_FIT_EXTERNALS
