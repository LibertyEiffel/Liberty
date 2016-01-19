-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_absdev"
		}"
		end

	gsl_stats_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_absdev_m"
		}"
		end

	gsl_stats_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_correlation"
		}"
		end

	gsl_stats_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_covariance"
		}"
		end

	gsl_stats_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_covariance_m"
		}"
		end

	gsl_stats_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_kurtosis"
		}"
		end

	gsl_stats_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_kurtosis_m_sd"
		}"
		end

	gsl_stats_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_lag1_autocorrelation"
		}"
		end

	gsl_stats_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_max"
		}"
		end

	gsl_stats_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_max_index"
		}"
		end

	gsl_stats_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_mean"
		}"
		end

	gsl_stats_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_median_from_sorted_data"
		}"
		end

	gsl_stats_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_min"
		}"
		end

	gsl_stats_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_min_index"
		}"
		end

	gsl_stats_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_minmax"
		}"
		end

	gsl_stats_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_minmax_index"
		}"
		end

	gsl_stats_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_pvariance"
		}"
		end

	gsl_stats_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_quantile_from_sorted_data"
		}"
		end

	gsl_stats_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_sd"
		}"
		end

	gsl_stats_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_sd_m"
		}"
		end

	gsl_stats_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_sd_with_fixed_mean"
		}"
		end

	gsl_stats_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_skew"
		}"
		end

	gsl_stats_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_skew_m_sd"
		}"
		end

	gsl_stats_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_tss"
		}"
		end

	gsl_stats_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_tss_m"
		}"
		end

	gsl_stats_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_ttest"
		}"
		end

	gsl_stats_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_variance"
		}"
		end

	gsl_stats_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_variance_m"
		}"
		end

	gsl_stats_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_variance_with_fixed_mean"
		}"
		end

	gsl_stats_wabsdev (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wabsdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wabsdev"
		}"
		end

	gsl_stats_wabsdev_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_wabsdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wabsdev_m"
		}"
		end

	gsl_stats_wkurtosis (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wkurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wkurtosis"
		}"
		end

	gsl_stats_wkurtosis_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_wkurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wkurtosis_m_sd"
		}"
		end

	gsl_stats_wmean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wmean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wmean"
		}"
		end

	gsl_stats_wsd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wsd"
		}"
		end

	gsl_stats_wsd_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_wsd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wsd_m"
		}"
		end

	gsl_stats_wsd_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_wsd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wsd_with_fixed_mean"
		}"
		end

	gsl_stats_wskew (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wskew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wskew"
		}"
		end

	gsl_stats_wskew_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_wskew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wskew_m_sd"
		}"
		end

	gsl_stats_wtss (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wtss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wtss"
		}"
		end

	gsl_stats_wtss_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_wtss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wtss_m"
		}"
		end

	gsl_stats_wvariance (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_wvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wvariance"
		}"
		end

	gsl_stats_wvariance_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_wvariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wvariance_m"
		}"
		end

	gsl_stats_wvariance_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_wvariance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_wvariance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_DOUBLE_EXTERNALS
