-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_LONG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_stats_long_absdev (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_absdev"
		}"
		end

	gsl_stats_long_absdev_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_absdev_m"
		}"
		end

	gsl_stats_long_correlation (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_correlation"
		}"
		end

	gsl_stats_long_covariance (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_covariance"
		}"
		end

	gsl_stats_long_covariance_m (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32; a_mean1: REAL_64; a_mean2: REAL_64): REAL_64 is
 		-- gsl_stats_long_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_covariance_m"
		}"
		end

	gsl_stats_long_kurtosis (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_kurtosis"
		}"
		end

	gsl_stats_long_kurtosis_m_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64; a_sd: REAL_64): REAL_64 is
 		-- gsl_stats_long_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_kurtosis_m_sd"
		}"
		end

	gsl_stats_long_lag1_autocorrelation (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_lag1_autocorrelation"
		}"
		end

	gsl_stats_long_lag1_autocorrelation_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_long_max (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_stats_long_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_max"
		}"
		end

	gsl_stats_long_max_index (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): NATURAL_32 is
 		-- gsl_stats_long_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_max_index"
		}"
		end

	gsl_stats_long_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_mean"
		}"
		end

	gsl_stats_long_median_from_sorted_data (a_sorted_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_median_from_sorted_data"
		}"
		end

	gsl_stats_long_min (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_stats_long_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_min"
		}"
		end

	gsl_stats_long_min_index (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): NATURAL_32 is
 		-- gsl_stats_long_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_min_index"
		}"
		end

	gsl_stats_long_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32) is
 		-- gsl_stats_long_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_minmax"
		}"
		end

	gsl_stats_long_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32) is
 		-- gsl_stats_long_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_minmax_index"
		}"
		end

	gsl_stats_long_pvariance (a_data1: POINTER; a_stride1: NATURAL_32; a_n1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n2: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_pvariance"
		}"
		end

	gsl_stats_long_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_f: REAL_64): REAL_64 is
 		-- gsl_stats_long_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_quantile_from_sorted_data"
		}"
		end

	gsl_stats_long_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_sd"
		}"
		end

	gsl_stats_long_sd_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_sd_m"
		}"
		end

	gsl_stats_long_sd_with_fixed_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_sd_with_fixed_mean"
		}"
		end

	gsl_stats_long_skew (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_skew"
		}"
		end

	gsl_stats_long_skew_m_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64; a_sd: REAL_64): REAL_64 is
 		-- gsl_stats_long_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_skew_m_sd"
		}"
		end

	gsl_stats_long_tss (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_tss"
		}"
		end

	gsl_stats_long_tss_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_tss_m"
		}"
		end

	gsl_stats_long_ttest (a_data1: POINTER; a_stride1: NATURAL_32; a_n1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n2: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_ttest"
		}"
		end

	gsl_stats_long_variance (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_long_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_variance"
		}"
		end

	gsl_stats_long_variance_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_variance_m"
		}"
		end

	gsl_stats_long_variance_with_fixed_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_long_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_long_variance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_LONG_EXTERNALS
