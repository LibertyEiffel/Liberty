class SQLITE_INTEGER_VALUE
	-- An integer value stored in a SQLite database. 
	
	-- All integers in SQLIte are 64but values

inherit 
	SQLITE_VALUE
	REFERENCE[INTEGER_64]

create
	{ANY} from_integer, from_integer_64

	-- It outght convert INTEGER, INTEGER_64, ABSTRACT_STRING,

feature {ANY}
	from_integer (an_integer: INTEGER) is
		do
			item := an_integer.to_integer_64
		end

	from_integer_64 (an_int_64: INTEGER_64) is
		do
			item := an_int_64
		end

feature 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) is
			-- Bind Current value as parameter to `an_index' placeholder in `a_statement'.
		do
			res := sqlite3_bind_int_64 (a_statement.handle, an_index, content.to_integer)
		end
		 
	as_string: STRING is 
		do
			Result := item.to_string
		end

	type: INTEGER is
		do
			Result := sqlite_integer
		end
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


