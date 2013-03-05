-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_STATISTICS_INT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_stats_int_absdev (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_absdev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_absdev"
		}"
		end

	gsl_stats_int_absdev_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_absdev_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_absdev_m"
		}"
		end

	gsl_stats_int_correlation (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_correlation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_correlation"
		}"
		end

	gsl_stats_int_covariance (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_covariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_covariance"
		}"
		end

	gsl_stats_int_covariance_m (a_data1: POINTER; a_stride1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n: NATURAL_32; a_mean1: REAL_64; a_mean2: REAL_64): REAL_64 is
 		-- gsl_stats_int_covariance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_covariance_m"
		}"
		end

	gsl_stats_int_kurtosis (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_kurtosis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_kurtosis"
		}"
		end

	gsl_stats_int_kurtosis_m_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64; a_sd: REAL_64): REAL_64 is
 		-- gsl_stats_int_kurtosis_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_kurtosis_m_sd"
		}"
		end

	gsl_stats_int_lag1_autocorrelation (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_lag1_autocorrelation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_lag1_autocorrelation"
		}"
		end

	gsl_stats_int_lag1_autocorrelation_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_lag1_autocorrelation_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_lag1_autocorrelation_m"
		}"
		end

	gsl_stats_int_max (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_stats_int_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_max"
		}"
		end

	gsl_stats_int_max_index (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): NATURAL_32 is
 		-- gsl_stats_int_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_max_index"
		}"
		end

	gsl_stats_int_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_mean"
		}"
		end

	gsl_stats_int_median_from_sorted_data (a_sorted_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_median_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_median_from_sorted_data"
		}"
		end

	gsl_stats_int_min (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_stats_int_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_min"
		}"
		end

	gsl_stats_int_min_index (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): NATURAL_32 is
 		-- gsl_stats_int_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_min_index"
		}"
		end

	gsl_stats_int_minmax (a_min: POINTER; a_max: POINTER; a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32) is
 		-- gsl_stats_int_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_minmax"
		}"
		end

	gsl_stats_int_minmax_index (a_min_index: POINTER; a_max_index: POINTER; a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32) is
 		-- gsl_stats_int_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_minmax_index"
		}"
		end

	gsl_stats_int_pvariance (a_data1: POINTER; a_stride1: NATURAL_32; a_n1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n2: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_pvariance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_pvariance"
		}"
		end

	gsl_stats_int_quantile_from_sorted_data (a_sorted_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_f: REAL_64): REAL_64 is
 		-- gsl_stats_int_quantile_from_sorted_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_quantile_from_sorted_data"
		}"
		end

	gsl_stats_int_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_sd"
		}"
		end

	gsl_stats_int_sd_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_sd_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_sd_m"
		}"
		end

	gsl_stats_int_sd_with_fixed_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_sd_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_sd_with_fixed_mean"
		}"
		end

	gsl_stats_int_skew (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_skew
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_skew"
		}"
		end

	gsl_stats_int_skew_m_sd (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64; a_sd: REAL_64): REAL_64 is
 		-- gsl_stats_int_skew_m_sd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_skew_m_sd"
		}"
		end

	gsl_stats_int_tss (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_tss
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_tss"
		}"
		end

	gsl_stats_int_tss_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_tss_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_tss_m"
		}"
		end

	gsl_stats_int_ttest (a_data1: POINTER; a_stride1: NATURAL_32; a_n1: NATURAL_32; a_data2: POINTER; a_stride2: NATURAL_32; a_n2: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_ttest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_ttest"
		}"
		end

	gsl_stats_int_variance (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): REAL_64 is
 		-- gsl_stats_int_variance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_variance"
		}"
		end

	gsl_stats_int_variance_m (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_variance_m
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_variance_m"
		}"
		end

	gsl_stats_int_variance_with_fixed_mean (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_mean: REAL_64): REAL_64 is
 		-- gsl_stats_int_variance_with_fixed_mean
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_stats_int_variance_with_fixed_mean"
		}"
		end


end -- class GSL_STATISTICS_INT_EXTERNALS
