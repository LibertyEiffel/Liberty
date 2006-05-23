indexing
	description: "A tuple from an SQLite query."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_ROW
inherit 
	RESULT_ROW undefine fill_tagged_out_memory end
	FAST_ARRAY [STRING] undefine copy, is_equal end
creation make

feature -- Type queries
	is_integer (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end

	is_real (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end
	
	is_string (a_column: INTEGER): BOOLEAN is
		do
			Result := True
		end
	
	is_boolean (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end

feature -- Column queries 
	integer_item (a_column: INTEGER): INTEGER is
		do
			-- empty
		end

	real_item (a_column: INTEGER): REAL is
		do
			-- empty
		end

	string_item (a_column: INTEGER): STRING is
		do
			Result := item(a_column)
		end

	boolean_item (a_column: INTEGER): BOOLEAN is
		do
			-- empty
		end
end
