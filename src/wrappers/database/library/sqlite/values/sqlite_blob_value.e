class SQLITE_BLOB_VALUE
	-- A blob value stored in a SQLite database, accessable as byte array

inherit
   SQLITE_VALUE undefine out end
   TYPED_VARIANT[ARRAY[NATURAL_8]]

create from_byte_array

feature {ANY}
	from_byte_array (an_array: ARRAY[NATURAL_8]) is
		do
         not_yet_implemented
			content := an_array.twin
		end

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) is
			-- Bind Current value as parameter to `an_index' placeholder in `a_statement'.
		do
         not_yet_implemented
		end
		 
feature {ANY}
	type: INTEGER is
		do
			Result := sqlite_blob
		end

   as_string: STRING is
      local
         i: INTEGER
		do
         create Result.make(content.count + 15)
         Result.append(once "SQLITE_BLOB[")
         from
            i := content.lower
         until
            i > content.upper
         loop
            Result.append(content.item(i).to_string)
         end
         Result.append("]")
		end

feature {} -- Implementation
	content: ARRAY[NATURAL_8]

end

-- Copyright: "(C) 2014-2016 Paolo Redaelli, Raphael Mack"
-- License: "LGPL v2 or later"


