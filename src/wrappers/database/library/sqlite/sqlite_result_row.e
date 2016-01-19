indexing
	description: "A tuple from an SQLite query."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_ROW

inherit 
	RESULT_ROW
		undefine
			fill_tagged_out_memory,
			out_in_tagged_out_memory
		end

	FAST_ARRAY [SQLITE_VALUE]
		undefine
			copy,
			is_equal
		end

insert
	SQLITE3_EXTERNALS
		undefine
			fill_tagged_out_memory,
			out_in_tagged_out_memory
		end

	SQLITE_ERROR_CODES
		undefine
			copy, is_equal,
			fill_tagged_out_memory,
			out_in_tagged_out_memory
		end

	EXCEPTIONS
		undefine
			copy, is_equal,
			fill_tagged_out_memory,
			out_in_tagged_out_memory
		end

create {ANY} make

feature {ANY} -- Type queries
	is_integer (a_column: INTEGER): BOOLEAN is
		do
			Result := ( {REFERENCE[INTEGER]} ?:= item(a_column) )
		end

	is_real (a_column: INTEGER): BOOLEAN is
		do
			Result := ( {REFERENCE[REAL_64]} ?:= item(a_column) )
		end
	
	is_string (a_column: INTEGER): BOOLEAN is
		do
			Result := ( {STRING} ?:= item(a_column) )
		end
	
	is_boolean (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end

feature {ANY} -- Column queries 
	integer_item (a_column: INTEGER): INTEGER is
		local
			ri: REFERENCE[INTEGER]
		do
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item
		end

	real_item (a_column: INTEGER): REAL is
		local
			ri: REFERENCE[REAL]
		do
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item
		end

	string_item (a_column: INTEGER): STRING is
		do
			Result ::= item(a_column)
			-- ensure result_not_void: Result /= Void
		end

	boolean_item (a_column: INTEGER): BOOLEAN is
		local
			ri: REFERENCE[INTEGER]
		do
			debug 
				raise("SQLITE_RESULT_ROW boolean value encountered. SQLite does *NOT* have boolean values!")
			end
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item.to_boolean
		end


-- feature 
-- 	-- const void *sqlite3_column_blob(sqlite3_stmt*, int iCol);
 
-- 		 int sqlite3_column_bytes(sqlite3_stmt*, int iCol);
-- 		 int sqlite3_column_bytes16(sqlite3_stmt*, int iCol);
-- 		 int sqlite3_column_count(sqlite3_stmt*);
-- 		 const char *sqlite3_column_decltype(sqlite3_stmt *, int iCol);
-- 		 const void *sqlite3_column_decltype16(sqlite3_stmt *, int iCol);
-- 		 double sqlite3_column_double(sqlite3_stmt*, int iCol);
-- 		 int sqlite3_column_int(sqlite3_stmt*, int iCol);
-- 		 long long int sqlite3_column_int64(sqlite3_stmt*, int iCol);
-- 		 const char *sqlite3_column_name(sqlite3_stmt*, int iCol);
-- 		 const void *sqlite3_column_name16(sqlite3_stmt*, int iCol);
-- 		 const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol);
-- 		 const void *sqlite3_column_text16(sqlite3_stmt*, int iCol);
-- 		 int sqlite3_column_type(sqlite3_stmt*, int iCol);

-- The sqlite3_column_count() function returns the number of columns in the results set. sqlite3_column_count() can be called at any time after sqlite3_prepare(). sqlite3_data_count() works similarly to sqlite3_column_count() except that it only works following sqlite3_step(). If the previous call to sqlite3_step() returned SQLITE_DONE or an error code, then sqlite3_data_count() will return 0 whereas sqlite3_column_count() will continue to return the number of columns in the result set.

-- Returned data is examined using the other sqlite3_column_***() functions, all of which take a column number as their second parameter. Columns are zero-indexed from left to right. Note that this is different to parameters, which are indexed starting at one.

-- The sqlite3_column_type() function returns the datatype for the value in the Nth column. The return value is one of these:

-- 		 #define SQLITE_INTEGER  1
-- 		 #define SQLITE_FLOAT    2
-- g		 #define SQLITE_TEXT     3
-- 		 #define SQLITE_BLOB     4
-- 		 #define SQLITE_NULL     5

-- The sqlite3_column_decltype() routine returns text which is the declared type of the column in the CREATE TABLE statement. For an expression, the return type is an empty string. sqlite3_column_name() returns the name of the Nth column. sqlite3_column_bytes() returns the number of bytes in a column that has type BLOB or the number of bytes in a TEXT string with UTF-8 encoding. sqlite3_column_bytes16() returns the same value for BLOBs but for TEXT strings returns the number of bytes in a UTF-16 encoding. sqlite3_column_blob() return BLOB data. sqlite3_column_text() return TEXT data as UTF-8. sqlite3_column_text16() return TEXT data as UTF-16. sqlite3_column_int() return INTEGER data in the host machines native integer format. sqlite3_column_int64() returns 64-bit INTEGER data. Finally, sqlite3_column_double() return floating point data.

-- It is not necessary to retrieve data in the format specify by sqlite3_column_type(). If a different format is requested, the data is converted automatically.

-- Data format conversions can invalidate the pointer returned by prior calls to sqlite3_column_blob(), sqlite3_column_text(), and/or sqlite3_column_text16(). Pointers might be invalided in the following cases:

-- 	*

-- 		The initial content is a BLOB and sqlite3_column_text() or sqlite3_column_text16() is called. A zero-terminator might need to be added to the string.
-- 	*

-- 		The initial content is UTF-8 text and sqlite3_column_bytes16() or sqlite3_column_text16() is called. The content must be converted to UTF-16.
-- 	*

-- 		The initial content is UTF-16 text and sqlite3_column_bytes() or sqlite3_column_text() is called. The content must be converted to UTF-8.

-- Note that conversions between UTF-16be and UTF-16le are always done in place and do not invalidate a prior pointer, though of course the content of the buffer that the prior pointer points to will have been modified. Other kinds of conversion are done in place when it is possible, but sometime it is not possible and in those cases prior pointers are invalidated.

-- The safest and easiest to remember policy is this: assume that any result from

-- 	* sqlite3_column_blob(),
-- 	* sqlite3_column_text(), or
-- 	* sqlite3_column_text16()

-- is invalided by subsequent calls to

-- 	* sqlite3_column_bytes(),
-- 	* sqlite3_column_bytes16(),
-- 	* sqlite3_column_text(), or
-- 	* sqlite3_column_text16().

-- This means that you should always call sqlite3_column_bytes() or sqlite3_column_bytes16() before calling sqlite3_column_blob(), sqlite3_column_text(), or sqlite3_column_text16().

end
