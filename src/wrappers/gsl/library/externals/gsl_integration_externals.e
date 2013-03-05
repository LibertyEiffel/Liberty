-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_integration_cquad (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_ws: POINTER; a_result: POINTER; an_abserr: POINTER; a_nevals: POINTER): INTEGER_32 is
 		-- gsl_integration_cquad
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad"
		}"
		end

	gsl_integration_cquad_workspace_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_integration_cquad_workspace_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_alloc"
		}"
		end

	gsl_integration_cquad_workspace_free (a_w: POINTER) is
 		-- gsl_integration_cquad_workspace_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_free"
		}"
		end

	gsl_integration_glfixed (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_t: POINTER): REAL_64 is
 		-- gsl_integration_glfixed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed"
		}"
		end

	gsl_integration_glfixed_point (an_a: REAL_64; a_b: REAL_64; an_i: NATURAL_32; a_xi: POINTER; a_wi: POINTER; a_t: POINTER): INTEGER_32 is
 		-- gsl_integration_glfixed_point
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_point"
		}"
		end

	gsl_integration_glfixed_table_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_integration_glfixed_table_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_alloc"
		}"
		end

	gsl_integration_glfixed_table_free (a_t: POINTER) is
 		-- gsl_integration_glfixed_table_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_free"
		}"
		end

	gsl_integration_qag (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_key: INTEGER_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qag"
		}"
		end

	gsl_integration_qagi (a_f: POINTER; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qagi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qagi"
		}"
		end

	gsl_integration_qagil (a_f: POINTER; a_b: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qagil
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qagil"
		}"
		end

	gsl_integration_qagiu (a_f: POINTER; an_a: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qagiu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qagiu"
		}"
		end

	gsl_integration_qagp (a_f: POINTER; a_pts: POINTER; a_npts: NATURAL_32; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qagp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qagp"
		}"
		end

	gsl_integration_qags (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qags"
		}"
		end

	gsl_integration_qawc (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_c: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qawc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawc"
		}"
		end

	gsl_integration_qawf (a_f: POINTER; an_a: REAL_64; an_epsabs: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_cycle_workspace: POINTER; a_wf: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qawf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawf"
		}"
		end

	gsl_integration_qawo (a_f: POINTER; an_a: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_wf: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qawo
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo"
		}"
		end

	gsl_integration_qawo_table_alloc (an_omega: REAL_64; a_l: REAL_64; a_sine: INTEGER; a_n: NATURAL_32): POINTER is
 		-- gsl_integration_qawo_table_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_alloc"
		}"
		end

	gsl_integration_qawo_table_free (a_t: POINTER) is
 		-- gsl_integration_qawo_table_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_free"
		}"
		end

	gsl_integration_qawo_table_set (a_t: POINTER; an_omega: REAL_64; a_l: REAL_64; a_sine: INTEGER): INTEGER_32 is
 		-- gsl_integration_qawo_table_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_set"
		}"
		end

	gsl_integration_qawo_table_set_length (a_t: POINTER; a_l: REAL_64): INTEGER_32 is
 		-- gsl_integration_qawo_table_set_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_set_length"
		}"
		end

	gsl_integration_qaws (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_t: POINTER; an_epsabs: REAL_64; an_epsrel: REAL_64; a_limit: NATURAL_32; a_workspace: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER_32 is
 		-- gsl_integration_qaws
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws"
		}"
		end

	gsl_integration_qaws_table_alloc (an_alpha: REAL_64; a_beta: REAL_64; a_mu: INTEGER_32; a_nu: INTEGER_32): POINTER is
 		-- gsl_integration_qaws_table_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_alloc"
		}"
		end

	gsl_integration_qaws_table_free (a_t: POINTER) is
 		-- gsl_integration_qaws_table_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_free"
		}"
		end

	gsl_integration_qaws_table_set (a_t: POINTER; an_alpha: REAL_64; a_beta: REAL_64; a_mu: INTEGER_32; a_nu: INTEGER_32): INTEGER_32 is
 		-- gsl_integration_qaws_table_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_set"
		}"
		end

	gsl_integration_qcheb (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_cheb12: POINTER; a_cheb24: POINTER) is
 		-- gsl_integration_qcheb
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qcheb"
		}"
		end

	gsl_integration_qk (a_n: INTEGER_32; a_xgk: POINTER; a_wg: POINTER; a_wgk: POINTER; a_fv1: POINTER; a_fv2: POINTER; a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk"
		}"
		end

	gsl_integration_qk15 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk15
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk15"
		}"
		end

	gsl_integration_qk21 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk21
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk21"
		}"
		end

	gsl_integration_qk31 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk31
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk31"
		}"
		end

	gsl_integration_qk41 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk41
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk41"
		}"
		end

	gsl_integration_qk51 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk51
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk51"
		}"
		end

	gsl_integration_qk61 (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; a_result: POINTER; an_abserr: POINTER; a_resabs: POINTER; a_resasc: POINTER) is
 		-- gsl_integration_qk61
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qk61"
		}"
		end

	gsl_integration_qng (a_f: POINTER; an_a: REAL_64; a_b: REAL_64; an_epsabs: REAL_64; an_epsrel: REAL_64; a_result: POINTER; an_abserr: POINTER; a_neval: POINTER): INTEGER_32 is
 		-- gsl_integration_qng
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qng"
		}"
		end

	gsl_integration_workspace_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_integration_workspace_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_alloc"
		}"
		end

	gsl_integration_workspace_free (a_w: POINTER) is
 		-- gsl_integration_workspace_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_free"
		}"
		end


end -- class GSL_INTEGRATION_EXTERNALS
