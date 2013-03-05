-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BSPLINE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_bspline_alloc (a_k: NATURAL_32; a_nbreak: NATURAL_32): POINTER is
 		-- gsl_bspline_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_alloc"
		}"
		end

	gsl_bspline_breakpoint (an_i: NATURAL_32; a_w: POINTER): REAL_64 is
 		-- gsl_bspline_breakpoint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_breakpoint"
		}"
		end

	gsl_bspline_deriv_alloc (a_k: NATURAL_32): POINTER is
 		-- gsl_bspline_deriv_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_alloc"
		}"
		end

	gsl_bspline_deriv_eval (a_x: REAL_64; a_nderiv: NATURAL_32; a_d_b: POINTER; a_w: POINTER; a_dw: POINTER): INTEGER_32 is
 		-- gsl_bspline_deriv_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_eval"
		}"
		end

	gsl_bspline_deriv_eval_nonzero (a_x: REAL_64; a_nderiv: NATURAL_32; a_d_b: POINTER; an_istart: POINTER; an_iend: POINTER; a_w: POINTER; a_dw: POINTER): INTEGER_32 is
 		-- gsl_bspline_deriv_eval_nonzero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_eval_nonzero"
		}"
		end

	gsl_bspline_deriv_free (a_w: POINTER) is
 		-- gsl_bspline_deriv_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_free"
		}"
		end

	gsl_bspline_eval (a_x: REAL_64; a_b: POINTER; a_w: POINTER): INTEGER_32 is
 		-- gsl_bspline_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_eval"
		}"
		end

	gsl_bspline_eval_nonzero (a_x: REAL_64; a_bk: POINTER; an_istart: POINTER; an_iend: POINTER; a_w: POINTER): INTEGER_32 is
 		-- gsl_bspline_eval_nonzero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_eval_nonzero"
		}"
		end

	gsl_bspline_free (a_w: POINTER) is
 		-- gsl_bspline_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_free"
		}"
		end

	gsl_bspline_greville_abscissa (an_i: NATURAL_32; a_w: POINTER): REAL_64 is
 		-- gsl_bspline_greville_abscissa
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_greville_abscissa"
		}"
		end

	gsl_bspline_knots (a_breakpts: POINTER; a_w: POINTER): INTEGER_32 is
 		-- gsl_bspline_knots
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_knots"
		}"
		end

	gsl_bspline_knots_uniform (an_a: REAL_64; a_b: REAL_64; a_w: POINTER): INTEGER_32 is
 		-- gsl_bspline_knots_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_knots_uniform"
		}"
		end

	gsl_bspline_nbreak (a_w: POINTER): NATURAL_32 is
 		-- gsl_bspline_nbreak
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_nbreak"
		}"
		end

	gsl_bspline_ncoeffs (a_w: POINTER): NATURAL_32 is
 		-- gsl_bspline_ncoeffs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_ncoeffs"
		}"
		end

	gsl_bspline_order (a_w: POINTER): NATURAL_32 is
 		-- gsl_bspline_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_order"
		}"
		end


end -- class GSL_BSPLINE_EXTERNALS
