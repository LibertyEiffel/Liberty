-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_RANDIST_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_ran_bernoulli (a_r: POINTER; a_p: REAL): NATURAL is
 		-- gsl_ran_bernoulli
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_bernoulli"
		}"
		end

	gsl_ran_bernoulli_pdf (a_k: NATURAL; a_p: REAL): REAL is
 		-- gsl_ran_bernoulli_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_bernoulli_pdf"
		}"
		end

	gsl_ran_beta (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_beta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_beta"
		}"
		end

	gsl_ran_beta_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_beta_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_beta_pdf"
		}"
		end

	gsl_ran_binomial (a_r: POINTER; a_p: REAL; a_n: NATURAL): NATURAL is
 		-- gsl_ran_binomial
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_binomial"
		}"
		end

	gsl_ran_binomial_knuth (a_r: POINTER; a_p: REAL; a_n: NATURAL): NATURAL is
 		-- gsl_ran_binomial_knuth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_binomial_knuth"
		}"
		end

	gsl_ran_binomial_pdf (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_ran_binomial_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_binomial_pdf"
		}"
		end

	gsl_ran_binomial_tpe (a_r: POINTER; a_p: REAL; a_n: NATURAL): NATURAL is
 		-- gsl_ran_binomial_tpe
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_binomial_tpe"
		}"
		end

	gsl_ran_bivariate_gaussian (a_r: POINTER; a_sigma_x: REAL; a_sigma_y: REAL; a_rho: REAL; a_x: POINTER; a_y: POINTER) is
 		-- gsl_ran_bivariate_gaussian
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_bivariate_gaussian"
		}"
		end

	gsl_ran_bivariate_gaussian_pdf (a_x: REAL; a_y: REAL; a_sigma_x: REAL; a_sigma_y: REAL; a_rho: REAL): REAL is
 		-- gsl_ran_bivariate_gaussian_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_bivariate_gaussian_pdf"
		}"
		end

	gsl_ran_cauchy (a_r: POINTER; an_a: REAL): REAL is
 		-- gsl_ran_cauchy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_cauchy"
		}"
		end

	gsl_ran_cauchy_pdf (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_ran_cauchy_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_cauchy_pdf"
		}"
		end

	gsl_ran_chisq (a_r: POINTER; a_nu: REAL): REAL is
 		-- gsl_ran_chisq
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_chisq"
		}"
		end

	gsl_ran_chisq_pdf (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_ran_chisq_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_chisq_pdf"
		}"
		end

	gsl_ran_choose (a_r: POINTER; a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_n: like size_t; a_size: like size_t): INTEGER is
 		-- gsl_ran_choose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_choose"
		}"
		end

	gsl_ran_dir_2d (a_r: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gsl_ran_dir_2d
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dir_2d"
		}"
		end

	gsl_ran_dir_2d_trig_method (a_r: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gsl_ran_dir_2d_trig_method
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dir_2d_trig_method"
		}"
		end

	gsl_ran_dir_3d (a_r: POINTER; a_x: POINTER; a_y: POINTER; a_z: POINTER) is
 		-- gsl_ran_dir_3d
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dir_3d"
		}"
		end

	gsl_ran_dir_nd (a_r: POINTER; a_n: like size_t; a_x: POINTER) is
 		-- gsl_ran_dir_nd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dir_nd"
		}"
		end

	gsl_ran_dirichlet (a_r: POINTER; a_k: like size_t; an_alpha: POINTER; a_theta: POINTER) is
 		-- gsl_ran_dirichlet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dirichlet"
		}"
		end

	gsl_ran_dirichlet_lnpdf (a_k: like size_t; an_alpha: POINTER; a_theta: POINTER): REAL is
 		-- gsl_ran_dirichlet_lnpdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dirichlet_lnpdf"
		}"
		end

	gsl_ran_dirichlet_pdf (a_k: like size_t; an_alpha: POINTER; a_theta: POINTER): REAL is
 		-- gsl_ran_dirichlet_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_dirichlet_pdf"
		}"
		end

	gsl_ran_discrete (a_r: POINTER; a_g: POINTER): like size_t is
 		-- gsl_ran_discrete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete"
		}"
		end

	gsl_ran_discrete_free (a_g: POINTER) is
 		-- gsl_ran_discrete_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_free"
		}"
		end

	gsl_ran_discrete_pdf (a_k: like size_t; a_g: POINTER): REAL is
 		-- gsl_ran_discrete_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_pdf"
		}"
		end

	gsl_ran_discrete_preproc (a_k: like size_t; a_p: POINTER): POINTER is
 		-- gsl_ran_discrete_preproc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_preproc"
		}"
		end

	gsl_ran_erlang (a_r: POINTER; an_a: REAL; a_n: REAL): REAL is
 		-- gsl_ran_erlang
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_erlang"
		}"
		end

	gsl_ran_erlang_pdf (a_x: REAL; an_a: REAL; a_n: REAL): REAL is
 		-- gsl_ran_erlang_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_erlang_pdf"
		}"
		end

	gsl_ran_exponential (a_r: POINTER; a_mu: REAL): REAL is
 		-- gsl_ran_exponential
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_exponential"
		}"
		end

	gsl_ran_exponential_pdf (a_x: REAL; a_mu: REAL): REAL is
 		-- gsl_ran_exponential_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_exponential_pdf"
		}"
		end

	gsl_ran_exppow (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_exppow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_exppow"
		}"
		end

	gsl_ran_exppow_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_exppow_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_exppow_pdf"
		}"
		end

	gsl_ran_fdist (a_r: POINTER; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_ran_fdist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_fdist"
		}"
		end

	gsl_ran_fdist_pdf (a_x: REAL; a_nu1: REAL; a_nu2: REAL): REAL is
 		-- gsl_ran_fdist_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_fdist_pdf"
		}"
		end

	gsl_ran_flat (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_flat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_flat"
		}"
		end

	gsl_ran_flat_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_flat_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_flat_pdf"
		}"
		end

	gsl_ran_gamma (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gamma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gamma"
		}"
		end

	gsl_ran_gamma_int (a_r: POINTER; an_a: NATURAL): REAL is
 		-- gsl_ran_gamma_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gamma_int"
		}"
		end

	gsl_ran_gamma_knuth (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gamma_knuth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gamma_knuth"
		}"
		end

	gsl_ran_gamma_mt (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gamma_mt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gamma_mt"
		}"
		end

	gsl_ran_gamma_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gamma_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gamma_pdf"
		}"
		end

	gsl_ran_gaussian (a_r: POINTER; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian"
		}"
		end

	gsl_ran_gaussian_pdf (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian_pdf"
		}"
		end

	gsl_ran_gaussian_ratio_method (a_r: POINTER; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian_ratio_method
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian_ratio_method"
		}"
		end

	gsl_ran_gaussian_tail (a_r: POINTER; an_a: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian_tail
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian_tail"
		}"
		end

	gsl_ran_gaussian_tail_pdf (a_x: REAL; an_a: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian_tail_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian_tail_pdf"
		}"
		end

	gsl_ran_gaussian_ziggurat (a_r: POINTER; a_sigma: REAL): REAL is
 		-- gsl_ran_gaussian_ziggurat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gaussian_ziggurat"
		}"
		end

	gsl_ran_geometric (a_r: POINTER; a_p: REAL): NATURAL is
 		-- gsl_ran_geometric
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_geometric"
		}"
		end

	gsl_ran_geometric_pdf (a_k: NATURAL; a_p: REAL): REAL is
 		-- gsl_ran_geometric_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_geometric_pdf"
		}"
		end

	gsl_ran_gumbel1 (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gumbel1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gumbel1"
		}"
		end

	gsl_ran_gumbel1_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gumbel1_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gumbel1_pdf"
		}"
		end

	gsl_ran_gumbel2 (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gumbel2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gumbel2"
		}"
		end

	gsl_ran_gumbel2_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_gumbel2_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_gumbel2_pdf"
		}"
		end

	gsl_ran_hypergeometric (a_r: POINTER; a_n1: NATURAL; a_n2: NATURAL; a_t: NATURAL): NATURAL is
 		-- gsl_ran_hypergeometric
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_hypergeometric"
		}"
		end

	gsl_ran_hypergeometric_pdf (a_k: NATURAL; a_n1: NATURAL; a_n2: NATURAL; a_t: NATURAL): REAL is
 		-- gsl_ran_hypergeometric_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_hypergeometric_pdf"
		}"
		end

	gsl_ran_landau (a_r: POINTER): REAL is
 		-- gsl_ran_landau
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_landau"
		}"
		end

	gsl_ran_landau_pdf (a_x: REAL): REAL is
 		-- gsl_ran_landau_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_landau_pdf"
		}"
		end

	gsl_ran_laplace (a_r: POINTER; an_a: REAL): REAL is
 		-- gsl_ran_laplace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_laplace"
		}"
		end

	gsl_ran_laplace_pdf (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_ran_laplace_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_laplace_pdf"
		}"
		end

	gsl_ran_levy (a_r: POINTER; a_c: REAL; an_alpha: REAL): REAL is
 		-- gsl_ran_levy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_levy"
		}"
		end

	gsl_ran_levy_skew (a_r: POINTER; a_c: REAL; an_alpha: REAL; a_beta: REAL): REAL is
 		-- gsl_ran_levy_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_levy_skew"
		}"
		end

	gsl_ran_logarithmic (a_r: POINTER; a_p: REAL): NATURAL is
 		-- gsl_ran_logarithmic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_logarithmic"
		}"
		end

	gsl_ran_logarithmic_pdf (a_k: NATURAL; a_p: REAL): REAL is
 		-- gsl_ran_logarithmic_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_logarithmic_pdf"
		}"
		end

	gsl_ran_logistic (a_r: POINTER; an_a: REAL): REAL is
 		-- gsl_ran_logistic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_logistic"
		}"
		end

	gsl_ran_logistic_pdf (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_ran_logistic_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_logistic_pdf"
		}"
		end

	gsl_ran_lognormal (a_r: POINTER; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_lognormal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_lognormal"
		}"
		end

	gsl_ran_lognormal_pdf (a_x: REAL; a_zeta: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_lognormal_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_lognormal_pdf"
		}"
		end

	gsl_ran_multinomial (a_r: POINTER; a_k: like size_t; a_n: NATURAL; a_p: POINTER; a_n: POINTER) is
 		-- gsl_ran_multinomial
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_multinomial"
		}"
		end

	gsl_ran_multinomial_lnpdf (a_k: like size_t; a_p: POINTER; a_n: POINTER): REAL is
 		-- gsl_ran_multinomial_lnpdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_multinomial_lnpdf"
		}"
		end

	gsl_ran_multinomial_pdf (a_k: like size_t; a_p: POINTER; a_n: POINTER): REAL is
 		-- gsl_ran_multinomial_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_multinomial_pdf"
		}"
		end

	gsl_ran_negative_binomial (a_r: POINTER; a_p: REAL; a_n: REAL): NATURAL is
 		-- gsl_ran_negative_binomial
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_negative_binomial"
		}"
		end

	gsl_ran_negative_binomial_pdf (a_k: NATURAL; a_p: REAL; a_n: REAL): REAL is
 		-- gsl_ran_negative_binomial_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_negative_binomial_pdf"
		}"
		end

	gsl_ran_pareto (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_pareto
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_pareto"
		}"
		end

	gsl_ran_pareto_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_pareto_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_pareto_pdf"
		}"
		end

	gsl_ran_pascal (a_r: POINTER; a_p: REAL; a_n: NATURAL): NATURAL is
 		-- gsl_ran_pascal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_pascal"
		}"
		end

	gsl_ran_pascal_pdf (a_k: NATURAL; a_p: REAL; a_n: NATURAL): REAL is
 		-- gsl_ran_pascal_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_pascal_pdf"
		}"
		end

	gsl_ran_poisson (a_r: POINTER; a_mu: REAL): NATURAL is
 		-- gsl_ran_poisson
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_poisson"
		}"
		end

	gsl_ran_poisson_array (a_r: POINTER; a_n: like size_t; an_array: POINTER; a_mu: REAL) is
 		-- gsl_ran_poisson_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_poisson_array"
		}"
		end

	gsl_ran_poisson_pdf (a_k: NATURAL; a_mu: REAL): REAL is
 		-- gsl_ran_poisson_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_poisson_pdf"
		}"
		end

	gsl_ran_rayleigh (a_r: POINTER; a_sigma: REAL): REAL is
 		-- gsl_ran_rayleigh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_rayleigh"
		}"
		end

	gsl_ran_rayleigh_pdf (a_x: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_rayleigh_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_rayleigh_pdf"
		}"
		end

	gsl_ran_rayleigh_tail (a_r: POINTER; an_a: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_rayleigh_tail
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_rayleigh_tail"
		}"
		end

	gsl_ran_rayleigh_tail_pdf (a_x: REAL; an_a: REAL; a_sigma: REAL): REAL is
 		-- gsl_ran_rayleigh_tail_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_rayleigh_tail_pdf"
		}"
		end

	gsl_ran_sample (a_r: POINTER; a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_n: like size_t; a_size: like size_t) is
 		-- gsl_ran_sample
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_sample"
		}"
		end

	gsl_ran_shuffle (a_r: POINTER; a_base: POINTER; a_nmembm: like size_t; a_size: like size_t) is
 		-- gsl_ran_shuffle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_shuffle"
		}"
		end

	gsl_ran_tdist (a_r: POINTER; a_nu: REAL): REAL is
 		-- gsl_ran_tdist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_tdist"
		}"
		end

	gsl_ran_tdist_pdf (a_x: REAL; a_nu: REAL): REAL is
 		-- gsl_ran_tdist_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_tdist_pdf"
		}"
		end

	gsl_ran_ugaussian (a_r: POINTER): REAL is
 		-- gsl_ran_ugaussian
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_ugaussian"
		}"
		end

	gsl_ran_ugaussian_pdf (a_x: REAL): REAL is
 		-- gsl_ran_ugaussian_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_ugaussian_pdf"
		}"
		end

	gsl_ran_ugaussian_ratio_method (a_r: POINTER): REAL is
 		-- gsl_ran_ugaussian_ratio_method
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_ugaussian_ratio_method"
		}"
		end

	gsl_ran_ugaussian_tail (a_r: POINTER; an_a: REAL): REAL is
 		-- gsl_ran_ugaussian_tail
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_ugaussian_tail"
		}"
		end

	gsl_ran_ugaussian_tail_pdf (a_x: REAL; an_a: REAL): REAL is
 		-- gsl_ran_ugaussian_tail_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_ugaussian_tail_pdf"
		}"
		end

	gsl_ran_weibull (a_r: POINTER; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_weibull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_weibull"
		}"
		end

	gsl_ran_weibull_pdf (a_x: REAL; an_a: REAL; a_b: REAL): REAL is
 		-- gsl_ran_weibull_pdf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_weibull_pdf"
		}"
		end


end -- class GSL_RANDIST_EXTERNALS
