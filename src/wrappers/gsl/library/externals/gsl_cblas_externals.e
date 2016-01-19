-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_CBLAS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	cblas_caxpy (a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_caxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_caxpy"
		}"
		end

	cblas_ccopy (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_ccopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ccopy"
		}"
		end

	cblas_cdotc_sub (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_dotc: POINTER) is
 		-- cblas_cdotc_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cdotc_sub"
		}"
		end

	cblas_cdotu_sub (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_dotu: POINTER) is
 		-- cblas_cdotu_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cdotu_sub"
		}"
		end

	cblas_cgbmv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; a_kl: INTEGER; a_ku: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_cgbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cgbmv"
		}"
		end

	cblas_cgemm (an_order: INTEGER; a_trans_a: INTEGER; a_trans_b: INTEGER; a_m: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_cgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cgemm"
		}"
		end

	cblas_cgemv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_cgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cgemv"
		}"
		end

	cblas_cgerc (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_cgerc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cgerc"
		}"
		end

	cblas_cgeru (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_cgeru
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cgeru"
		}"
		end

	cblas_chbmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_chbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chbmv"
		}"
		end

	cblas_chemm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_chemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chemm"
		}"
		end

	cblas_chemv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_chemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chemv"
		}"
		end

	cblas_cher (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_cher
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cher"
		}"
		end

	cblas_cher2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_cher2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cher2"
		}"
		end

	cblas_cher2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_cher2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cher2k"
		}"
		end

	cblas_cherk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_cherk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cherk"
		}"
		end

	cblas_chpmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_chpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chpmv"
		}"
		end

	cblas_chpr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER) is
 		-- cblas_chpr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chpr"
		}"
		end

	cblas_chpr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_ap: POINTER) is
 		-- cblas_chpr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_chpr2"
		}"
		end

	cblas_cscal (a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_cscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cscal"
		}"
		end

	cblas_csscal (a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_csscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_csscal"
		}"
		end

	cblas_cswap (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_cswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_cswap"
		}"
		end

	cblas_csymm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_csymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_csymm"
		}"
		end

	cblas_csyr2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_csyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_csyr2k"
		}"
		end

	cblas_csyrk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_csyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_csyrk"
		}"
		end

	cblas_ctbmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctbmv"
		}"
		end

	cblas_ctbsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctbsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctbsv"
		}"
		end

	cblas_ctpmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctpmv"
		}"
		end

	cblas_ctpsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctpsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctpsv"
		}"
		end

	cblas_ctrmm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_ctrmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctrmm"
		}"
		end

	cblas_ctrmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctrmv"
		}"
		end

	cblas_ctrsm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_ctrsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctrsm"
		}"
		end

	cblas_ctrsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ctrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ctrsv"
		}"
		end

	cblas_dasum (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL is
 		-- cblas_dasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dasum"
		}"
		end

	cblas_daxpy (a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_daxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_daxpy"
		}"
		end

	cblas_dcopy (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dcopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dcopy"
		}"
		end

	cblas_ddot (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER): REAL is
 		-- cblas_ddot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ddot"
		}"
		end

	cblas_dgbmv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; a_kl: INTEGER; a_ku: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dgbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dgbmv"
		}"
		end

	cblas_dgemm (an_order: INTEGER; a_trans_a: INTEGER; a_trans_b: INTEGER; a_m: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_dgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dgemm"
		}"
		end

	cblas_dgemv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dgemv"
		}"
		end

	cblas_dger (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_dger
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dger"
		}"
		end

	cblas_dnrm2 (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL is
 		-- cblas_dnrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dnrm2"
		}"
		end

	cblas_drot (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_c: REAL; a_s: REAL) is
 		-- cblas_drot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_drot"
		}"
		end

	cblas_drotg (an_a: POINTER; a_b: POINTER; a_c: POINTER; a_s: POINTER) is
 		-- cblas_drotg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_drotg"
		}"
		end

	cblas_drotm (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_p: POINTER) is
 		-- cblas_drotm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_drotm"
		}"
		end

	cblas_drotmg (a_d1: POINTER; a_d2: POINTER; a_b1: POINTER; a_b2: REAL; a_p: POINTER) is
 		-- cblas_drotmg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_drotmg"
		}"
		end

	cblas_dsbmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dsbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsbmv"
		}"
		end

	cblas_dscal (a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dscal"
		}"
		end

	cblas_dsdot (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER): REAL is
 		-- cblas_dsdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsdot"
		}"
		end

	cblas_dspmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dspmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dspmv"
		}"
		end

	cblas_dspr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; an_ap: POINTER) is
 		-- cblas_dspr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dspr"
		}"
		end

	cblas_dspr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER) is
 		-- cblas_dspr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dspr2"
		}"
		end

	cblas_dswap (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dswap"
		}"
		end

	cblas_dsymm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_dsymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsymm"
		}"
		end

	cblas_dsymv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_dsymv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsymv"
		}"
		end

	cblas_dsyr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_dsyr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsyr"
		}"
		end

	cblas_dsyr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_dsyr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsyr2"
		}"
		end

	cblas_dsyr2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_dsyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsyr2k"
		}"
		end

	cblas_dsyrk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_dsyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dsyrk"
		}"
		end

	cblas_dtbmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtbmv"
		}"
		end

	cblas_dtbsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtbsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtbsv"
		}"
		end

	cblas_dtpmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtpmv"
		}"
		end

	cblas_dtpsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtpsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtpsv"
		}"
		end

	cblas_dtrmm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_dtrmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtrmm"
		}"
		end

	cblas_dtrmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtrmv"
		}"
		end

	cblas_dtrsm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_dtrsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtrsm"
		}"
		end

	cblas_dtrsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_dtrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dtrsv"
		}"
		end

	cblas_dzasum (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL is
 		-- cblas_dzasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dzasum"
		}"
		end

	cblas_dznrm2 (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL is
 		-- cblas_dznrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_dznrm2"
		}"
		end

	cblas_icamax (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): like size_t is
 		-- cblas_icamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_icamax"
		}"
		end

	cblas_idamax (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): like size_t is
 		-- cblas_idamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_idamax"
		}"
		end

	cblas_isamax (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): like size_t is
 		-- cblas_isamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_isamax"
		}"
		end

	cblas_izamax (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): like size_t is
 		-- cblas_izamax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_izamax"
		}"
		end

	cblas_sasum (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL_32 is
 		-- cblas_sasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sasum"
		}"
		end

	cblas_saxpy (a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_saxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_saxpy"
		}"
		end

	cblas_scasum (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL_32 is
 		-- cblas_scasum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_scasum"
		}"
		end

	cblas_scnrm2 (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL_32 is
 		-- cblas_scnrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_scnrm2"
		}"
		end

	cblas_scopy (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_scopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_scopy"
		}"
		end

	cblas_sdot (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER): REAL_32 is
 		-- cblas_sdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sdot"
		}"
		end

	cblas_sdsdot (a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER): REAL_32 is
 		-- cblas_sdsdot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sdsdot"
		}"
		end

	cblas_sgbmv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; a_kl: INTEGER; a_ku: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL_32; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_sgbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sgbmv"
		}"
		end

	cblas_sgemm (an_order: INTEGER; a_trans_a: INTEGER; a_trans_b: INTEGER; a_m: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_sgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sgemm"
		}"
		end

	cblas_sgemv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL_32; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_sgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sgemv"
		}"
		end

	cblas_sger (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_sger
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sger"
		}"
		end

	cblas_snrm2 (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER): REAL_32 is
 		-- cblas_snrm2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_snrm2"
		}"
		end

	cblas_srot (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_c: REAL_32; a_s: REAL_32) is
 		-- cblas_srot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_srot"
		}"
		end

	cblas_srotg (an_a: POINTER; a_b: POINTER; a_c: POINTER; a_s: POINTER) is
 		-- cblas_srotg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_srotg"
		}"
		end

	cblas_srotm (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_p: POINTER) is
 		-- cblas_srotm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_srotm"
		}"
		end

	cblas_srotmg (a_d1: POINTER; a_d2: POINTER; a_b1: POINTER; a_b2: REAL_32; a_p: POINTER) is
 		-- cblas_srotmg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_srotmg"
		}"
		end

	cblas_ssbmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL_32; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_ssbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssbmv"
		}"
		end

	cblas_sscal (a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_sscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sscal"
		}"
		end

	cblas_sspmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL_32; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_sspmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sspmv"
		}"
		end

	cblas_sspr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; an_ap: POINTER) is
 		-- cblas_sspr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sspr"
		}"
		end

	cblas_sspr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER) is
 		-- cblas_sspr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sspr2"
		}"
		end

	cblas_sswap (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_sswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_sswap"
		}"
		end

	cblas_ssymm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_ssymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssymm"
		}"
		end

	cblas_ssymv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: REAL_32; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_ssymv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssymv"
		}"
		end

	cblas_ssyr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_ssyr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssyr"
		}"
		end

	cblas_ssyr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL_32; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_ssyr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssyr2"
		}"
		end

	cblas_ssyr2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_ssyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssyr2k"
		}"
		end

	cblas_ssyrk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_beta: REAL_32; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_ssyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ssyrk"
		}"
		end

	cblas_stbmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_stbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_stbmv"
		}"
		end

	cblas_stbsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_stbsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_stbsv"
		}"
		end

	cblas_stpmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_stpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_stpmv"
		}"
		end

	cblas_stpsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_stpsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_stpsv"
		}"
		end

	cblas_strmm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_strmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_strmm"
		}"
		end

	cblas_strmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_strmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_strmv"
		}"
		end

	cblas_strsm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: REAL_32; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_strsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_strsm"
		}"
		end

	cblas_strsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_strsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_strsv"
		}"
		end

	cblas_xerbla (a_p: INTEGER; a_rout: POINTER; a_form: POINTER) is
 		-- cblas_xerbla (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_xerbla"
		}"
		end

	cblas_zaxpy (a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zaxpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zaxpy"
		}"
		end

	cblas_zcopy (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zcopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zcopy"
		}"
		end

	cblas_zdotc_sub (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_dotc: POINTER) is
 		-- cblas_zdotc_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zdotc_sub"
		}"
		end

	cblas_zdotu_sub (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; a_dotu: POINTER) is
 		-- cblas_zdotu_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zdotu_sub"
		}"
		end

	cblas_zdscal (a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_zdscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zdscal"
		}"
		end

	cblas_zgbmv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; a_kl: INTEGER; a_ku: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zgbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zgbmv"
		}"
		end

	cblas_zgemm (an_order: INTEGER; a_trans_a: INTEGER; a_trans_b: INTEGER; a_m: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zgemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zgemm"
		}"
		end

	cblas_zgemv (an_order: INTEGER; a_trans_a: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zgemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zgemv"
		}"
		end

	cblas_zgerc (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_zgerc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zgerc"
		}"
		end

	cblas_zgeru (an_order: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_zgeru
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zgeru"
		}"
		end

	cblas_zhbmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zhbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhbmv"
		}"
		end

	cblas_zhemm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zhemm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhemm"
		}"
		end

	cblas_zhemv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zhemv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhemv"
		}"
		end

	cblas_zher (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_zher
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zher"
		}"
		end

	cblas_zher2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_a: POINTER; a_lda: INTEGER) is
 		-- cblas_zher2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zher2"
		}"
		end

	cblas_zher2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zher2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zher2k"
		}"
		end

	cblas_zherk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: REAL; an_a: POINTER; a_lda: INTEGER; a_beta: REAL; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zherk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zherk"
		}"
		end

	cblas_zhpmv (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_beta: POINTER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zhpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhpmv"
		}"
		end

	cblas_zhpr (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: REAL; a_x: POINTER; an_inc_x: INTEGER; an_a: POINTER) is
 		-- cblas_zhpr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhpr"
		}"
		end

	cblas_zhpr2 (an_order: INTEGER; an_uplo: INTEGER; a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER; an_ap: POINTER) is
 		-- cblas_zhpr2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zhpr2"
		}"
		end

	cblas_zscal (a_n: INTEGER; an_alpha: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_zscal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zscal"
		}"
		end

	cblas_zswap (a_n: INTEGER; a_x: POINTER; an_inc_x: INTEGER; a_y: POINTER; an_inc_y: INTEGER) is
 		-- cblas_zswap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zswap"
		}"
		end

	cblas_zsymm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zsymm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zsymm"
		}"
		end

	cblas_zsyr2k (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zsyr2k
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zsyr2k"
		}"
		end

	cblas_zsyrk (an_order: INTEGER; an_uplo: INTEGER; a_trans: INTEGER; a_n: INTEGER; a_k: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_beta: POINTER; a_c: POINTER; a_ldc: INTEGER) is
 		-- cblas_zsyrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_zsyrk"
		}"
		end

	cblas_ztbmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztbmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztbmv"
		}"
		end

	cblas_ztbsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; a_k: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztbsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztbsv"
		}"
		end

	cblas_ztpmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztpmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztpmv"
		}"
		end

	cblas_ztpsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_ap: POINTER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztpsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztpsv"
		}"
		end

	cblas_ztrmm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_ztrmm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztrmm"
		}"
		end

	cblas_ztrmv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztrmv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztrmv"
		}"
		end

	cblas_ztrsm (an_order: INTEGER; a_side: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_m: INTEGER; a_n: INTEGER; an_alpha: POINTER; an_a: POINTER; a_lda: INTEGER; a_b: POINTER; a_ldb: INTEGER) is
 		-- cblas_ztrsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztrsm"
		}"
		end

	cblas_ztrsv (an_order: INTEGER; an_uplo: INTEGER; a_trans_a: INTEGER; a_diag: INTEGER; a_n: INTEGER; an_a: POINTER; a_lda: INTEGER; a_x: POINTER; an_inc_x: INTEGER) is
 		-- cblas_ztrsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cblas_ztrsv"
		}"
		end


end -- class GSL_CBLAS_EXTERNALS
