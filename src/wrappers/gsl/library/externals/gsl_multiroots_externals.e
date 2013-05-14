-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIROOTS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_multiroot_fdfsolver_alloc (a_t: POINTER; a_n: like size_t): POINTER is
 		-- gsl_multiroot_fdfsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_alloc"
		}"
		end

	gsl_multiroot_fdfsolver_dx (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fdfsolver_dx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_dx"
		}"
		end

	gsl_multiroot_fdfsolver_f (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fdfsolver_f
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_f"
		}"
		end

	gsl_multiroot_fdfsolver_free (a_s: POINTER) is
 		-- gsl_multiroot_fdfsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_free"
		}"
		end

	gsl_multiroot_fdfsolver_gnewton: POINTER is
 		-- gsl_multiroot_fdfsolver_gnewton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_gnewton"
		}"
		end

	address_of_gsl_multiroot_fdfsolver_gnewton: POINTER is
 		-- Address of gsl_multiroot_fdfsolver_gnewton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fdfsolver_gnewton"
		}"
		end

	set_gsl_multiroot_fdfsolver_gnewton (a_value: POINTER) is
		-- Set variable gsl_multiroot_fdfsolver_gnewton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fdfsolver_gnewton"
		}"
		end

	gsl_multiroot_fdfsolver_hybridj: POINTER is
 		-- gsl_multiroot_fdfsolver_hybridj
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_hybridj"
		}"
		end

	address_of_gsl_multiroot_fdfsolver_hybridj: POINTER is
 		-- Address of gsl_multiroot_fdfsolver_hybridj
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fdfsolver_hybridj"
		}"
		end

	set_gsl_multiroot_fdfsolver_hybridj (a_value: POINTER) is
		-- Set variable gsl_multiroot_fdfsolver_hybridj value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fdfsolver_hybridj"
		}"
		end

	gsl_multiroot_fdfsolver_hybridsj: POINTER is
 		-- gsl_multiroot_fdfsolver_hybridsj
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_hybridsj"
		}"
		end

	address_of_gsl_multiroot_fdfsolver_hybridsj: POINTER is
 		-- Address of gsl_multiroot_fdfsolver_hybridsj
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fdfsolver_hybridsj"
		}"
		end

	set_gsl_multiroot_fdfsolver_hybridsj (a_value: POINTER) is
		-- Set variable gsl_multiroot_fdfsolver_hybridsj value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fdfsolver_hybridsj"
		}"
		end

	gsl_multiroot_fdfsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multiroot_fdfsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_iterate"
		}"
		end

	gsl_multiroot_fdfsolver_name (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fdfsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_name"
		}"
		end

	gsl_multiroot_fdfsolver_newton: POINTER is
 		-- gsl_multiroot_fdfsolver_newton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_newton"
		}"
		end

	address_of_gsl_multiroot_fdfsolver_newton: POINTER is
 		-- Address of gsl_multiroot_fdfsolver_newton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fdfsolver_newton"
		}"
		end

	set_gsl_multiroot_fdfsolver_newton (a_value: POINTER) is
		-- Set variable gsl_multiroot_fdfsolver_newton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fdfsolver_newton"
		}"
		end

	gsl_multiroot_fdfsolver_root (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fdfsolver_root
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_root"
		}"
		end

	gsl_multiroot_fdfsolver_set (a_s: POINTER; a_fdf: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_multiroot_fdfsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdfsolver_set"
		}"
		end

	gsl_multiroot_fdjacobian (a_f: POINTER; a_x: POINTER; a_f: POINTER; an_epsrel: REAL; a_jacobian: POINTER): INTEGER is
 		-- gsl_multiroot_fdjacobian
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fdjacobian"
		}"
		end

	gsl_multiroot_fsolver_alloc (a_t: POINTER; a_n: like size_t): POINTER is
 		-- gsl_multiroot_fsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_alloc"
		}"
		end

	gsl_multiroot_fsolver_broyden: POINTER is
 		-- gsl_multiroot_fsolver_broyden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_broyden"
		}"
		end

	address_of_gsl_multiroot_fsolver_broyden: POINTER is
 		-- Address of gsl_multiroot_fsolver_broyden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fsolver_broyden"
		}"
		end

	set_gsl_multiroot_fsolver_broyden (a_value: POINTER) is
		-- Set variable gsl_multiroot_fsolver_broyden value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fsolver_broyden"
		}"
		end

	gsl_multiroot_fsolver_dnewton: POINTER is
 		-- gsl_multiroot_fsolver_dnewton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_dnewton"
		}"
		end

	address_of_gsl_multiroot_fsolver_dnewton: POINTER is
 		-- Address of gsl_multiroot_fsolver_dnewton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fsolver_dnewton"
		}"
		end

	set_gsl_multiroot_fsolver_dnewton (a_value: POINTER) is
		-- Set variable gsl_multiroot_fsolver_dnewton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fsolver_dnewton"
		}"
		end

	gsl_multiroot_fsolver_dx (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fsolver_dx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_dx"
		}"
		end

	gsl_multiroot_fsolver_f (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fsolver_f
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_f"
		}"
		end

	gsl_multiroot_fsolver_free (a_s: POINTER) is
 		-- gsl_multiroot_fsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_free"
		}"
		end

	gsl_multiroot_fsolver_hybrid: POINTER is
 		-- gsl_multiroot_fsolver_hybrid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_hybrid"
		}"
		end

	address_of_gsl_multiroot_fsolver_hybrid: POINTER is
 		-- Address of gsl_multiroot_fsolver_hybrid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fsolver_hybrid"
		}"
		end

	set_gsl_multiroot_fsolver_hybrid (a_value: POINTER) is
		-- Set variable gsl_multiroot_fsolver_hybrid value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fsolver_hybrid"
		}"
		end

	gsl_multiroot_fsolver_hybrids: POINTER is
 		-- gsl_multiroot_fsolver_hybrids
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_hybrids"
		}"
		end

	address_of_gsl_multiroot_fsolver_hybrids: POINTER is
 		-- Address of gsl_multiroot_fsolver_hybrids
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multiroot_fsolver_hybrids"
		}"
		end

	set_gsl_multiroot_fsolver_hybrids (a_value: POINTER) is
		-- Set variable gsl_multiroot_fsolver_hybrids value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multiroot_fsolver_hybrids"
		}"
		end

	gsl_multiroot_fsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multiroot_fsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_iterate"
		}"
		end

	gsl_multiroot_fsolver_name (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_name"
		}"
		end

	gsl_multiroot_fsolver_root (a_s: POINTER): POINTER is
 		-- gsl_multiroot_fsolver_root
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_root"
		}"
		end

	gsl_multiroot_fsolver_set (a_s: POINTER; a_f: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_multiroot_fsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_set"
		}"
		end

	gsl_multiroot_test_delta (a_dx: POINTER; a_x: POINTER; an_epsabs: REAL; an_epsrel: REAL): INTEGER is
 		-- gsl_multiroot_test_delta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_test_delta"
		}"
		end

	gsl_multiroot_test_residual (a_f: POINTER; an_epsabs: REAL): INTEGER is
 		-- gsl_multiroot_test_residual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_test_residual"
		}"
		end


end -- class GSL_MULTIROOTS_EXTERNALS
