-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_odeiv_control_alloc (a_t: POINTER): POINTER is
 		-- gsl_odeiv_control_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_alloc"
		}"
		end

	gsl_odeiv_control_free (a_c: POINTER) is
 		-- gsl_odeiv_control_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_free"
		}"
		end

	gsl_odeiv_control_hadjust (a_c: POINTER; a_s: POINTER; a_y: POINTER; a_yerr: POINTER; a_dydt: POINTER; a_h: POINTER): INTEGER is
 		-- gsl_odeiv_control_hadjust
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_hadjust"
		}"
		end

	gsl_odeiv_control_init (a_c: POINTER; an_eps_abs: REAL; an_eps_rel: REAL; an_a_y: REAL; an_a_dydt: REAL): INTEGER is
 		-- gsl_odeiv_control_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_init"
		}"
		end

	gsl_odeiv_control_name (a_c: POINTER): POINTER is
 		-- gsl_odeiv_control_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_name"
		}"
		end

	gsl_odeiv_control_scaled_new (an_eps_abs: REAL; an_eps_rel: REAL; an_a_y: REAL; an_a_dydt: REAL; a_scale_abs: POINTER; a_dim: like size_t): POINTER is
 		-- gsl_odeiv_control_scaled_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_scaled_new"
		}"
		end

	gsl_odeiv_control_standard_new (an_eps_abs: REAL; an_eps_rel: REAL; an_a_y: REAL; an_a_dydt: REAL): POINTER is
 		-- gsl_odeiv_control_standard_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_standard_new"
		}"
		end

	gsl_odeiv_control_y_new (an_eps_abs: REAL; an_eps_rel: REAL): POINTER is
 		-- gsl_odeiv_control_y_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_y_new"
		}"
		end

	gsl_odeiv_control_yp_new (an_eps_abs: REAL; an_eps_rel: REAL): POINTER is
 		-- gsl_odeiv_control_yp_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_yp_new"
		}"
		end

	gsl_odeiv_evolve_alloc (a_dim: like size_t): POINTER is
 		-- gsl_odeiv_evolve_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_evolve_alloc"
		}"
		end

	gsl_odeiv_evolve_apply (an_e: POINTER; a_con: POINTER; a_step: POINTER; a_dydt: POINTER; a_t: POINTER; a_t1: REAL; a_h: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_odeiv_evolve_apply
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_evolve_apply"
		}"
		end

	gsl_odeiv_evolve_free (an_e: POINTER) is
 		-- gsl_odeiv_evolve_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_evolve_free"
		}"
		end

	gsl_odeiv_evolve_reset (an_e: POINTER): INTEGER is
 		-- gsl_odeiv_evolve_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_evolve_reset"
		}"
		end

	gsl_odeiv_step_alloc (a_t: POINTER; a_dim: like size_t): POINTER is
 		-- gsl_odeiv_step_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_alloc"
		}"
		end

	gsl_odeiv_step_apply (a_s: POINTER; a_t: REAL; a_h: REAL; a_y: POINTER; a_yerr: POINTER; a_dydt_in: POINTER; a_dydt_out: POINTER; a_dydt: POINTER): INTEGER is
 		-- gsl_odeiv_step_apply
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_apply"
		}"
		end

	gsl_odeiv_step_bsimp: POINTER is
 		-- gsl_odeiv_step_bsimp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_bsimp"
		}"
		end

	address_of_gsl_odeiv_step_bsimp: POINTER is
 		-- Address of gsl_odeiv_step_bsimp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_bsimp"
		}"
		end

	set_gsl_odeiv_step_bsimp (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_bsimp value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_bsimp"
		}"
		end

	gsl_odeiv_step_free (a_s: POINTER) is
 		-- gsl_odeiv_step_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_free"
		}"
		end

	gsl_odeiv_step_gear1: POINTER is
 		-- gsl_odeiv_step_gear1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_gear1"
		}"
		end

	address_of_gsl_odeiv_step_gear1: POINTER is
 		-- Address of gsl_odeiv_step_gear1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_gear1"
		}"
		end

	set_gsl_odeiv_step_gear1 (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_gear1 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_gear1"
		}"
		end

	gsl_odeiv_step_gear2: POINTER is
 		-- gsl_odeiv_step_gear2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_gear2"
		}"
		end

	address_of_gsl_odeiv_step_gear2: POINTER is
 		-- Address of gsl_odeiv_step_gear2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_gear2"
		}"
		end

	set_gsl_odeiv_step_gear2 (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_gear2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_gear2"
		}"
		end

	gsl_odeiv_step_name (a_s: POINTER): POINTER is
 		-- gsl_odeiv_step_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_name"
		}"
		end

	gsl_odeiv_step_order (a_s: POINTER): NATURAL is
 		-- gsl_odeiv_step_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_order"
		}"
		end

	gsl_odeiv_step_reset (a_s: POINTER): INTEGER is
 		-- gsl_odeiv_step_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_reset"
		}"
		end

	gsl_odeiv_step_rk2: POINTER is
 		-- gsl_odeiv_step_rk2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk2"
		}"
		end

	address_of_gsl_odeiv_step_rk2: POINTER is
 		-- Address of gsl_odeiv_step_rk2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk2"
		}"
		end

	set_gsl_odeiv_step_rk2 (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk2"
		}"
		end

	gsl_odeiv_step_rk2imp: POINTER is
 		-- gsl_odeiv_step_rk2imp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk2imp"
		}"
		end

	address_of_gsl_odeiv_step_rk2imp: POINTER is
 		-- Address of gsl_odeiv_step_rk2imp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk2imp"
		}"
		end

	set_gsl_odeiv_step_rk2imp (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk2imp value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk2imp"
		}"
		end

	gsl_odeiv_step_rk2simp: POINTER is
 		-- gsl_odeiv_step_rk2simp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk2simp"
		}"
		end

	address_of_gsl_odeiv_step_rk2simp: POINTER is
 		-- Address of gsl_odeiv_step_rk2simp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk2simp"
		}"
		end

	set_gsl_odeiv_step_rk2simp (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk2simp value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk2simp"
		}"
		end

	gsl_odeiv_step_rk4: POINTER is
 		-- gsl_odeiv_step_rk4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk4"
		}"
		end

	address_of_gsl_odeiv_step_rk4: POINTER is
 		-- Address of gsl_odeiv_step_rk4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk4"
		}"
		end

	set_gsl_odeiv_step_rk4 (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk4 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk4"
		}"
		end

	gsl_odeiv_step_rk4imp: POINTER is
 		-- gsl_odeiv_step_rk4imp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk4imp"
		}"
		end

	address_of_gsl_odeiv_step_rk4imp: POINTER is
 		-- Address of gsl_odeiv_step_rk4imp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk4imp"
		}"
		end

	set_gsl_odeiv_step_rk4imp (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk4imp value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk4imp"
		}"
		end

	gsl_odeiv_step_rk8pd: POINTER is
 		-- gsl_odeiv_step_rk8pd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rk8pd"
		}"
		end

	address_of_gsl_odeiv_step_rk8pd: POINTER is
 		-- Address of gsl_odeiv_step_rk8pd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rk8pd"
		}"
		end

	set_gsl_odeiv_step_rk8pd (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rk8pd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rk8pd"
		}"
		end

	gsl_odeiv_step_rkck: POINTER is
 		-- gsl_odeiv_step_rkck
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rkck"
		}"
		end

	address_of_gsl_odeiv_step_rkck: POINTER is
 		-- Address of gsl_odeiv_step_rkck
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rkck"
		}"
		end

	set_gsl_odeiv_step_rkck (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rkck value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rkck"
		}"
		end

	gsl_odeiv_step_rkf45: POINTER is
 		-- gsl_odeiv_step_rkf45
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_step_rkf45"
		}"
		end

	address_of_gsl_odeiv_step_rkf45: POINTER is
 		-- Address of gsl_odeiv_step_rkf45
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_odeiv_step_rkf45"
		}"
		end

	set_gsl_odeiv_step_rkf45 (a_value: POINTER) is
		-- Set variable gsl_odeiv_step_rkf45 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_odeiv_step_rkf45"
		}"
		end


end -- class GSL_ODEIV_EXTERNALS
