indexing
	description: "SQLite3 relational database."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_DATABASE
inherit
	DATABASE 
	C_STRUCT
insert SQLITE3_EXTERNALS
creation connect

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
			check changed_handle: handle.is_not_null end
			debug
				inspect last_action_result
				when sqlite_ok then
					-- Successful result
					print ("Successful result%N")
				when sqlite_error then
					-- SQL error or missing database
					print ("SQL error or missing database%N")
				when sqlite_internal then
					-- An internal logic error in SQLite
					print ("An internal logic error in SQLite%N")
				when 	sqlite_perm then 
					-- Access permission denied
					print ("Access permission denied%N")
				when sqlite_abort then
					-- Callback routine requested an abort 
					print ("Callback routine requested an abort %N")
				when sqlite_busy then 
					-- The database file is locked 
					print ("The database file is locked %N")
				when sqlite_locked then
					-- A table in the database is locked	
					print ("A table in the database is locked	%N")
				when sqlite_nomem then
					-- A malloc() failed	
					print ("A malloc() failed	%N")
				when sqlite_readonly then
					-- Attempt to write a readonly database	
					print ("Attempt to write a readonly database	%N")
				when sqlite_interrupt then
					-- Operation terminated by sqlite_interrupt()	
					print ("Operation terminated by sqlite_interrupt()	%N")
				when sqlite_ioerr then
					-- Some kind of disk I/O error occurred	
					print ("Some kind of disk I/O error occurred	%N")
				when sqlite_corrupt then
					-- The database disk image is malformed	
					print ("The database disk image is malformed	%N")
				when sqlite_notfound then
					-- (Internal Only) Table or record not found	
					print ("(Internal Only) Table or record not found	%N")
				when sqlite_full then
					-- Insertion failed because database is full	
					print ("Insertion failed because database is full	%N")
				when sqlite_cantopen then
					-- Unable to open the database file	
					print ("Unable to open the database file	%N")
				when sqlite_protocol then
					-- Database lock protocol error	
					print ("Database lock protocol error	%N")
				when sqlite_empty then
					-- (Internal Only) Database table is empty	
					print ("(Internal Only) Database table is empty	%N")
				when sqlite_schema then
					-- The database schema changed	
					print ("The database schema changed	%N")
				when sqlite_toobig then
					-- Too much data for one row of a table	
					print ("Too much data for one row of a table	%N")
				when sqlite_constraint then
					-- Abort due to constraint violation	
					print ("Abort due to constraint violation	%N")
				when sqlite_mismatch then
					-- Data type mismatch	
					print ("Data type mismatch	%N")
				when sqlite_misuse then
					-- Library used incorrectly	
					print ("Library used incorrectly	%N")
				when sqlite_nolfs then
					-- Uses OS features not supported on host	
					print ("Uses OS features not supported on host	%N")
				when sqlite_auth then
					-- Authorization denied	
					print ("Authorization denied	%N")
				when sqlite_row then
					-- sqlite_step() has another row ready	
					print ("sqlite_step() has another row ready	%N")
				end
			end -- of the big fat debug 
		end
	
	close is
			-- Try to close the database.
		
			-- `last_action_result' will be `sqlite_ok' if the close is
			-- successful. If there are prepared statements that have not
			-- been finalized, then it will be `sqlite_busy'.

			-- Note `sqlite_error' will be set if the hidden handle is
			-- not a valid connection pointer returned by sqlite3_open()
			-- or if the connection pointer has been closed previously.
		require connected: is_connected
		do
			last_action_result := sqlite3_close (handle)
		end

	is_connected: BOOLEAN is 
		do
			Result := (last_action_result=sqlite_ok)
		end

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
		end
	
	cursor: CURSOR is
			-- Get a new cursor
		obsolete "to be removed"
		do 
		end

	last_action_result: INTEGER
			-- the result code of the last call to sqlite3_open
feature {} -- Implementation
	accumulator_callback (n_columns: INTEGER; 
								 values: NATIVE_ARRAY[POINTER];
								 column_names: NATIVE_ARRAY[POINTER]): INTEGER is
		require result_set_present: result_set/=Void
		local i: INTEGER; a_tuple: SQLITE_RESULT_ROW; a_value,column_name: STRING; 
		do
			debug print ("SQLITE_DATABASE.accumulator_callback ("+n_columns.out+", [") end
			create a_tuple.make(n_columns)
			from i := 0 until i >= n_columns
			loop
				create a_value.from_external_copy(values.item(i))
				debug print ("'"+a_value+"' ") end
				a_tuple.put (a_value ,i)
				i:=i+1
			end
			result_set.add_last (a_tuple)

			debug 
				print ("], [")
				from i := 0 until i >= n_columns
				loop
					create column_name.from_external_copy(column_names.item(i))
					print ("'"+column_name+"' ") 
					i:=i+1
				end
				print ("])%N")
			end
			
			Result := 0 -- 0 means "ok, go on"; anything else blocks the query with an error
		ensure 
			result_set_grown: old result_set.count < result_set.count
		end
	
end
