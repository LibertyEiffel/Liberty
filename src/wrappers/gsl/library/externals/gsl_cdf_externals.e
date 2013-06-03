-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_CDF_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_cdf_beta_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_beta_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_beta_P"
		}"
		end

	gsl_cdf_beta_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_beta_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_beta_Pinv"
		}"
		end

	gsl_cdf_beta_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_beta_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_beta_Q"
		}"
		end

	gsl_cdf_beta_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_beta_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_beta_Qinv"
		}"
		end

	gsl_cdf_binomial_p (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_cdf_binomial_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_binomial_P"
		}"
		end

	gsl_cdf_binomial_q (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_cdf_binomial_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_binomial_Q"
		}"
		end

	gsl_cdf_cauchy_p (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_cauchy_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_cauchy_P"
		}"
		end

	gsl_cdf_cauchy_pinv (a_p: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_cauchy_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_cauchy_Pinv"
		}"
		end

	gsl_cdf_cauchy_q (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_cauchy_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_cauchy_Q"
		}"
		end

	gsl_cdf_cauchy_qinv (a_q: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_cauchy_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_cauchy_Qinv"
		}"
		end

	gsl_cdf_chisq_p (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_chisq_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_chisq_P"
		}"
		end

	gsl_cdf_chisq_pinv (a_p: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_chisq_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_chisq_Pinv"
		}"
		end

	gsl_cdf_chisq_q (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_chisq_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_chisq_Q"
		}"
		end

	gsl_cdf_chisq_qinv (a_q: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_chisq_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_chisq_Qinv"
		}"
		end

	gsl_cdf_exponential_p (a_x: REAL; a_mu: REAL): REAL is
 		-- gsl_cdf_exponential_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exponential_P"
		}"
		end

	gsl_cdf_exponential_pinv (a_p: REAL; a_mu: REAL): REAL is
 		-- gsl_cdf_exponential_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exponential_Pinv"
		}"
		end

	gsl_cdf_exponential_q (a_x: REAL; a_mu: REAL): REAL is
 		-- gsl_cdf_exponential_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exponential_Q"
		}"
		end

	gsl_cdf_exponential_qinv (a_q: REAL; a_mu: REAL): REAL is
 		-- gsl_cdf_exponential_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exponential_Qinv"
		}"
		end

	gsl_cdf_exppow_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_exppow_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exppow_P"
		}"
		end

	gsl_cdf_exppow_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_exppow_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_exppow_Q"
		}"
		end

	gsl_cdf_fdist_p (a_x: REAL; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_cdf_fdist_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_fdist_P"
		}"
		end

	gsl_cdf_fdist_pinv (a_p: REAL; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_cdf_fdist_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_fdist_Pinv"
		}"
		end

	gsl_cdf_fdist_q (a_x: REAL; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_cdf_fdist_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_fdist_Q"
		}"
		end

	gsl_cdf_fdist_qinv (a_q: REAL; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_cdf_fdist_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_fdist_Qinv"
		}"
		end

	gsl_cdf_flat_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_flat_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_flat_P"
		}"
		end

	gsl_cdf_flat_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_flat_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_flat_Pinv"
		}"
		end

	gsl_cdf_flat_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_flat_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_flat_Q"
		}"
		end

	gsl_cdf_flat_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_flat_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_flat_Qinv"
		}"
		end

	gsl_cdf_gamma_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gamma_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gamma_P"
		}"
		end

	gsl_cdf_gamma_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gamma_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gamma_Pinv"
		}"
		end

	gsl_cdf_gamma_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gamma_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gamma_Q"
		}"
		end

	gsl_cdf_gamma_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gamma_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gamma_Qinv"
		}"
		end

	gsl_cdf_gaussian_p (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_gaussian_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gaussian_P"
		}"
		end

	gsl_cdf_gaussian_pinv (a_p: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_gaussian_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gaussian_Pinv"
		}"
		end

	gsl_cdf_gaussian_q (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_gaussian_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gaussian_Q"
		}"
		end

	gsl_cdf_gaussian_qinv (a_q: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_gaussian_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gaussian_Qinv"
		}"
		end

	gsl_cdf_geometric_p (a_k: NATURAL; a_p: REAL): REAL is
 		-- gsl_cdf_geometric_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_geometric_P"
		}"
		end

	gsl_cdf_geometric_q (a_k: NATURAL; a_p: REAL): REAL is
 		-- gsl_cdf_geometric_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_geometric_Q"
		}"
		end

	gsl_cdf_gumbel1_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel1_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel1_P"
		}"
		end

	gsl_cdf_gumbel1_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel1_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel1_Pinv"
		}"
		end

	gsl_cdf_gumbel1_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel1_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel1_Q"
		}"
		end

	gsl_cdf_gumbel1_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel1_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel1_Qinv"
		}"
		end

	gsl_cdf_gumbel2_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel2_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel2_P"
		}"
		end

	gsl_cdf_gumbel2_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel2_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel2_Pinv"
		}"
		end

	gsl_cdf_gumbel2_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel2_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel2_Q"
		}"
		end

	gsl_cdf_gumbel2_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_gumbel2_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_gumbel2_Qinv"
		}"
		end

	gsl_cdf_hypergeometric_p (a_k: NATURAL; a_n1: NATURAL; a_n2: NATURAL; a_t: NATURAL): REAL is
 		-- gsl_cdf_hypergeometric_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_hypergeometric_P"
		}"
		end

	gsl_cdf_hypergeometric_q (a_k: NATURAL; a_n1: NATURAL; a_n2: NATURAL; a_t: NATURAL): REAL is
 		-- gsl_cdf_hypergeometric_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_hypergeometric_Q"
		}"
		end

	gsl_cdf_laplace_p (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_laplace_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_laplace_P"
		}"
		end

	gsl_cdf_laplace_pinv (a_p: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_laplace_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_laplace_Pinv"
		}"
		end

	gsl_cdf_laplace_q (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_laplace_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_laplace_Q"
		}"
		end

	gsl_cdf_laplace_qinv (a_q: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_laplace_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_laplace_Qinv"
		}"
		end

	gsl_cdf_logistic_p (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_logistic_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_logistic_P"
		}"
		end

	gsl_cdf_logistic_pinv (a_p: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_logistic_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_logistic_Pinv"
		}"
		end

	gsl_cdf_logistic_q (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_logistic_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_logistic_Q"
		}"
		end

	gsl_cdf_logistic_qinv (a_q: REAL; an_a: REAL): REAL is
 		-- gsl_cdf_logistic_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_logistic_Qinv"
		}"
		end

	gsl_cdf_lognormal_p (a_x: REAL; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_lognormal_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_lognormal_P"
		}"
		end

	gsl_cdf_lognormal_pinv (a_p: REAL; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_lognormal_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_lognormal_Pinv"
		}"
		end

	gsl_cdf_lognormal_q (a_x: REAL; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_lognormal_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_lognormal_Q"
		}"
		end

	gsl_cdf_lognormal_qinv (a_q: REAL; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_lognormal_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_lognormal_Qinv"
		}"
		end

	gsl_cdf_negative_binomial_p (a_k: NATURAL; a_p: REAL; a_n: REAL): REAL is
 		-- gsl_cdf_negative_binomial_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_negative_binomial_P"
		}"
		end

	gsl_cdf_negative_binomial_q (a_k: NATURAL; a_p: REAL; a_n: REAL): REAL is
 		-- gsl_cdf_negative_binomial_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_negative_binomial_Q"
		}"
		end

	gsl_cdf_pareto_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_pareto_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pareto_P"
		}"
		end

	gsl_cdf_pareto_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_pareto_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pareto_Pinv"
		}"
		end

	gsl_cdf_pareto_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_pareto_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pareto_Q"
		}"
		end

	gsl_cdf_pareto_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_pareto_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pareto_Qinv"
		}"
		end

	gsl_cdf_pascal_p (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_cdf_pascal_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pascal_P"
		}"
		end

	gsl_cdf_pascal_q (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_cdf_pascal_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_pascal_Q"
		}"
		end

	gsl_cdf_poisson_p (a_k: NATURAL; a_mu: REAL): REAL is
 		-- gsl_cdf_poisson_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_poisson_P"
		}"
		end

	gsl_cdf_poisson_q (a_k: NATURAL; a_mu: REAL): REAL is
 		-- gsl_cdf_poisson_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_poisson_Q"
		}"
		end

	gsl_cdf_rayleigh_p (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_rayleigh_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_rayleigh_P"
		}"
		end

	gsl_cdf_rayleigh_pinv (a_p: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_rayleigh_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_rayleigh_Pinv"
		}"
		end

	gsl_cdf_rayleigh_q (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_rayleigh_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_rayleigh_Q"
		}"
		end

	gsl_cdf_rayleigh_qinv (a_q: REAL; a_sigma: REAL): REAL is
 		-- gsl_cdf_rayleigh_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_rayleigh_Qinv"
		}"
		end

	gsl_cdf_tdist_p (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_tdist_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_tdist_P"
		}"
		end

	gsl_cdf_tdist_pinv (a_p: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_tdist_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_tdist_Pinv"
		}"
		end

	gsl_cdf_tdist_q (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_tdist_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_tdist_Q"
		}"
		end

	gsl_cdf_tdist_qinv (a_q: REAL; a_nu: REAL): REAL is
 		-- gsl_cdf_tdist_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_tdist_Qinv"
		}"
		end

	gsl_cdf_ugaussian_p (a_x: REAL): REAL is
 		-- gsl_cdf_ugaussian_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_ugaussian_P"
		}"
		end

	gsl_cdf_ugaussian_pinv (a_p: REAL): REAL is
 		-- gsl_cdf_ugaussian_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_ugaussian_Pinv"
		}"
		end

	gsl_cdf_ugaussian_q (a_x: REAL): REAL is
 		-- gsl_cdf_ugaussian_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_ugaussian_Q"
		}"
		end

	gsl_cdf_ugaussian_qinv (a_q: REAL): REAL is
 		-- gsl_cdf_ugaussian_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_ugaussian_Qinv"
		}"
		end

	gsl_cdf_weibull_p (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_weibull_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_weibull_P"
		}"
		end

	gsl_cdf_weibull_pinv (a_p: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_weibull_Pinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_weibull_Pinv"
		}"
		end

	gsl_cdf_weibull_q (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_weibull_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_weibull_Q"
		}"
		end

	gsl_cdf_weibull_qinv (a_q: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_cdf_weibull_Qinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cdf_weibull_Qinv"
		}"
		end


end -- class GSL_CDF_EXTERNALS
