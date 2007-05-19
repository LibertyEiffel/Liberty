indexing
	description: "SQLite3 relational database."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_DATABASE

inherit
	DATABASE
		undefine
			copy,
			is_equal
		end

	C_STRUCT
		redefine
			dispose
		end

insert
	SQLITE3_EXTERNALS
		undefine
			copy,
			is_equal
		end

	SQLITE_ERROR_CODES
		undefine
			copy,
			is_equal
		end
	
creation connect

feature
	dispose is
		local
			res: INTEGER
		do
			res := sqlite3_close (handle)
			handle := default_pointer
			--TODO: handle res
		end
	
feature 
	result_set: SQLITE_RESULT_SET

feature
	connect (a_connection_string: STRING) is
			-- Try to connect to an SQLite database. `last_action_result'
			-- will hols the result of this feature call. is_connected
			-- will be true if database is usable; i.e. readable and
			-- writable.
		do
			last_action_result := sqlite3_open (a_connection_string.to_external,
															$handle)
			last_action_success := last_action_result = Sqlite_ok
			is_connected := last_action_success
		end
	
	close is
			-- Try to close the database.
		
			-- `last_action_result' will be `sqlite_ok' if the close is
			-- successful. If there are prepared statements that have not
			-- been finalized, then it will be `sqlite_busy'.

			-- Note `sqlite_error' will be set if the hidden handle is
			-- not a valid connection pointer returned by sqlite3_open()
			-- or if the connection pointer has been closed previously.
		require
			connected: is_connected
		do
			last_action_result := sqlite3_close (handle)
			last_action_success := last_action_result = Sqlite_ok
			is_connected := False
		end

	is_connected: BOOLEAN

	execute (some_sql: STRING) is
			-- Current implementation uses the plain sqlite3_exec which 
			-- always strings as result. TODO: improve it using prepared 
			-- statement which allows typed results.
		do
			create result_set.make
			last_action_result := sqlite3_exec (handle,
															some_sql.to_external,
															$accumulator_callback,
															Current.to_pointer, 
															default_pointer -- as char **error_msg, since it is currently not used
														  )
			last_action_success := last_action_result = Sqlite_ok
		end
	
	last_action_result: INTEGER
			-- the result code of the last call to sqlite3_-functions
	
feature -- Prepared queries and commands
	prepare_command (some_sql: STRING): SQLITE_PREPARED_COMMAND is
		do
			create Result.make (Current, some_sql)
		end

	prepare_query (some_sql: STRING): SQLITE_PREPARED_QUERY is
		do
			create Result.make (Current, some_sql)
		end

feature {} -- Implementation
	accumulator_callback (n_columns: INTEGER; 
								 values: NATIVE_ARRAY[POINTER];
								 column_names: NATIVE_ARRAY[POINTER]): INTEGER is
		require
			result_set_present: result_set /= Void
		local
			i: INTEGER
			a_tuple: SQLITE_RESULT_ROW
			a_value,column_name: STRING
		do
			debug print ("SQLITE_DATABASE.accumulator_callback ("+n_columns.out+", [") end
			create a_tuple.make(n_columns)
			from
				i := 0
			until
				i >= n_columns
			loop
				create a_value.from_external_copy(values.item(i))
				debug print ("'" + a_value + "' ") end
				a_tuple.put (a_value, i)
				i := i + 1
			end
			result_set.add_last (a_tuple)

			debug 
				print ("], [")
				from i := 0 until i >= n_columns
				loop
					create column_name.from_external_copy(column_names.item(i))
					print ("'"+column_name+"' ") 
					i := i + 1
				end
				print ("])%N")
			end
			
			Result := 0 -- 0 means "ok, go on"; anything else blocks the query with an error
		ensure 
			result_set_grown: old result_set.count < result_set.count
		end

invariant
	success: last_action_success implies last_action_result = Sqlite_ok
end
