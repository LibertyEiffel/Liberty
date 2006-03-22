indexing
	description: "generic gsl vector"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
-- todo: do the copy html doc trick and implemtn everything

expanded class GSL_VECTOR_64
inherit
	GSL_VECTOR_GENERAL[REAL_64]
	GSL_VECTOR_EXTERNALS_64
	GSL_VECTOR_STRUCT_64
	
	
feature
	make (a_size: INTEGER) is
			-- Creates a vector of size `size'. Vector's elements are uninitialized
		do
			handle := gsl_vector_alloc (a_size)
			create cleanup.make(agent dispose)
		end
	
feature {} -- Disposing
	dispose is
		local
			null: POINTER
		do
			debug
				print ("GSL_VECTOR_64.dispose()%N")
			end
			gsl_vector_free (handle)
			handle := null
		end
	
feature -- Accessing

	item (i: INTEGER): REAL_64 is
		do
			Result := gsl_vector_get (handle, i)
		end

	put (an_x: REAL_64; i: INTEGER) is
			-- Sets the value of the i-th element of Current vector to `an_x'.
		do
			gsl_vector_set (handle, i, an_x)
		end

	size: INTEGER is
		do
			Result := get_size(handle)
		end
end
