-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_LINALG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_linalg_balance_accum (an_a: POINTER; a_d: POINTER): INTEGER is
 		-- gsl_linalg_balance_accum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_balance_accum"
		}"
		end

	gsl_linalg_balance_columns (an_a: POINTER; a_d: POINTER): INTEGER is
 		-- gsl_linalg_balance_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_balance_columns"
		}"
		end

	gsl_linalg_balance_matrix (an_a: POINTER; a_d: POINTER): INTEGER is
 		-- gsl_linalg_balance_matrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_balance_matrix"
		}"
		end

	gsl_linalg_bidiag_decomp (an_a: POINTER; a_tau_u: POINTER; a_tau_v: POINTER): INTEGER is
 		-- gsl_linalg_bidiag_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_bidiag_decomp"
		}"
		end

	gsl_linalg_bidiag_unpack (an_a: POINTER; a_tau_u: POINTER; an_u: POINTER; a_tau_v: POINTER; a_v: POINTER; a_diag: POINTER; a_superdiag: POINTER): INTEGER is
 		-- gsl_linalg_bidiag_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_bidiag_unpack"
		}"
		end

	gsl_linalg_bidiag_unpack2 (an_a: POINTER; a_tau_u: POINTER; a_tau_v: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_bidiag_unpack2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_bidiag_unpack2"
		}"
		end

	gsl_linalg_bidiag_unpack_b (an_a: POINTER; a_diag: POINTER; a_superdiag: POINTER): INTEGER is
 		-- gsl_linalg_bidiag_unpack_B
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_bidiag_unpack_B"
		}"
		end

	gsl_linalg_cholesky_decomp (an_a: POINTER): INTEGER is
 		-- gsl_linalg_cholesky_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_cholesky_decomp"
		}"
		end

	gsl_linalg_cholesky_decomp_unit (an_a: POINTER; a_d: POINTER): INTEGER is
 		-- gsl_linalg_cholesky_decomp_unit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_cholesky_decomp_unit"
		}"
		end

	gsl_linalg_cholesky_invert (a_cholesky: POINTER): INTEGER is
 		-- gsl_linalg_cholesky_invert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_cholesky_invert"
		}"
		end

	gsl_linalg_cholesky_solve (a_cholesky: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_cholesky_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_cholesky_solve"
		}"
		end

	gsl_linalg_cholesky_svx (a_cholesky: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_cholesky_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_cholesky_svx"
		}"
		end

	gsl_linalg_complex_cholesky_decomp (an_a: POINTER): INTEGER is
 		-- gsl_linalg_complex_cholesky_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_cholesky_decomp"
		}"
		end

	gsl_linalg_complex_cholesky_invert (a_cholesky: POINTER): INTEGER is
 		-- gsl_linalg_complex_cholesky_invert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_cholesky_invert"
		}"
		end

	gsl_linalg_complex_cholesky_solve (a_cholesky: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_complex_cholesky_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_cholesky_solve"
		}"
		end

	gsl_linalg_complex_cholesky_svx (a_cholesky: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_complex_cholesky_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_cholesky_svx"
		}"
		end

	-- function gsl_linalg_complex_householder_hm (at line 110 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	-- function gsl_linalg_complex_householder_hv (at line 118 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	-- function gsl_linalg_complex_householder_mh (at line 114 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	-- function gsl_linalg_complex_householder_transform (at line 91 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	gsl_linalg_complex_lu_decomp (an_a: POINTER; a_p: POINTER; a_signum: POINTER): INTEGER is
 		-- gsl_linalg_complex_LU_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_decomp"
		}"
		end

	-- function gsl_linalg_complex_LU_det (at line 227 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	gsl_linalg_complex_lu_invert (a_lu: POINTER; a_p: POINTER; an_inverse: POINTER): INTEGER is
 		-- gsl_linalg_complex_LU_invert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_invert"
		}"
		end

	gsl_linalg_complex_lu_lndet (a_lu: POINTER): REAL is
 		-- gsl_linalg_complex_LU_lndet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_lndet"
		}"
		end

	gsl_linalg_complex_lu_refine (an_a: POINTER; a_lu: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER; a_residual: POINTER): INTEGER is
 		-- gsl_linalg_complex_LU_refine
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_refine"
		}"
		end

	-- function gsl_linalg_complex_LU_sgndet (at line 232 in file /usr/include/gsl/gsl_linalg.h is not wrappable
	gsl_linalg_complex_lu_solve (a_lu: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_complex_LU_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_solve"
		}"
		end

	gsl_linalg_complex_lu_svx (a_lu: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_complex_LU_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_complex_LU_svx"
		}"
		end

	gsl_linalg_exponential_ss (an_a: POINTER; an_e_a: POINTER; a_mode: NATURAL): INTEGER is
 		-- gsl_linalg_exponential_ss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_exponential_ss"
		}"
		end

	gsl_linalg_hermtd_decomp (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_hermtd_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hermtd_decomp"
		}"
		end

	gsl_linalg_hermtd_unpack (an_a: POINTER; a_tau: POINTER; an_u: POINTER; a_diag: POINTER; a_sudiag: POINTER): INTEGER is
 		-- gsl_linalg_hermtd_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hermtd_unpack"
		}"
		end

	gsl_linalg_hermtd_unpack_t (an_a: POINTER; a_diag: POINTER; a_subdiag: POINTER): INTEGER is
 		-- gsl_linalg_hermtd_unpack_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hermtd_unpack_T"
		}"
		end

	gsl_linalg_hessenberg (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg"
		}"
		end

	gsl_linalg_hessenberg_decomp (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg_decomp"
		}"
		end

	gsl_linalg_hessenberg_set_zero (a_h: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg_set_zero"
		}"
		end

	gsl_linalg_hessenberg_submatrix (a_m: POINTER; an_a: POINTER; a_top: like size_t; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg_submatrix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg_submatrix"
		}"
		end

	gsl_linalg_hessenberg_unpack (a_h: POINTER; a_tau: POINTER; an_u: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg_unpack"
		}"
		end

	gsl_linalg_hessenberg_unpack_accum (a_h: POINTER; a_tau: POINTER; an_u: POINTER): INTEGER is
 		-- gsl_linalg_hessenberg_unpack_accum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hessenberg_unpack_accum"
		}"
		end

	gsl_linalg_hesstri_decomp (an_a: POINTER; a_b: POINTER; an_u: POINTER; a_v: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_linalg_hesstri_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_hesstri_decomp"
		}"
		end

	gsl_linalg_hh_solve (an_a: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_HH_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_HH_solve"
		}"
		end

	gsl_linalg_hh_svx (an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_HH_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_HH_svx"
		}"
		end

	gsl_linalg_householder_hm (a_tau: REAL; a_v: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_linalg_householder_hm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_householder_hm"
		}"
		end

	gsl_linalg_householder_hm1 (a_tau: REAL; an_a: POINTER): INTEGER is
 		-- gsl_linalg_householder_hm1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_householder_hm1"
		}"
		end

	gsl_linalg_householder_hv (a_tau: REAL; a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_linalg_householder_hv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_householder_hv"
		}"
		end

	gsl_linalg_householder_mh (a_tau: REAL; a_v: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_linalg_householder_mh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_householder_mh"
		}"
		end

	gsl_linalg_householder_transform (a_v: POINTER): REAL is
 		-- gsl_linalg_householder_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_householder_transform"
		}"
		end

	gsl_linalg_l_solve_t (a_l: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_L_solve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_L_solve_T"
		}"
		end

	gsl_linalg_lq_decomp (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_LQ_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_decomp"
		}"
		end

	gsl_linalg_lq_lqsolve (a_q: POINTER; a_l: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LQ_LQsolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_LQsolve"
		}"
		end

	gsl_linalg_lq_lsolve_t (a_lq: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LQ_Lsolve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_Lsolve_T"
		}"
		end

	gsl_linalg_lq_lssolve_t (a_lq: POINTER; a_tau: POINTER; a_b: POINTER; a_x: POINTER; a_residual: POINTER): INTEGER is
 		-- gsl_linalg_LQ_lssolve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_lssolve_T"
		}"
		end

	gsl_linalg_lq_lsvx_t (a_lq: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LQ_Lsvx_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_Lsvx_T"
		}"
		end

	gsl_linalg_lq_solve_t (a_lq: POINTER; a_tau: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LQ_solve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_solve_T"
		}"
		end

	gsl_linalg_lq_svx_t (a_lq: POINTER; a_tau: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LQ_svx_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_svx_T"
		}"
		end

	gsl_linalg_lq_unpack (a_lq: POINTER; a_tau: POINTER; a_q: POINTER; a_l: POINTER): INTEGER is
 		-- gsl_linalg_LQ_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_unpack"
		}"
		end

	gsl_linalg_lq_update (a_q: POINTER; a_r: POINTER; a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_linalg_LQ_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_update"
		}"
		end

	gsl_linalg_lq_vec_q (a_lq: POINTER; a_tau: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_LQ_vecQ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_vecQ"
		}"
		end

	gsl_linalg_lq_vec_qt (a_lq: POINTER; a_tau: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_LQ_vecQT
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LQ_vecQT"
		}"
		end

	gsl_linalg_lu_decomp (an_a: POINTER; a_p: POINTER; a_signum: POINTER): INTEGER is
 		-- gsl_linalg_LU_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_decomp"
		}"
		end

	gsl_linalg_lu_det (a_lu: POINTER; a_signum: INTEGER): REAL is
 		-- gsl_linalg_LU_det
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_det"
		}"
		end

	gsl_linalg_lu_invert (a_lu: POINTER; a_p: POINTER; an_inverse: POINTER): INTEGER is
 		-- gsl_linalg_LU_invert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_invert"
		}"
		end

	gsl_linalg_lu_lndet (a_lu: POINTER): REAL is
 		-- gsl_linalg_LU_lndet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_lndet"
		}"
		end

	gsl_linalg_lu_refine (an_a: POINTER; a_lu: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER; a_residual: POINTER): INTEGER is
 		-- gsl_linalg_LU_refine
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_refine"
		}"
		end

	gsl_linalg_lu_sgndet (a_lu: POINTER; a_signum: INTEGER): INTEGER is
 		-- gsl_linalg_LU_sgndet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_sgndet"
		}"
		end

	gsl_linalg_lu_solve (a_lu: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LU_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_solve"
		}"
		end

	gsl_linalg_lu_svx (a_lu: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_LU_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_LU_svx"
		}"
		end

	gsl_linalg_matmult (an_a: POINTER; a_b: POINTER; a_c: POINTER): INTEGER is
 		-- gsl_linalg_matmult
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_matmult"
		}"
		end

	gsl_linalg_matmult_mod (an_a: POINTER; a_mod_a: INTEGER; a_b: POINTER; a_mod_b: INTEGER; a_c: POINTER): INTEGER is
 		-- gsl_linalg_matmult_mod
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_matmult_mod"
		}"
		end

	gsl_linalg_ptlq_decomp (an_a: POINTER; a_tau: POINTER; a_p: POINTER; a_signum: POINTER; a_norm: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_decomp"
		}"
		end

	gsl_linalg_ptlq_decomp2 (an_a: POINTER; a_q: POINTER; a_r: POINTER; a_tau: POINTER; a_p: POINTER; a_signum: POINTER; a_norm: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_decomp2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_decomp2"
		}"
		end

	gsl_linalg_ptlq_lqsolve_t (a_q: POINTER; a_l: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_LQsolve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_LQsolve_T"
		}"
		end

	gsl_linalg_ptlq_lsolve_t (a_lq: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_Lsolve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_Lsolve_T"
		}"
		end

	gsl_linalg_ptlq_lsvx_t (a_lq: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_Lsvx_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_Lsvx_T"
		}"
		end

	gsl_linalg_ptlq_solve_t (a_qr: POINTER; a_tau: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_solve_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_solve_T"
		}"
		end

	gsl_linalg_ptlq_svx_t (a_lq: POINTER; a_tau: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_svx_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_svx_T"
		}"
		end

	gsl_linalg_ptlq_update (a_q: POINTER; a_l: POINTER; a_p: POINTER; a_v: POINTER; a_w: POINTER): INTEGER is
 		-- gsl_linalg_PTLQ_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_PTLQ_update"
		}"
		end

	gsl_linalg_qr_decomp (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_QR_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_decomp"
		}"
		end

	gsl_linalg_qr_lssolve (a_qr: POINTER; a_tau: POINTER; a_b: POINTER; a_x: POINTER; a_residual: POINTER): INTEGER is
 		-- gsl_linalg_QR_lssolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_lssolve"
		}"
		end

	gsl_linalg_qr_qrsolve (a_q: POINTER; a_r: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QR_QRsolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_QRsolve"
		}"
		end

	gsl_linalg_qr_qtmat (a_qr: POINTER; a_tau: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_linalg_QR_QTmat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_QTmat"
		}"
		end

	gsl_linalg_qr_qtvec (a_qr: POINTER; a_tau: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_QR_QTvec
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_QTvec"
		}"
		end

	gsl_linalg_qr_qvec (a_qr: POINTER; a_tau: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_QR_Qvec
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_Qvec"
		}"
		end

	gsl_linalg_qr_rsolve (a_qr: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QR_Rsolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_Rsolve"
		}"
		end

	gsl_linalg_qr_rsvx (a_qr: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QR_Rsvx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_Rsvx"
		}"
		end

	gsl_linalg_qr_solve (a_qr: POINTER; a_tau: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QR_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_solve"
		}"
		end

	gsl_linalg_qr_svx (a_qr: POINTER; a_tau: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QR_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_svx"
		}"
		end

	gsl_linalg_qr_unpack (a_qr: POINTER; a_tau: POINTER; a_q: POINTER; a_r: POINTER): INTEGER is
 		-- gsl_linalg_QR_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_unpack"
		}"
		end

	gsl_linalg_qr_update (a_q: POINTER; a_r: POINTER; a_w: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_QR_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QR_update"
		}"
		end

	gsl_linalg_qrpt_decomp (an_a: POINTER; a_tau: POINTER; a_p: POINTER; a_signum: POINTER; a_norm: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_decomp"
		}"
		end

	gsl_linalg_qrpt_decomp2 (an_a: POINTER; a_q: POINTER; a_r: POINTER; a_tau: POINTER; a_p: POINTER; a_signum: POINTER; a_norm: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_decomp2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_decomp2"
		}"
		end

	gsl_linalg_qrpt_qrsolve (a_q: POINTER; a_r: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_QRsolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_QRsolve"
		}"
		end

	gsl_linalg_qrpt_rsolve (a_qr: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_Rsolve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_Rsolve"
		}"
		end

	gsl_linalg_qrpt_rsvx (a_qr: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_Rsvx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_Rsvx"
		}"
		end

	gsl_linalg_qrpt_solve (a_qr: POINTER; a_tau: POINTER; a_p: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_solve"
		}"
		end

	gsl_linalg_qrpt_svx (a_qr: POINTER; a_tau: POINTER; a_p: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_svx"
		}"
		end

	gsl_linalg_qrpt_update (a_q: POINTER; a_r: POINTER; a_p: POINTER; an_u: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_linalg_QRPT_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_QRPT_update"
		}"
		end

	gsl_linalg_r_solve (a_r: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_R_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_R_solve"
		}"
		end

	gsl_linalg_r_svx (a_r: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_R_svx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_R_svx"
		}"
		end

	gsl_linalg_solve_cyc_tridiag (a_diag: POINTER; an_abovediag: POINTER; a_belowdiag: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_solve_cyc_tridiag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_solve_cyc_tridiag"
		}"
		end

	gsl_linalg_solve_symm_cyc_tridiag (a_diag: POINTER; an_offdiag: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_solve_symm_cyc_tridiag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_solve_symm_cyc_tridiag"
		}"
		end

	gsl_linalg_solve_symm_tridiag (a_diag: POINTER; an_offdiag: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_solve_symm_tridiag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_solve_symm_tridiag"
		}"
		end

	gsl_linalg_solve_tridiag (a_diag: POINTER; an_abovediag: POINTER; a_belowdiag: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_solve_tridiag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_solve_tridiag"
		}"
		end

	gsl_linalg_sv_decomp (an_a: POINTER; a_v: POINTER; a_s: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_linalg_SV_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_SV_decomp"
		}"
		end

	gsl_linalg_sv_decomp_jacobi (an_a: POINTER; a_q: POINTER; a_s: POINTER): INTEGER is
 		-- gsl_linalg_SV_decomp_jacobi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_SV_decomp_jacobi"
		}"
		end

	gsl_linalg_sv_decomp_mod (an_a: POINTER; a_x: POINTER; a_v: POINTER; a_s: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_linalg_SV_decomp_mod
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_SV_decomp_mod"
		}"
		end

	gsl_linalg_sv_solve (an_u: POINTER; a_q: POINTER; a_s: POINTER; a_b: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_linalg_SV_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_SV_solve"
		}"
		end

	gsl_linalg_symmtd_decomp (an_a: POINTER; a_tau: POINTER): INTEGER is
 		-- gsl_linalg_symmtd_decomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_symmtd_decomp"
		}"
		end

	gsl_linalg_symmtd_unpack (an_a: POINTER; a_tau: POINTER; a_q: POINTER; a_diag: POINTER; a_subdiag: POINTER): INTEGER is
 		-- gsl_linalg_symmtd_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_symmtd_unpack"
		}"
		end

	gsl_linalg_symmtd_unpack_t (an_a: POINTER; a_diag: POINTER; a_subdiag: POINTER): INTEGER is
 		-- gsl_linalg_symmtd_unpack_T
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_linalg_symmtd_unpack_T"
		}"
		end


end -- class GSL_LINALG_EXTERNALS
