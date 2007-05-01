indexing
	description: "Cursor for database operations."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Cursor Objects represent a database cursor, which is used
			-- to manage the context of a fetch operation.

deferred class CURSOR
-- inherit
	-- TODO: Should be an ITERABLE

feature 

	-- TODO: description: COLLECTION[TUPLE[STRING]] is informations
	-- describing one result column: (name, type_code,
	-- display_size, internal_size, precision, scale,
	-- null_ok).

	rowcount: INTEGER is
			-- the number of rows that `execute' produced (for DQL
			-- statements like 'select') or affected (for DML statements
			-- like 'update' or 'insert').
		deferred 
		end
	
	close is
			-- Close the cursor.
		deferred 
		end

	execute (some_sql: STRING; some_parameters: COLLECTION[ANY]) is
			-- Prepare and execute a database operation (query or
			-- command).  
		deferred
		end


	execute_many(an_operation: STRING; some_parametes: COLLECTION[COLLECTION[ANY]]) is
			-- Prepare a database operation (query or command) and then
			-- execute it against `some_paramaters'.
		deferred
		end

	fetchone: RESULT_ROW is
			-- Fetch the next row of a query result set, returning a
			-- single sequence, or Void when no more data is available.
		deferred
		end

	fetchmany (row_number: INTEGER): TRAVERSABLE[RESULT_ROW] is
			-- Fetch `row_number' rows of a query result.
		deferred
		end

	fetch_all: TRAVERSABLE[RESULT_ROW] is
			-- Fetch all (remaining) rows of a query result.
		deferred
		end
end
