indexing
	description: "mathematical functions - directly wrapped from gsl, see gsl reference for details"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_MATH_FUNCTIONS

feature {}

	gsl_log1p(x: REAL_64): REAL_64 is
			-- Result := ln(1 + x), apropriate for small x
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_log1p"
      }"	
      end
	
	gsl_expm1(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_expm1"
      }"	
      end
	
	gsl_hypot(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_hypot"
      }"	
      end
	
	gsl_acosh(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_acosh"
      }"	
      end
	
	gsl_asinh(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_asinh"
      }"	
      end
	
	gsl_atanh(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_atanh"
      }"	
      end
	
	gsl_ldexp(x: REAL_64; e: INTEGER_32): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_ldexp"
      }"	
      end

	gsl_frexp(x: REAL_64): TUPLE[REAL_64, INTEGER_32] is
			-- slpits x into its normalized fraction f and exponent e
			-- such that x = Result.item_1 * 2 ^ Result.item_2 and
			-- 0.5 <= Result.item_1 < 1
		local
			f: REAL_64
			e: INTEGER_32
		do
			f := gsl_frexp_external(x, $e)
			Result := [f, e]
		ensure
			in_range_1: x /= 0 implies 0.5 <= Result.item_1
			in_range_2: Result.item_1 < 1
		end

feature {ANY} -- fast integer powers
	gsl_pow_int(x: REAL_64; n: INTEGER_32): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_int"
      }"	
      end

	gsl_pow_2(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_2"
      }"	
      end

	gsl_pow_3(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_3"
      }"	
      end

	gsl_pow_4(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_4"
      }"	
      end

	gsl_pow_5(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_5"
      }"	
      end

	gsl_pow_6(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_6"
      }"	
      end

	gsl_pow_7(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_7"
      }"	
      end

	gsl_pow_8(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_8"
      }"	
      end

	gsl_pow_9(x: REAL_64): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_pow_9"
      }"	
      end

feature {ANY} -- comparation
	gsl_fcmp(x, y, epsilon: REAL_64): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_fcmp"
      }"	
      end

	
feature {ANY} -- externals
	
	gsl_frexp_external(x: REAL_64; e: POINTER): REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_frexp"
      }"	
      end
	
end
