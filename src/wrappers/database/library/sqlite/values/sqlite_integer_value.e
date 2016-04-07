class SQLITE_INTEGER_VALUE
	-- An integer value stored in a SQLite database. 
	
	-- All integers in SQLIte are 64but values

inherit 
	SQLITE_VALUE
    TYPED_VARIANT[INTEGER_64]
	REFERENCE[INTEGER_64]

create
	{ANY} from_integer, from_integer_64

	-- It outght convert INTEGER, INTEGER_64, ABSTRACT_STRING,

feature {ANY}
	from_integer (an_integer: INTEGER) 
		do
			item := an_integer.to_integer_64
		end

	from_integer_64 (an_int_64: INTEGER_64) 
		do
			item := an_int_64
		end

feature 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) 
			-- Bind Current value as parameter to `an_index' placeholder in `a_statement'.
        local res: INTEGER
		do
			res := sqlite3_bind_int64 (a_statement.handle, an_index, item)
		end
		 
	as_string: STRING 
		do
			Result := item.to_string
		end

	type: INTEGER
		do
			Result := sqlite_integer
		end
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


