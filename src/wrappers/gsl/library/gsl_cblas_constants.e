indexing
	description: "general matrix"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_CBLAS_CONSTANTS

feature {}
	cblas_no_trans: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasNoTrans"
         }"
		end
		
	cblas_trans: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasTrans"
         }"
		end
	
	cblas_conj_trans: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasConjTrans"
         }"
		end

	cblas_row_major: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasRowMajor"
         }"
		end

	cblas_col_major: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasColMajor"
         }"
		end

	cblas_upper: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasUpper"
         }"
		end

	cblas_lower: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasLower"
         }"
		end

	cblas_non_unit: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasNonUnit"
         }"
		end

	cblas_unit: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasUnit"
         }"
		end

	cblas_left: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasLeft"
         }"
		end

	cblas_right: INTEGER_32 is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "CblasRight"
         }"
		end

end
	
