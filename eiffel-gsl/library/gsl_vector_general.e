indexing
	description: "generic gsl vector"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
-- todo: do the copy html doc trick and implemtn everything

deferred class GSL_VECTOR_GENERAL[G_]
	
feature {NONE} -- Creation
	
	make (a_size: INTEGER) is
			-- Creates a vector of size `size'. Vector's elements are uninitialized
		require
			valid_size: a_size > 0
		deferred
		end
	
feature -- Accessing

	item (i: INTEGER): G_ is
			-- the i-th element of Current vector
		require
			is_valid_index (i)
		deferred
		end

	put (an_x: G_; i: INTEGER) is
			-- Sets the value of the i-th element of Current vector to `an_x'.
		require
			is_valid_index (i)
		deferred
		end
	
feature -- VEctor size
	is_valid_index	(i: INTEGER): BOOLEAN is
		do
			Result := (i.in_range(0, size - 1))
		end

	has_same_size (other: like Current): BOOLEAN is
		require valid_other: other /= Void
		do
			Result := (size = other.size)
		end
		
	size: INTEGER is
		deferred
		end
		
feature {}
	cleanup: CLEANUP

	handle: POINTER
end
