-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_POLY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- function gsl_complex_poly_complex_eval (at line 54 in file /usr/include/gsl/gsl_poly.h is not wrappable
	-- function gsl_poly_complex_eval (at line 51 in file /usr/include/gsl/gsl_poly.h is not wrappable
	gsl_poly_complex_solve (an_a: POINTER; a_n: like size_t; a_w: POINTER; a_z: POINTER): INTEGER is
 		-- gsl_poly_complex_solve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_solve"
		}"
		end

	gsl_poly_complex_solve_cubic (an_a: REAL; a_b: REAL; a_c: REAL; a_z0: POINTER; a_z1: POINTER; a_z2: POINTER): INTEGER is
 		-- gsl_poly_complex_solve_cubic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_solve_cubic"
		}"
		end

	gsl_poly_complex_solve_quadratic (an_a: REAL; a_b: REAL; a_c: REAL; a_z0: POINTER; a_z1: POINTER): INTEGER is
 		-- gsl_poly_complex_solve_quadratic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_solve_quadratic"
		}"
		end

	gsl_poly_complex_workspace_alloc (a_n: like size_t): POINTER is
 		-- gsl_poly_complex_workspace_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_alloc"
		}"
		end

	gsl_poly_complex_workspace_free (a_w: POINTER) is
 		-- gsl_poly_complex_workspace_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_free"
		}"
		end

	gsl_poly_dd_eval (a_dd: POINTER; a_xa: POINTER; a_size: like size_t; a_x: REAL): REAL is
 		-- gsl_poly_dd_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_dd_eval"
		}"
		end

	gsl_poly_dd_init (a_dd: POINTER; a_x: POINTER; a_y: POINTER; a_size: like size_t): INTEGER is
 		-- gsl_poly_dd_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_dd_init"
		}"
		end

	gsl_poly_dd_taylor (a_c: POINTER; a_xp: REAL; a_dd: POINTER; a_x: POINTER; a_size: like size_t; a_w: POINTER): INTEGER is
 		-- gsl_poly_dd_taylor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_dd_taylor"
		}"
		end

	gsl_poly_eval (a_c: POINTER; a_len: INTEGER; a_x: REAL): REAL is
 		-- gsl_poly_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_eval"
		}"
		end

	gsl_poly_eval_derivs (a_c: POINTER; a_lenc: like size_t; a_x: REAL; a_res: POINTER; a_lenres: like size_t): INTEGER is
 		-- gsl_poly_eval_derivs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_eval_derivs"
		}"
		end

	gsl_poly_solve_cubic (an_a: REAL; a_b: REAL; a_c: REAL; a_x0: POINTER; a_x1: POINTER; a_x2: POINTER): INTEGER is
 		-- gsl_poly_solve_cubic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_solve_cubic"
		}"
		end

	gsl_poly_solve_quadratic (an_a: REAL; a_b: REAL; a_c: REAL; a_x0: POINTER; a_x1: POINTER): INTEGER is
 		-- gsl_poly_solve_quadratic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_solve_quadratic"
		}"
		end


end -- class GSL_POLY_EXTERNALS
