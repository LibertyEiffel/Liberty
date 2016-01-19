deferred class SQLITE_VALUE
	-- A value stored in a SQLite database. 
	
	-- Content can be stored as integers, real numbers, text, binary large
	-- objects ("blob") or be a "null" value. SQLite uses dynamic typing and
	-- allows ito insert a string into a database column of type integer. 

	-- From SQLite FAQ: "This is a feature, not a bug. SQLite uses dynamic
	-- typing. It does not enforce data type constraints. Any data can be
	-- inserted into any column. You can put arbitrary length strings into
	-- integer columns, floating point numbers in boolean columns, or dates in
	-- character columns. The datatype you assign to a column in the CREATE
	-- TABLE command does not restrict what data can be put into that column.
	-- Every column is able to hold an arbitrary length string. (There is one
	-- exception: Columns of type INTEGER PRIMARY KEY may only hold a 64-bit
	-- signed integer. An error will result if you try to put anything other
	-- than an integer into an INTEGER PRIMARY KEY column.)"

	-- "But SQLite does use the declared type of a column as a hint that you
	-- prefer values in that format. So, for example, if a column is of type
	-- INTEGER and you try to insert a string into that column, SQLite will
	-- attempt to convert the string into an integer. If it can, it inserts the
	-- integer instead. If not, it inserts the string. This feature is called
	-- type affinity. "

inherit VARIANT
insert SQLITE_TYPE_CODES

create
	{ANY} from_integer, from_integer_64, from_string
	-- {SQLITE_DATABASE} make

	-- It outght convert INTEGER, INTEGER_64, ABSTRACT_STRING,

feature {ANY}
	from_integer (an_integer: INTEGER) is
		do
			content := an_integer.to_string
			y
		end

	from_integer_64 (an_int_64: INTEGER_64) is
		do
			content := an_int_64.to_string
		end

	from_string (a_string: ABSTRACT_STRING) is
		do
			create content.from_string(a_string)
		end

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) is
			-- Bind Current value as parameter to `an_index' placeholder in `a_statement'.
		require 
			a_statement/=Void
			valid_index: an_index.in_range (1, a_statement.parameter_count)
		local res: INTEGER
		do
			if content.is_integer
				then res := sqlite3_bind_int_64 (a_statement.handle, an_index, content.to_integer)
			elseif content.is_real
				then res := sqlite3_bind_double (a_statement.handle, an_index, content.to_real)
			else -- string is a catch
				a_string ::= a_parameter 
				res_code := sqlite3_bind_text (handle, an_index, content.to_external, 
				content.count, sqlite_transient)
				-- debug 
				-- print ("Warning! Unrecognized type in SQLITE_PREPARED_STATEMENT.%
				-- 			 %bind_parameter ("+a_parameter.out+", "+an_index.out+")%N")
				-- end
			end

		end
		 
feature {ANY}
	as_string: STRING is 
		do
			Result := content.twin
		end
	
feature {} -- Implementation
	content: STRING
	type: INTEGER
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


