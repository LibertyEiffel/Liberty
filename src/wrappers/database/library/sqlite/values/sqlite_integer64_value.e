class SQLITE_INTEGER64_VALUE
	-- An integer value stored in a SQLite database. 
	
    -- All integers in SQLIte are 64 bit values; this 32-bit version is 

inherit 
	SQLITE_VALUE  undefine out end
    TYPED_VARIANT[INTEGER_64]

create {ANY} set_item, from_integer

	-- It outght convert INTEGER, INTEGER_64, ABSTRACT_STRING,

feature {ANY}
	from_integer (an_integer: INTEGER) 
		do
			item := an_integer.to_integer_64
		end

feature {ANY}
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

-- Copyright: "(C) 2014,2016 Paolo Redaelli "
-- License: "LGPL v2 or later"


