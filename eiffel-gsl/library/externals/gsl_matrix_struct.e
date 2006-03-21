indexing
	description: "Access to gsl_matrix struct "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_MATRIX_STRUCT
feature {NONE} -- External calls
	get_size1 (a_matrix: POINTER): INTEGER is
		external "C struct gsl_matrix get size1 use <gsl/gsl_matrix.h>"
		end

	get_size2 (a_matrix: POINTER): INTEGER is
		external "C struct gsl_matrix get size2 use <gsl/gsl_matrix.h>"
		end

	get_tda (a_matrix: POINTER): INTEGER is
		external "C struct gsl_matrix get  use <gsl/gsl_matrix.h>"
		end

	get_data (a_matrix: POINTER): POINTER is
		external "C struct gsl_matrix get  use <gsl/gsl_matrix.h>"
		end
	
	get_block  (a_matrix: POINTER): POINTER is
		external "C struct gsl_matrix get  use <gsl/gsl_matrix.h>"
		end

	get_owner (a_matrix: POINTER): INTEGER is
		external "C struct gsl_matrix get  use <gsl/gsl_matrix.h>"
		end

end

