-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_LONG_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_long_double_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_absdev"
		}"
		end

	gsl_stats_long_double_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_absdev_m"
		}"
		end

	gsl_stats_long_double_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_correlation"
		}"
		end

	gsl_stats_long_double_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_covariance"
		}"
		end

	gsl_stats_long_double_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_long_double_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_covariance_m"
		}"
		end

	gsl_stats_long_double_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_kurtosis"
		}"
		end

	gsl_stats_long_double_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_long_double_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_kurtosis_m_sd"
		}"
		end

	gsl_stats_long_double_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_lag1_autocorrelation"
		}"
		end

	gsl_stats_long_double_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_long_double_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL_EXTENDED is
 		-- gsl_stats_long_double_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_max"
		}"
		end

	gsl_stats_long_double_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_long_double_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_max_index"
		}"
		end

	gsl_stats_long_double_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_mean"
		}"
		end

	gsl_stats_long_double_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_median_from_sorted_data"
		}"
		end

	gsl_stats_long_double_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL_EXTENDED is
 		-- gsl_stats_long_double_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_min"
		}"
		end

	gsl_stats_long_double_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_long_double_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_min_index"
		}"
		end

	gsl_stats_long_double_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_long_double_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_minmax"
		}"
		end

	gsl_stats_long_double_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_long_double_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_minmax_index"
		}"
		end

	gsl_stats_long_double_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_long_double_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_pvariance"
		}"
		end

	gsl_stats_long_double_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_long_double_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_quantile_from_sorted_data"
		}"
		end

	gsl_stats_long_double_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_sd"
		}"
		end

	gsl_stats_long_double_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_sd_m"
		}"
		end

	gsl_stats_long_double_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_sd_with_fixed_mean"
		}"
		end

	gsl_stats_long_double_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_skew"
		}"
		end

	gsl_stats_long_double_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_long_double_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_skew_m_sd"
		}"
		end

	gsl_stats_long_double_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_tss"
		}"
		end

	gsl_stats_long_double_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_tss_m"
		}"
		end

	gsl_stats_long_double_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_long_double_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_ttest"
		}"
		end

	gsl_stats_long_double_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_variance"
		}"
		end

	gsl_stats_long_double_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_variance_m"
		}"
		end

	gsl_stats_long_double_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_variance_with_fixed_mean"
		}"
		end

	gsl_stats_long_double_wabsdev (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wabsdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wabsdev"
		}"
		end

	gsl_stats_long_double_wabsdev_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_long_double_wabsdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wabsdev_m"
		}"
		end

	gsl_stats_long_double_wkurtosis (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wkurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wkurtosis"
		}"
		end

	gsl_stats_long_double_wkurtosis_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_long_double_wkurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wkurtosis_m_sd"
		}"
		end

	gsl_stats_long_double_wmean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wmean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wmean"
		}"
		end

	gsl_stats_long_double_wsd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wsd"
		}"
		end

	gsl_stats_long_double_wsd_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_long_double_wsd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wsd_m"
		}"
		end

	gsl_stats_long_double_wsd_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_wsd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wsd_with_fixed_mean"
		}"
		end

	gsl_stats_long_double_wskew (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wskew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wskew"
		}"
		end

	gsl_stats_long_double_wskew_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_long_double_wskew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wskew_m_sd"
		}"
		end

	gsl_stats_long_double_wtss (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wtss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wtss"
		}"
		end

	gsl_stats_long_double_wtss_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_long_double_wtss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wtss_m"
		}"
		end

	gsl_stats_long_double_wvariance (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_long_double_wvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wvariance"
		}"
		end

	gsl_stats_long_double_wvariance_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_long_double_wvariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wvariance_m"
		}"
		end

	gsl_stats_long_double_wvariance_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_long_double_wvariance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_double_wvariance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_LONG_DOUBLE_EXTERNALS
