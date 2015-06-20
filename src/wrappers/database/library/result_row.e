indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class RESULT_ROW

inherit
	TRAVERSABLE [VARIANT] 

feature {ANY} -- Type queries
	-- Note: these queries could be not useful with a proper usage of VARIANT or some of its specialized heirs

	is_integer (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' an INTEGER?
		require
			valid_column: valid_index (a_column)
		deferred
		end

	is_real (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' an REAL?
		require
			valid_column: valid_index (a_column)
		deferred
		end
	
	is_string (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' a STRING?
		require
			valid_column: valid_index (a_column)
		deferred
		end
	
	is_boolean (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' a BOOLEAN
		require
			valid_column: valid_index (a_column)
		deferred
		end

feature {ANY} -- Column queries 
	-- Note: these queries could be not useful with a proper usage of VARIANT or some of its specialized heirs

	integer_item (a_column: INTEGER): INTEGER is
		require
			valid_column: valid_index (a_column)
			is_integer: is_integer (a_column)
		deferred
		end

	real_item (a_column: INTEGER): REAL is
		require
			valid_column: valid_index (a_column)
			is_real: is_real (a_column)
		deferred
		end

	string_item (a_column: INTEGER): STRING is
		require
			valid_column: valid_index (a_column)
			is_integer: is_string (a_column)
		deferred
		end

	boolean_item (a_column: INTEGER): BOOLEAN is
		require
			valid_column: valid_index (a_column)
			is_integer: is_boolean (a_column)
		deferred
		end
end
