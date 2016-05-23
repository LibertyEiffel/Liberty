class SQLITE_REAL_VALUE
	-- A real number value stored in a SQLite database. 

	-- All reals are 64bit values
	
inherit 
	SQLITE_VALUE undefine out end
	REFERENCE[REAL_64]

create
	{ANY} set_item

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) is
		local res: INTEGER
		do
			res := sqlite3_bind_double (a_statement.handle, an_index, item)
		end
		 
feature {ANY}
	as_string: STRING is 
		do
			Result := item.to_string
		end
	type: INTEGER is
		do
			Result := sqlite_float
		end
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


