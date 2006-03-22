indexing
	description: "Access to gsl_vector struct "
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_VECTOR_STRUCT_64
feature {NONE} -- External calls
	get_size (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector get size use <gsl/gsl_vector.h>"
		end

	get_stride (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector get stride use <gsl/gsl_vector.h>"
		end

	get_data (a_vector: POINTER): POINTER is
		external "C struct gsl_vector get data use <gsl/gsl_vector.h>"
		end
	
	get_block  (a_vector: POINTER): POINTER is
		external "C struct gsl_vector get block use <gsl/gsl_vector.h>"
		end

	get_owner (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector get owner use <gsl/gsl_vector.h>"
		end

end

