-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BLAS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- function gsl_blas_caxpy (at line 133 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_ccopy (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_ccopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ccopy"
		}"
		end

	gsl_blas_cdotc (a_x: POINTER; a_y: POINTER; a_dotc: POINTER): INTEGER is
 		-- gsl_blas_cdotc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_cdotc"
		}"
		end

	gsl_blas_cdotu (a_x: POINTER; a_y: POINTER; a_dotu: POINTER): INTEGER is
 		-- gsl_blas_cdotu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_cdotu"
		}"
		end

	-- function gsl_blas_cgemm (at line 466 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_cgemv (at line 227 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_cgerc (at line 323 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_cgeru (at line 318 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_chemm (at line 559 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_chemv (at line 313 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_cher (an_uplo: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_cher
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_cher"
		}"
		end

	-- function gsl_blas_cher2 (at line 334 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_cher2k (at line 574 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_cherk (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_beta: REAL_32; a_c: POINTER): INTEGER is
 		-- gsl_blas_cherk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_cherk"
		}"
		end

	-- function gsl_blas_cscal (at line 174 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_csscal (an_alpha: REAL_32; a_x: POINTER) is
 		-- gsl_blas_csscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_csscal"
		}"
		end

	gsl_blas_cswap (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_cswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_cswap"
		}"
		end

	-- function gsl_blas_csymm (at line 474 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_csyr2k (at line 489 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_csyrk (at line 481 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_ctrmm (at line 496 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_ctrmv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_ctrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ctrmv"
		}"
		end

	-- function gsl_blas_ctrsm (at line 503 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_ctrsv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_ctrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ctrsv"
		}"
		end

	gsl_blas_dasum (a_x: POINTER): REAL is
 		-- gsl_blas_dasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dasum"
		}"
		end

	gsl_blas_daxpy (an_alpha: REAL; a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_daxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_daxpy"
		}"
		end

	gsl_blas_dcopy (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_dcopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dcopy"
		}"
		end

	gsl_blas_ddot (a_x: POINTER; a_y: POINTER; a_result: POINTER): INTEGER is
 		-- gsl_blas_ddot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ddot"
		}"
		end

	gsl_blas_dgemm (a_trans_a: INTEGER; a_trans_b: INTEGER; an_alpha: REAL; an_a: POINTER; a_b: POINTER; a_beta: REAL; a_c: POINTER): INTEGER is
 		-- gsl_blas_dgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dgemm"
		}"
		end

	gsl_blas_dgemv (a_trans_a: INTEGER; an_alpha: REAL; an_a: POINTER; a_x: POINTER; a_beta: REAL; a_y: POINTER): INTEGER is
 		-- gsl_blas_dgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dgemv"
		}"
		end

	gsl_blas_dger (an_alpha: REAL; a_x: POINTER; a_y: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_dger
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dger"
		}"
		end

	gsl_blas_dnrm2 (a_x: POINTER): REAL is
 		-- gsl_blas_dnrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dnrm2"
		}"
		end

	gsl_blas_drot (a_x: POINTER; a_y: POINTER; a_c: REAL; a_s: REAL): INTEGER is
 		-- gsl_blas_drot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_drot"
		}"
		end

	gsl_blas_drotg (an_a: POINTER; a_b: POINTER; a_c: POINTER; a_s: POINTER): INTEGER is
 		-- gsl_blas_drotg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_drotg"
		}"
		end

	gsl_blas_drotm (a_x: POINTER; a_y: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_blas_drotm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_drotm"
		}"
		end

	gsl_blas_drotmg (a_d1: POINTER; a_d2: POINTER; a_b1: POINTER; a_b2: REAL; a_p: POINTER): INTEGER is
 		-- gsl_blas_drotmg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_drotmg"
		}"
		end

	gsl_blas_dscal (an_alpha: REAL; a_x: POINTER) is
 		-- gsl_blas_dscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dscal"
		}"
		end

	gsl_blas_dsdot (a_x: POINTER; a_y: POINTER; a_result: POINTER): INTEGER is
 		-- gsl_blas_dsdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsdot"
		}"
		end

	gsl_blas_dswap (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_dswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dswap"
		}"
		end

	gsl_blas_dsymm (a_side: INTEGER; an_uplo: INTEGER; an_alpha: REAL; an_a: POINTER; a_b: POINTER; a_beta: REAL; a_c: POINTER): INTEGER is
 		-- gsl_blas_dsymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsymm"
		}"
		end

	gsl_blas_dsymv (an_uplo: INTEGER; an_alpha: REAL; an_a: POINTER; a_x: POINTER; a_beta: REAL; a_y: POINTER): INTEGER is
 		-- gsl_blas_dsymv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsymv"
		}"
		end

	gsl_blas_dsyr (an_uplo: INTEGER; an_alpha: REAL; a_x: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_dsyr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsyr"
		}"
		end

	gsl_blas_dsyr2 (an_uplo: INTEGER; an_alpha: REAL; a_x: POINTER; a_y: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_dsyr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsyr2"
		}"
		end

	gsl_blas_dsyr2k (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL; an_a: POINTER; a_b: POINTER; a_beta: REAL; a_c: POINTER): INTEGER is
 		-- gsl_blas_dsyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsyr2k"
		}"
		end

	gsl_blas_dsyrk (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL; an_a: POINTER; a_beta: REAL; a_c: POINTER): INTEGER is
 		-- gsl_blas_dsyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dsyrk"
		}"
		end

	gsl_blas_dtrmm (a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_alpha: REAL; an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_blas_dtrmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dtrmm"
		}"
		end

	gsl_blas_dtrmv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_dtrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dtrmv"
		}"
		end

	gsl_blas_dtrsm (a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_alpha: REAL; an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_blas_dtrsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dtrsm"
		}"
		end

	gsl_blas_dtrsv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_dtrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dtrsv"
		}"
		end

	gsl_blas_dzasum (a_x: POINTER): REAL is
 		-- gsl_blas_dzasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dzasum"
		}"
		end

	gsl_blas_dznrm2 (a_x: POINTER): REAL is
 		-- gsl_blas_dznrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_dznrm2"
		}"
		end

	gsl_blas_icamax (a_x: POINTER): like size_t is
 		-- gsl_blas_icamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_icamax"
		}"
		end

	gsl_blas_idamax (a_x: POINTER): like size_t is
 		-- gsl_blas_idamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_idamax"
		}"
		end

	gsl_blas_isamax (a_x: POINTER): like size_t is
 		-- gsl_blas_isamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_isamax"
		}"
		end

	gsl_blas_izamax (a_x: POINTER): like size_t is
 		-- gsl_blas_izamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_izamax"
		}"
		end

	gsl_blas_sasum (a_x: POINTER): REAL_32 is
 		-- gsl_blas_sasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sasum"
		}"
		end

	gsl_blas_saxpy (an_alpha: REAL_32; a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_saxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_saxpy"
		}"
		end

	gsl_blas_scasum (a_x: POINTER): REAL_32 is
 		-- gsl_blas_scasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_scasum"
		}"
		end

	gsl_blas_scnrm2 (a_x: POINTER): REAL_32 is
 		-- gsl_blas_scnrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_scnrm2"
		}"
		end

	gsl_blas_scopy (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_scopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_scopy"
		}"
		end

	gsl_blas_sdot (a_x: POINTER; a_y: POINTER; a_result: POINTER): INTEGER is
 		-- gsl_blas_sdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sdot"
		}"
		end

	gsl_blas_sdsdot (an_alpha: REAL_32; a_x: POINTER; a_y: POINTER; a_result: POINTER): INTEGER is
 		-- gsl_blas_sdsdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sdsdot"
		}"
		end

	gsl_blas_sgemm (a_trans_a: INTEGER; a_trans_b: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_b: POINTER; a_beta: REAL_32; a_c: POINTER): INTEGER is
 		-- gsl_blas_sgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sgemm"
		}"
		end

	gsl_blas_sgemv (a_trans_a: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_x: POINTER; a_beta: REAL_32; a_y: POINTER): INTEGER is
 		-- gsl_blas_sgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sgemv"
		}"
		end

	gsl_blas_sger (an_alpha: REAL_32; a_x: POINTER; a_y: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_sger
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sger"
		}"
		end

	gsl_blas_snrm2 (a_x: POINTER): REAL_32 is
 		-- gsl_blas_snrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_snrm2"
		}"
		end

	gsl_blas_srot (a_x: POINTER; a_y: POINTER; a_c: REAL_32; a_s: REAL_32): INTEGER is
 		-- gsl_blas_srot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_srot"
		}"
		end

	gsl_blas_srotg (an_a: POINTER; a_b: POINTER; a_c: POINTER; a_s: POINTER): INTEGER is
 		-- gsl_blas_srotg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_srotg"
		}"
		end

	gsl_blas_srotm (a_x: POINTER; a_y: POINTER; a_p: POINTER): INTEGER is
 		-- gsl_blas_srotm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_srotm"
		}"
		end

	gsl_blas_srotmg (a_d1: POINTER; a_d2: POINTER; a_b1: POINTER; a_b2: REAL_32; a_p: POINTER): INTEGER is
 		-- gsl_blas_srotmg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_srotmg"
		}"
		end

	gsl_blas_sscal (an_alpha: REAL_32; a_x: POINTER) is
 		-- gsl_blas_sscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sscal"
		}"
		end

	gsl_blas_sswap (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_sswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_sswap"
		}"
		end

	gsl_blas_ssymm (a_side: INTEGER; an_uplo: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_b: POINTER; a_beta: REAL_32; a_c: POINTER): INTEGER is
 		-- gsl_blas_ssymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssymm"
		}"
		end

	gsl_blas_ssymv (an_uplo: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_x: POINTER; a_beta: REAL_32; a_y: POINTER): INTEGER is
 		-- gsl_blas_ssymv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssymv"
		}"
		end

	gsl_blas_ssyr (an_uplo: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_ssyr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssyr"
		}"
		end

	gsl_blas_ssyr2 (an_uplo: INTEGER; an_alpha: REAL_32; a_x: POINTER; a_y: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_ssyr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssyr2"
		}"
		end

	gsl_blas_ssyr2k (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_b: POINTER; a_beta: REAL_32; a_c: POINTER): INTEGER is
 		-- gsl_blas_ssyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssyr2k"
		}"
		end

	gsl_blas_ssyrk (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_beta: REAL_32; a_c: POINTER): INTEGER is
 		-- gsl_blas_ssyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ssyrk"
		}"
		end

	gsl_blas_strmm (a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_blas_strmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_strmm"
		}"
		end

	gsl_blas_strmv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_strmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_strmv"
		}"
		end

	gsl_blas_strsm (a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gsl_blas_strsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_strsm"
		}"
		end

	gsl_blas_strsv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_strsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_strsv"
		}"
		end

	-- function gsl_blas_zaxpy (at line 143 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_zcopy (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_zcopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zcopy"
		}"
		end

	gsl_blas_zdotc (a_x: POINTER; a_y: POINTER; a_dotc: POINTER): INTEGER is
 		-- gsl_blas_zdotc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zdotc"
		}"
		end

	gsl_blas_zdotu (a_x: POINTER; a_y: POINTER; a_dotu: POINTER): INTEGER is
 		-- gsl_blas_zdotu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zdotu"
		}"
		end

	gsl_blas_zdscal (an_alpha: REAL; a_x: POINTER) is
 		-- gsl_blas_zdscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zdscal"
		}"
		end

	-- function gsl_blas_zgemm (at line 511 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zgemv (at line 244 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zgerc (at line 351 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zgeru (at line 346 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zhemm (at line 582 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zhemv (at line 341 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_zher (an_uplo: INTEGER; an_alpha: REAL; a_x: POINTER; an_a: POINTER): INTEGER is
 		-- gsl_blas_zher
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zher"
		}"
		end

	-- function gsl_blas_zher2 (at line 362 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zher2k (at line 597 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_zherk (an_uplo: INTEGER; a_trans: INTEGER; an_alpha: REAL; an_a: POINTER; a_beta: REAL; a_c: POINTER): INTEGER is
 		-- gsl_blas_zherk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zherk"
		}"
		end

	-- function gsl_blas_zscal (at line 175 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_zswap (a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_blas_zswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_zswap"
		}"
		end

	-- function gsl_blas_zsymm (at line 519 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zsyr2k (at line 534 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_zsyrk (at line 526 in file /usr/include/gsl/gsl_blas.h is not wrappable
	-- function gsl_blas_ztrmm (at line 541 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_ztrmv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_ztrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ztrmv"
		}"
		end

	-- function gsl_blas_ztrsm (at line 548 in file /usr/include/gsl/gsl_blas.h is not wrappable
	gsl_blas_ztrsv (an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; an_a: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_blas_ztrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_blas_ztrsv"
		}"
		end


end -- class GSL_BLAS_EXTERNALS
