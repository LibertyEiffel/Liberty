-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_MATHIEU_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_mathieu_a (an_order: INTEGER_32; a_qq: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_a
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_a"
		}"
		end

	gsl_sf_mathieu_a_array (an_order_min: INTEGER_32; an_order_max: INTEGER_32; a_qq: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_a_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_a_array"
		}"
		end

	gsl_sf_mathieu_a_coeff (an_order: INTEGER_32; a_qq: REAL_64; an_aa: REAL_64; a_coeff: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_a_coeff
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_a_coeff"
		}"
		end

	gsl_sf_mathieu_alloc (a_nn: NATURAL_32; a_qq: REAL_64): POINTER is
 		-- gsl_sf_mathieu_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_alloc"
		}"
		end

	gsl_sf_mathieu_b (an_order: INTEGER_32; a_qq: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_b
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_b"
		}"
		end

	gsl_sf_mathieu_b_array (an_order_min: INTEGER_32; an_order_max: INTEGER_32; a_qq: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_b_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_b_array"
		}"
		end

	gsl_sf_mathieu_b_coeff (an_order: INTEGER_32; a_qq: REAL_64; an_aa: REAL_64; a_coeff: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_b_coeff
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_b_coeff"
		}"
		end

	gsl_sf_mathieu_ce (an_order: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_ce
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_ce"
		}"
		end

	gsl_sf_mathieu_ce_array (a_nmin: INTEGER_32; a_nmax: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_ce_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_ce_array"
		}"
		end

	gsl_sf_mathieu_free (a_workspace: POINTER) is
 		-- gsl_sf_mathieu_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_free"
		}"
		end

	gsl_sf_mathieu_mc (a_kind: INTEGER_32; an_order: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_Mc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_Mc"
		}"
		end

	gsl_sf_mathieu_mc_array (a_kind: INTEGER_32; a_nmin: INTEGER_32; a_nmax: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_Mc_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_Mc_array"
		}"
		end

	gsl_sf_mathieu_ms (a_kind: INTEGER_32; an_order: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_Ms
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_Ms"
		}"
		end

	gsl_sf_mathieu_ms_array (a_kind: INTEGER_32; a_nmin: INTEGER_32; a_nmax: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_Ms_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_Ms_array"
		}"
		end

	gsl_sf_mathieu_se (an_order: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_se
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_se"
		}"
		end

	gsl_sf_mathieu_se_array (a_nmin: INTEGER_32; a_nmax: INTEGER_32; a_qq: REAL_64; a_zz: REAL_64; a_work: POINTER; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_mathieu_se_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_mathieu_se_array"
		}"
		end


end -- class GSL_SF_MATHIEU_EXTERNALS
