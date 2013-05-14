-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_CHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_stats_char_absdev (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_absdev"
		}"
		end

	gsl_stats_char_absdev_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_absdev_m"
		}"
		end

	gsl_stats_char_correlation (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_correlation"
		}"
		end

	gsl_stats_char_covariance (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_covariance"
		}"
		end

	gsl_stats_char_covariance_m (a_data1: POINTER; a_stride1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n: like size_t; a_mean1: REAL; a_mean2: REAL): REAL is
 		-- gsl_stats_char_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_covariance_m"
		}"
		end

	gsl_stats_char_kurtosis (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_kurtosis"
		}"
		end

	gsl_stats_char_kurtosis_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_char_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_kurtosis_m_sd"
		}"
		end

	gsl_stats_char_lag1_autocorrelation (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_lag1_autocorrelation"
		}"
		end

	gsl_stats_char_lag1_autocorrelation_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_char_max (a_data: POINTER; a_stride: like size_t; a_n: like size_t): CHARACTER is
 		-- gsl_stats_char_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_max"
		}"
		end

	gsl_stats_char_max_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_char_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_max_index"
		}"
		end

	gsl_stats_char_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_mean"
		}"
		end

	gsl_stats_char_median_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_median_from_sorted_data"
		}"
		end

	gsl_stats_char_min (a_data: POINTER; a_stride: like size_t; a_n: like size_t): CHARACTER is
 		-- gsl_stats_char_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_min"
		}"
		end

	gsl_stats_char_min_index (a_data: POINTER; a_stride: like size_t; a_n: like size_t): like size_t is
 		-- gsl_stats_char_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_min_index"
		}"
		end

	gsl_stats_char_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_char_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_minmax"
		}"
		end

	gsl_stats_char_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_stats_char_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_minmax_index"
		}"
		end

	gsl_stats_char_pvariance (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_char_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_pvariance"
		}"
		end

	gsl_stats_char_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: like size_t; a_n: like size_t; a_f: REAL): REAL is
 		-- gsl_stats_char_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_quantile_from_sorted_data"
		}"
		end

	gsl_stats_char_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_sd"
		}"
		end

	gsl_stats_char_sd_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_sd_m"
		}"
		end

	gsl_stats_char_sd_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_sd_with_fixed_mean"
		}"
		end

	gsl_stats_char_skew (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_skew"
		}"
		end

	gsl_stats_char_skew_m_sd (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL; a_sd: REAL): REAL is
 		-- gsl_stats_char_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_skew_m_sd"
		}"
		end

	gsl_stats_char_tss (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_tss"
		}"
		end

	gsl_stats_char_tss_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_tss_m"
		}"
		end

	gsl_stats_char_ttest (a_data1: POINTER; a_stride1: like size_t; a_n1: like size_t; a_data2: POINTER; a_stride2: like size_t; a_n2: like size_t): REAL is
 		-- gsl_stats_char_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_ttest"
		}"
		end

	gsl_stats_char_variance (a_data: POINTER; a_stride: like size_t; a_n: like size_t): REAL is
 		-- gsl_stats_char_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_variance"
		}"
		end

	gsl_stats_char_variance_m (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_variance_m"
		}"
		end

	gsl_stats_char_variance_with_fixed_mean (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_mean: REAL): REAL is
 		-- gsl_stats_char_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_char_variance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_CHAR_EXTERNALS
