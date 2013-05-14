-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_ULONG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_ulong_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_absdev"
		}"
		end

	gsl_stats_ulong_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_absdev_m"
		}"
		end

	gsl_stats_ulong_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_correlation"
		}"
		end

	gsl_stats_ulong_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_covariance"
		}"
		end

	gsl_stats_ulong_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_ulong_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_covariance_m"
		}"
		end

	gsl_stats_ulong_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_kurtosis"
		}"
		end

	gsl_stats_ulong_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_ulong_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_kurtosis_m_sd"
		}"
		end

	gsl_stats_ulong_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_lag1_autocorrelation"
		}"
		end

	gsl_stats_ulong_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_ulong_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like long_unsigned is
 		-- gsl_stats_ulong_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_max"
		}"
		end

	gsl_stats_ulong_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_ulong_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_max_index"
		}"
		end

	gsl_stats_ulong_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_mean"
		}"
		end

	gsl_stats_ulong_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_median_from_sorted_data"
		}"
		end

	gsl_stats_ulong_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like long_unsigned is
 		-- gsl_stats_ulong_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_min"
		}"
		end

	gsl_stats_ulong_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_ulong_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_min_index"
		}"
		end

	gsl_stats_ulong_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_ulong_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_minmax"
		}"
		end

	gsl_stats_ulong_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_ulong_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_minmax_index"
		}"
		end

	gsl_stats_ulong_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_ulong_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_pvariance"
		}"
		end

	gsl_stats_ulong_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_ulong_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_quantile_from_sorted_data"
		}"
		end

	gsl_stats_ulong_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_sd"
		}"
		end

	gsl_stats_ulong_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_sd_m"
		}"
		end

	gsl_stats_ulong_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_sd_with_fixed_mean"
		}"
		end

	gsl_stats_ulong_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_skew"
		}"
		end

	gsl_stats_ulong_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_ulong_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_skew_m_sd"
		}"
		end

	gsl_stats_ulong_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_tss"
		}"
		end

	gsl_stats_ulong_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_tss_m"
		}"
		end

	gsl_stats_ulong_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_ulong_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_ttest"
		}"
		end

	gsl_stats_ulong_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_ulong_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_variance"
		}"
		end

	gsl_stats_ulong_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_variance_m"
		}"
		end

	gsl_stats_ulong_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_ulong_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ulong_variance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_ULONG_EXTERNALS
