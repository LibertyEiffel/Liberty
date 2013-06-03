-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_float_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_absdev"
		}"
		end

	gsl_stats_float_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_absdev_m"
		}"
		end

	gsl_stats_float_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_correlation"
		}"
		end

	gsl_stats_float_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_covariance"
		}"
		end

	gsl_stats_float_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_float_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_covariance_m"
		}"
		end

	gsl_stats_float_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_kurtosis"
		}"
		end

	gsl_stats_float_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_float_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_kurtosis_m_sd"
		}"
		end

	gsl_stats_float_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_lag1_autocorrelation"
		}"
		end

	gsl_stats_float_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_float_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL_32 is
 		-- gsl_stats_float_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_max"
		}"
		end

	gsl_stats_float_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_float_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_max_index"
		}"
		end

	gsl_stats_float_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_mean"
		}"
		end

	gsl_stats_float_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_median_from_sorted_data"
		}"
		end

	gsl_stats_float_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL_32 is
 		-- gsl_stats_float_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_min"
		}"
		end

	gsl_stats_float_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_float_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_min_index"
		}"
		end

	gsl_stats_float_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_float_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_minmax"
		}"
		end

	gsl_stats_float_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_float_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_minmax_index"
		}"
		end

	gsl_stats_float_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_float_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_pvariance"
		}"
		end

	gsl_stats_float_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_float_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_quantile_from_sorted_data"
		}"
		end

	gsl_stats_float_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_sd"
		}"
		end

	gsl_stats_float_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_sd_m"
		}"
		end

	gsl_stats_float_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_sd_with_fixed_mean"
		}"
		end

	gsl_stats_float_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_skew"
		}"
		end

	gsl_stats_float_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_float_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_skew_m_sd"
		}"
		end

	gsl_stats_float_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_tss"
		}"
		end

	gsl_stats_float_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_tss_m"
		}"
		end

	gsl_stats_float_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_float_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_ttest"
		}"
		end

	gsl_stats_float_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_variance"
		}"
		end

	gsl_stats_float_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_variance_m"
		}"
		end

	gsl_stats_float_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_variance_with_fixed_mean"
		}"
		end

	gsl_stats_float_wabsdev (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wabsdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wabsdev"
		}"
		end

	gsl_stats_float_wabsdev_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_float_wabsdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wabsdev_m"
		}"
		end

	gsl_stats_float_wkurtosis (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wkurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wkurtosis"
		}"
		end

	gsl_stats_float_wkurtosis_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_float_wkurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wkurtosis_m_sd"
		}"
		end

	gsl_stats_float_wmean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wmean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wmean"
		}"
		end

	gsl_stats_float_wsd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wsd"
		}"
		end

	gsl_stats_float_wsd_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_float_wsd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wsd_m"
		}"
		end

	gsl_stats_float_wsd_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_wsd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wsd_with_fixed_mean"
		}"
		end

	gsl_stats_float_wskew (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wskew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wskew"
		}"
		end

	gsl_stats_float_wskew_m_sd (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL; a_wsd: REAL): REAL is
 		-- gsl_stats_float_wskew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wskew_m_sd"
		}"
		end

	gsl_stats_float_wtss (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wtss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wtss"
		}"
		end

	gsl_stats_float_wtss_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_float_wtss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wtss_m"
		}"
		end

	gsl_stats_float_wvariance (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_float_wvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wvariance"
		}"
		end

	gsl_stats_float_wvariance_m (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wmean: REAL): REAL is
 		-- gsl_stats_float_wvariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wvariance_m"
		}"
		end

	gsl_stats_float_wvariance_with_fixed_mean (a_w: POINTER; a_wstride: like size_t; a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_float_wvariance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_float_wvariance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_FLOAT_EXTERNALS
