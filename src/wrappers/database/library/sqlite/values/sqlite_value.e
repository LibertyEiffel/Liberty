note
    copyright: "(C) 2014,2016 Paolo Redaelli <paolo.redaelli@gmail.com>"
    license: "LGPL v2 or later"

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

inherit 
    VARIANT
    WRAPPER_HANDLER

insert 
    SQLITE3_EXTERNALS
    SQLITE_ERROR_CODES
    SQLITE_TYPE_CODES
    SQLITE_CONSTANTS

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER) is
			-- Bind Current value as parameter to `an_index' placeholder in `a_statement'.
		require 
			a_statement/=Void
			valid_index: an_index.in_range (1, a_statement.parameter_count)
			deferred
		end
		 
feature {ANY}
	
    type: INTEGER is
		deferred
		end
end


