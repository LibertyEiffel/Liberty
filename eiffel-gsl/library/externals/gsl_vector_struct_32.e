indexing
	description: "Access to gsl_vector struct "
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GSL_VECTOR_STRUCT_32
feature {NONE} -- External calls
	get_float_size (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector_float get size use <gsl/gsl_vector.h>"
		end

	get_float_stride (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector_float get stride use <gsl/gsl_vector.h>"
		end

	get_float_data (a_vector: POINTER): POINTER is
		external "C struct gsl_vector_float get data use <gsl/gsl_vector.h>"
		end
	
	get_float_block  (a_vector: POINTER): POINTER is
		external "C struct gsl_vector_float get block use <gsl/gsl_vector.h>"
		end

	get_float_owner (a_vector: POINTER): INTEGER is
		external "C struct gsl_vector_float get owner use <gsl/gsl_vector.h>"
		end

end

