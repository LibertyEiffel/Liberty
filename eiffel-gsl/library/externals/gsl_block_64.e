indexing
	description: "Access to gsl_block struct (block of REAL_64)"
	copyright: "(C) 2006 José Bollo <jose.bollo@laposte.net>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision: "$Revision$"

class GSL_BLOCK_64
inherit
	GSL_BLOCK_GENERAL[REAL_64]
feature {} -- External struct
	gsl_size(ptr: POINTER): INTEGER is
			-- the 'size' field of the block
		external "C struct gsl_block get size use <gsl/gsl_block_double.h>"
		end
	
	gsl_data(ptr: POINTER): POINTER is
			-- the 'data' field of the block
		external "C struct gsl_block get data use <gsl/gsl_block_double.h>"
		end

feature {} -- External calls
	gsl_alloc(a_count: INTEGER): POINTER is
			-- allocate a blocfree the block pointed by 'ptr'
			-- the 'count' field of the block
		external "C use <gsl/gsl_block_double.h>"
		alias "gsl_block_alloc"
		end
	
	gsl_calloc(a_count: INTEGER): POINTER is
			-- allocate a blocfree the block pointed by 'ptr'
			-- the 'count' field of the block
		external "C use <gsl/gsl_block_double.h>"
		alias "gsl_block_calloc"
		end
	
	gsl_free(ptr: POINTER) is
			-- free the block pointed by 'ptr'
		external "C use <gsl/gsl_block_double.h>"
		alias "gsl_block_free"
		end
	
end


