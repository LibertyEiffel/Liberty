-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MINMAX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_max (an_a: REAL_64; a_b: REAL_64): REAL_64 is
 		-- gsl_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_max"
		}"
		end

	gsl_min (an_a: REAL_64; a_b: REAL_64): REAL_64 is
 		-- gsl_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min"
		}"
		end


end -- class GSL_MINMAX_EXTERNALS
