class SQLITE_NULL_VALUE
	-- A void, null value stored in a SQLite database. 

inherit SQLITE_VALUE

create
	{ANY} make

feature {ANY}
    make do end -- absolutely nothing

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER)
        local res: INTEGER
		do
			res := sqlite3_bind_null(a_statement.handle, 0)
		end
		 
feature {ANY}
	as_string: STRING
		do
			Result := once "NULL"
		end

	type: INTEGER
	do
		Result := sqlite_null
	end
	
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


