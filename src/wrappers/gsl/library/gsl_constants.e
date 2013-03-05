indexing
	description: "mathematical constants - only real_64 versions exist, to use it as real_32 just append a .force_to_real_32"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_CONSTANTS

feature {}
	const_e: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_E"
      }"	
      end

	const_log2e: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_LOG2E"
      }"	
      end

	const_log10e: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_LOG10E"
      }"	
      end

	const_sqrt2: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_SQRT2"
      }"	
      end

	const_sqrt1_2: REAL_64 is
			-- sqrt(1/2)
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_SQRT1_2"
      }"	
      end

	const_sqrt3: REAL_64 is
			-- sqrt(3)
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_SQRT3"
      }"	
      end

	const_pi: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_PI"
      }"	
      end

	const_pi_2: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_PI_2"
      }"	
      end

	const_pi_4: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_PI_4"
      }"	
      end

	const_sqrtpi: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_SQRTPI"
      }"	
      end

	const_2_sqrtpi: REAL_64 is
			-- 2/sqrt(pi)
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_2_SQRTPI"
      }"	
      end

	const_1_pi: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_1_PI"
      }"	
      end

	const_2_pi: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_2_PI"
      }"	
      end

	const_ln10: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_LN10"
      }"	
      end

	const_ln2: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_LN2"
      }"	
      end

	const_lnpi: REAL_64 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_LNPI"
      }"	
      end

	const_euler: REAL_64 is
			-- euler constant
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "M_EULER"
      }"	
      end
	
end
