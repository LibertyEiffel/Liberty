-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_UCHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_uchar_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_absdev"
		}"
		end

	gsl_stats_uchar_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_absdev_m"
		}"
		end

	gsl_stats_uchar_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_correlation"
		}"
		end

	gsl_stats_uchar_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_covariance"
		}"
		end

	gsl_stats_uchar_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_uchar_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_covariance_m"
		}"
		end

	gsl_stats_uchar_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_kurtosis"
		}"
		end

	gsl_stats_uchar_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_uchar_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_kurtosis_m_sd"
		}"
		end

	gsl_stats_uchar_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_lag1_autocorrelation"
		}"
		end

	gsl_stats_uchar_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_uchar_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): CHARACTER is
 		-- gsl_stats_uchar_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_max"
		}"
		end

	gsl_stats_uchar_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_uchar_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_max_index"
		}"
		end

	gsl_stats_uchar_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_mean"
		}"
		end

	gsl_stats_uchar_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_median_from_sorted_data"
		}"
		end

	gsl_stats_uchar_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): CHARACTER is
 		-- gsl_stats_uchar_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_min"
		}"
		end

	gsl_stats_uchar_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_uchar_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_min_index"
		}"
		end

	gsl_stats_uchar_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_uchar_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_minmax"
		}"
		end

	gsl_stats_uchar_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_uchar_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_minmax_index"
		}"
		end

	gsl_stats_uchar_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_uchar_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_pvariance"
		}"
		end

	gsl_stats_uchar_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_uchar_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_quantile_from_sorted_data"
		}"
		end

	gsl_stats_uchar_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_sd"
		}"
		end

	gsl_stats_uchar_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_sd_m"
		}"
		end

	gsl_stats_uchar_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_sd_with_fixed_mean"
		}"
		end

	gsl_stats_uchar_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_skew"
		}"
		end

	gsl_stats_uchar_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_uchar_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_skew_m_sd"
		}"
		end

	gsl_stats_uchar_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_tss"
		}"
		end

	gsl_stats_uchar_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_tss_m"
		}"
		end

	gsl_stats_uchar_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_uchar_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_ttest"
		}"
		end

	gsl_stats_uchar_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_uchar_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_variance"
		}"
		end

	gsl_stats_uchar_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_variance_m"
		}"
		end

	gsl_stats_uchar_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_uchar_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_uchar_variance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_UCHAR_EXTERNALS
