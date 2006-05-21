indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class RESULT_ROW
inherit TRAVERSABLE[ANY]
feature -- Type queries
	is_integer (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' an INTEGER?
		require valid_column: valid_index (a_column)
		deferred
		end

	is_real (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' an REAL?
		require valid_column: valid_index (a_column)
		deferred
		end
	
	is_string (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' a STRING?
		require valid_column: valid_index (a_column)
		deferred
		end
	
	is_boolean (a_column: INTEGER): BOOLEAN is
			-- Is the type in `a_column' a BOOLEAN
		require valid_column: valid_index (a_column)
		deferred
		end

feature -- Column queries 
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
	
-- features provided by traversable to be implemented by concrete implementations

	-- lower: INTEGER_32 is Minimum index. See also upper, valid_index, item.

	-- upper: INTEGER_32 Maximum index. See also lower, valid_index, item.

	-- valid_index (i: INTEGER_32): BOOLEAN True when i is valid (i.e.,
	-- inside actual bounds). See also lower, upper, item.

	-- count: INTEGER_32 Number of available indices. See also is_empty, lower, upper.

	-- is_empty: BOOLEAN   Is collection empty ? See also count.

	-- item (i: INTEGER_32): E_ Item at the corresponding index i. See also lower, upper, valid_index.

	-- first: E_ The very first item. See also last, item.

	-- last: E_ The last item. See also first, item.

	-- get_new_iterator: ITERATOR[E_]
end
