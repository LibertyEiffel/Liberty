-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_eigen_francis (a_h: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_francis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis"
		}"
		end

	gsl_eigen_francis_alloc: POINTER is
 		-- gsl_eigen_francis_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_alloc()"
		}"
		end

	gsl_eigen_francis_free (a_w: POINTER) is
 		-- gsl_eigen_francis_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_free"
		}"
		end

	gsl_eigen_francis_t (a_compute_t: INTEGER; a_w: POINTER) is
 		-- gsl_eigen_francis_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_T"
		}"
		end

	gsl_eigen_francis_z (a_h: POINTER; an_eval: POINTER; a_z: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_francis_Z
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_Z"
		}"
		end

	gsl_eigen_gen (an_a: POINTER; a_b: POINTER; an_alpha: POINTER; a_beta: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_gen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen"
		}"
		end

	gsl_eigen_gen_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_gen_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_alloc"
		}"
		end

	gsl_eigen_gen_free (a_w: POINTER) is
 		-- gsl_eigen_gen_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_free"
		}"
		end

	gsl_eigen_gen_params (a_compute_s: INTEGER; a_compute_t: INTEGER; a_balance: INTEGER; a_w: POINTER) is
 		-- gsl_eigen_gen_params
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_params"
		}"
		end

	gsl_eigen_gen_qz (an_a: POINTER; a_b: POINTER; an_alpha: POINTER; a_beta: POINTER; a_q: POINTER; a_z: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_gen_QZ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_QZ"
		}"
		end

	gsl_eigen_genherm (an_a: POINTER; a_b: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_genherm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genherm"
		}"
		end

	gsl_eigen_genherm_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_genherm_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genherm_alloc"
		}"
		end

	gsl_eigen_genherm_free (a_w: POINTER) is
 		-- gsl_eigen_genherm_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genherm_free"
		}"
		end

	gsl_eigen_genherm_standardize (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_eigen_genherm_standardize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genherm_standardize"
		}"
		end

	gsl_eigen_genhermv (an_a: POINTER; a_b: POINTER; an_eval: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_genhermv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genhermv"
		}"
		end

	gsl_eigen_genhermv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_genhermv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genhermv_alloc"
		}"
		end

	gsl_eigen_genhermv_free (a_w: POINTER) is
 		-- gsl_eigen_genhermv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genhermv_free"
		}"
		end

	gsl_eigen_genhermv_sort (an_eval: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_genhermv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genhermv_sort"
		}"
		end

	gsl_eigen_gensymm (an_a: POINTER; a_b: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_gensymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymm"
		}"
		end

	gsl_eigen_gensymm_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_gensymm_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymm_alloc"
		}"
		end

	gsl_eigen_gensymm_free (a_w: POINTER) is
 		-- gsl_eigen_gensymm_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymm_free"
		}"
		end

	gsl_eigen_gensymm_standardize (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_eigen_gensymm_standardize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymm_standardize"
		}"
		end

	gsl_eigen_gensymmv (an_a: POINTER; a_b: POINTER; an_eval: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_gensymmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymmv"
		}"
		end

	gsl_eigen_gensymmv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_gensymmv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymmv_alloc"
		}"
		end

	gsl_eigen_gensymmv_free (a_w: POINTER) is
 		-- gsl_eigen_gensymmv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymmv_free"
		}"
		end

	gsl_eigen_gensymmv_sort (an_eval: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_gensymmv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gensymmv_sort"
		}"
		end

	gsl_eigen_genv (an_a: POINTER; a_b: POINTER; an_alpha: POINTER; a_beta: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_genv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genv"
		}"
		end

	gsl_eigen_genv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_genv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genv_alloc"
		}"
		end

	gsl_eigen_genv_free (a_w: POINTER) is
 		-- gsl_eigen_genv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genv_free"
		}"
		end

	gsl_eigen_genv_qz (an_a: POINTER; a_b: POINTER; an_alpha: POINTER; a_beta: POINTER; an_evec: POINTER; a_q: POINTER; a_z: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_genv_QZ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genv_QZ"
		}"
		end

	gsl_eigen_genv_sort (an_alpha: POINTER; a_beta: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_genv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_genv_sort"
		}"
		end

	gsl_eigen_herm (an_a: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_herm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_herm"
		}"
		end

	gsl_eigen_herm_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_herm_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_herm_alloc"
		}"
		end

	gsl_eigen_herm_free (a_w: POINTER) is
 		-- gsl_eigen_herm_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_herm_free"
		}"
		end

	gsl_eigen_hermv (an_a: POINTER; an_eval: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_hermv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv"
		}"
		end

	gsl_eigen_hermv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_hermv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_alloc"
		}"
		end

	gsl_eigen_hermv_free (a_w: POINTER) is
 		-- gsl_eigen_hermv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_free"
		}"
		end

	gsl_eigen_hermv_sort (an_eval: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_hermv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_sort"
		}"
		end

	gsl_eigen_invert_jacobi (a_matrix: POINTER; an_ainv: POINTER; a_max_rot: NATURAL): INTEGER is
 		-- gsl_eigen_invert_jacobi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_invert_jacobi"
		}"
		end

	gsl_eigen_jacobi (a_matrix: POINTER; an_eval: POINTER; an_evec: POINTER; a_max_rot: NATURAL; a_nrot: POINTER): INTEGER is
 		-- gsl_eigen_jacobi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_jacobi"
		}"
		end

	gsl_eigen_nonsymm (an_a: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_nonsymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm"
		}"
		end

	gsl_eigen_nonsymm_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_nonsymm_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_alloc"
		}"
		end

	gsl_eigen_nonsymm_free (a_w: POINTER) is
 		-- gsl_eigen_nonsymm_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_free"
		}"
		end

	gsl_eigen_nonsymm_params (a_compute_t: INTEGER; a_balance: INTEGER; a_w: POINTER) is
 		-- gsl_eigen_nonsymm_params
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_params"
		}"
		end

	gsl_eigen_nonsymm_z (an_a: POINTER; an_eval: POINTER; a_z: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_nonsymm_Z
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_Z"
		}"
		end

	gsl_eigen_nonsymmv (an_a: POINTER; an_eval: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_nonsymmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv"
		}"
		end

	gsl_eigen_nonsymmv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_nonsymmv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_alloc"
		}"
		end

	gsl_eigen_nonsymmv_free (a_w: POINTER) is
 		-- gsl_eigen_nonsymmv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_free"
		}"
		end

	gsl_eigen_nonsymmv_params (a_balance: INTEGER; a_w: POINTER) is
 		-- gsl_eigen_nonsymmv_params
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_params"
		}"
		end

	gsl_eigen_nonsymmv_sort (an_eval: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_nonsymmv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_sort"
		}"
		end

	gsl_eigen_nonsymmv_z (an_a: POINTER; an_eval: POINTER; an_evec: POINTER; a_z: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_nonsymmv_Z
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_Z"
		}"
		end

	gsl_eigen_symm (an_a: POINTER; an_eval: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_symm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symm"
		}"
		end

	gsl_eigen_symm_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_symm_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symm_alloc"
		}"
		end

	gsl_eigen_symm_free (a_w: POINTER) is
 		-- gsl_eigen_symm_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symm_free"
		}"
		end

	gsl_eigen_symmv (an_a: POINTER; an_eval: POINTER; an_evec: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_eigen_symmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symmv"
		}"
		end

	gsl_eigen_symmv_alloc (a_n: like size_t): POINTER is
 		-- gsl_eigen_symmv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symmv_alloc"
		}"
		end

	gsl_eigen_symmv_free (a_w: POINTER) is
 		-- gsl_eigen_symmv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symmv_free"
		}"
		end

	gsl_eigen_symmv_sort (an_eval: POINTER; an_evec: POINTER; a_sort_type: INTEGER): INTEGER is
 		-- gsl_eigen_symmv_sort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_symmv_sort"
		}"
		end

	gsl_schur_gen_eigvals (an_a: POINTER; a_b: POINTER; a_wr1: POINTER; a_wr2: POINTER; a_wi: POINTER; a_scale1: POINTER; a_scale2: POINTER): INTEGER is
 		-- gsl_schur_gen_eigvals
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_schur_gen_eigvals"
		}"
		end

	gsl_schur_solve_equation (a_ca: REAL; an_a: POINTER; a_z: REAL; a_d1: REAL; a_d2: REAL; a_b: POINTER; a_x: POINTER; a_s: POINTER; a_xnorm: POINTER; a_smin: REAL): INTEGER is
 		-- gsl_schur_solve_equation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_schur_solve_equation"
		}"
		end

	gsl_schur_solve_equation_z (a_ca: REAL; an_a: POINTER; a_z: POINTER; a_d1: REAL; a_d2: REAL; a_b: POINTER; a_x: POINTER; a_s: POINTER; a_xnorm: POINTER; a_smin: REAL): INTEGER is
 		-- gsl_schur_solve_equation_z
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_schur_solve_equation_z"
		}"
		end


end -- class GSL_EIGEN_EXTERNALS
