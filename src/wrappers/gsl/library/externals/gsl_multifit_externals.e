-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIFIT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_multifit_linear (a_x: POINTER; a_y: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_linear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear"
		}"
		end

	gsl_multifit_linear_alloc (a_n: like size_t; a_p: like size_t): POINTER is
 		-- gsl_multifit_linear_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_alloc"
		}"
		end

	gsl_multifit_linear_est (a_x: POINTER; a_c: POINTER; a_cov: POINTER; a_y: POINTER; a_y_err: POINTER): INTEGER is
 		-- gsl_multifit_linear_est
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_est"
		}"
		end

	gsl_multifit_linear_free (a_work: POINTER) is
 		-- gsl_multifit_linear_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_free"
		}"
		end

	gsl_multifit_linear_residuals (a_x: POINTER; a_y: POINTER; a_c: POINTER; a_r: POINTER): INTEGER is
 		-- gsl_multifit_linear_residuals
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_residuals"
		}"
		end

	gsl_multifit_linear_svd (a_x: POINTER; a_y: POINTER; a_tol: REAL; a_rank: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_linear_svd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_svd"
		}"
		end

	gsl_multifit_linear_usvd (a_x: POINTER; a_y: POINTER; a_tol: REAL; a_rank: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_linear_usvd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_linear_usvd"
		}"
		end

	gsl_multifit_wlinear (a_x: POINTER; a_w: POINTER; a_y: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_wlinear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_wlinear"
		}"
		end

	gsl_multifit_wlinear_svd (a_x: POINTER; a_w: POINTER; a_y: POINTER; a_tol: REAL; a_rank: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_wlinear_svd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_wlinear_svd"
		}"
		end

	gsl_multifit_wlinear_usvd (a_x: POINTER; a_w: POINTER; a_y: POINTER; a_tol: REAL; a_rank: POINTER; a_c: POINTER; a_cov: POINTER; a_chisq: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_multifit_wlinear_usvd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_wlinear_usvd"
		}"
		end


end -- class GSL_MULTIFIT_EXTERNALS
