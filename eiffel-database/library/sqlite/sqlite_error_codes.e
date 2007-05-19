indexing
	description: "values of the the sqlite error code"
	copyright: "2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class SQLITE_ERROR_CODES

feature -- Result codes 

	Sqlite_ok: INTEGER is 0
			--  Successful result 

	Sqlite_error: INTEGER is 1
			--  SQL error or missing database 

	Sqlite_internal: INTEGER is 2
			--  An internal logic error in Sqlite 

	Sqlite_perm: INTEGER is 3
			--  Access permission denied 

	Sqlite_abort: INTEGER is 4
			--  Callback routine requested an abort 

	Sqlite_busy: INTEGER is 5
			--  The database file is locked 

	Sqlite_locked: INTEGER is 6
			--  A table in the database is locked

	Sqlite_nomem: INTEGER is 7
			--  A malloc() failed 

	Sqlite_readonly: INTEGER is 8
			--  Attempt to write a readonly database 

	Sqlite_interrupt: INTEGER is 9
			--  Operation terminated by sqlite_interrupt() 

	Sqlite_ioerr: INTEGER is 10
			--  Some kind of disk I/O error occurred 

	Sqlite_corrupt: INTEGER is 11
			--  The database disk image is malformed 

	Sqlite_notfound: INTEGER is 12
			--  (Internal Only) Table or record not found 

	Sqlite_full: INTEGER is 13
			--  Insertion failed because database is full 

	Sqlite_cantopen: INTEGER is 14
			--  Unable to open the database file 

	Sqlite_protocol: INTEGER is 15
			--  Database lock protocol error 

	Sqlite_empty: INTEGER is 16
			--  (Internal Only) Database table is empty 

	Sqlite_schema: INTEGER is 17
			--  The database schema changed 

	Sqlite_toobig: INTEGER is 18
			--  Too much data for one row of a table 

	Sqlite_constraint: INTEGER is 19
			--  Abort due to contraint violation 

	Sqlite_mismatch: INTEGER is 20
			--  data type mismatch 

	Sqlite_misuse: INTEGER is 21
			--  library used incorrectly 

	Sqlite_nolfs: INTEGER is 22
			--  Uses OS features not supported on host 

	Sqlite_auth: INTEGER is 23
			--  authorization denied 

	Sqlite_row: INTEGER is 100
			--  Sqlite_step() has another row ready 

	Sqlite_done: INTEGER is 101
			--  sqlite_step() has finished executing 

feature
	ext_sqlite_ok: INTEGER is
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_OK"
			}"
		end

	ext_sqlite_error: INTEGER is
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_ERROR"
			}"
		end

	ext_sqlite_internal: INTEGER is
			-- An internal logic error in SQLite 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_INTERNAL"
			}"
		end

	ext_sqlite_perm: INTEGER is
			-- Access permission denied 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_PERM"
			}"
		end

	ext_sqlite_abort: INTEGER is
			-- Callback routine requested an abort 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_ABORT"
			}"
		end
	
	ext_sqlite_busy: INTEGER is
			-- The database file is locked 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_BUSY"
			}"
		end
	
	ext_sqlite_locked: INTEGER is
			-- A table in the database is locked 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_LOCKED"
			}"
		end
	
	ext_sqlite_nomem: INTEGER is
			-- A malloc() failed 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_NOMEM"
			}"
		end
	
	ext_sqlite_readonly: INTEGER is
			-- Attempt to write a readonly database 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_READONLY"
			}"
		end
	
	ext_sqlite_interrupt: INTEGER is
			-- Operation terminated by sqlite_interrupt() 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_INTERRUPT"
			}"
		end
	
	ext_sqlite_ioerr: INTEGER is
			-- Some kind of disk I/O error occurred 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_IOERR"
			}"
		end
	
	ext_sqlite_corrupt: INTEGER is
			-- The database disk image is malformed 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_CORRUPT"
			}"
		end
	
	ext_sqlite_notfound: INTEGER is
			-- (Internal Only) Table or record not found 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_NOTFOUND"
			}"
		end
	
	ext_sqlite_full: INTEGER is
			-- Insertion failed because database is full 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_FULL"
			}"
		end
	
	ext_sqlite_cantopen: INTEGER is
			-- Unable to open the database file 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_CANTOPEN"
			}"
		end
	
	ext_sqlite_protocol: INTEGER is
			-- Database lock protocol error 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_PROTOCOL"
			}"
		end
	
	ext_sqlite_empty: INTEGER is
			-- (Internal Only) Database table is empty 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_EMPTY"
			}"
		end
	
	ext_sqlite_schema: INTEGER is
			-- The database schema changed 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_SCHEMA"
			}"
		end
	
	ext_sqlite_toobig: INTEGER is
			-- Too much data for one row of a table 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_TOOBIG"
			}"
		end
	
	ext_sqlite_constraint: INTEGER is
			-- Abort due to constraint violation 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_CONSTRAINT"
			}"
		end
	
	ext_sqlite_mismatch: INTEGER is
			-- Data type mismatch 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_MISMATCH"
			}"
		end
	
	ext_sqlite_misuse: INTEGER is
			-- Library used incorrectly 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_MISUSE"
			}"
		end
	
	ext_sqlite_nolfs: INTEGER is
			-- Uses OS features not supported on host 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_NOLFS"
			}"
		end
	
	ext_sqlite_auth: INTEGER is
			-- Authorization denied 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_AUTH"
			}"
		end
	
	ext_sqlite_row: INTEGER is
			-- sqlite_step() has another row ready 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_ROW"
			}"
		end
	
	ext_sqlite_done: INTEGER is
			-- sqlite_step() has finished executing 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_DONE"
			}"
		end

feature -- test

	check_error_codes is
		do
			check
				Sqlite_ok = ext_sqlite_ok
				Sqlite_error = ext_sqlite_error
				Sqlite_internal = ext_sqlite_internal
				Sqlite_perm = ext_sqlite_perm
				Sqlite_abort = ext_sqlite_abort
				Sqlite_busy = ext_sqlite_busy
				Sqlite_locked = ext_sqlite_locked
				Sqlite_nomem = ext_sqlite_nomem
				Sqlite_readonly = ext_sqlite_readonly
				Sqlite_interrupt = ext_sqlite_interrupt
				Sqlite_ioerr = ext_sqlite_ioerr
				Sqlite_corrupt = ext_sqlite_corrupt
				Sqlite_notfound = ext_sqlite_notfound
				Sqlite_full = ext_sqlite_full
				Sqlite_cantopen = ext_sqlite_cantopen
				Sqlite_protocol = ext_sqlite_protocol
				Sqlite_empty = ext_sqlite_empty
				Sqlite_schema = ext_sqlite_schema
				Sqlite_toobig = ext_sqlite_toobig
				Sqlite_constraint = ext_sqlite_constraint
				Sqlite_mismatch = ext_sqlite_mismatch
				Sqlite_misuse = ext_sqlite_misuse
				Sqlite_nolfs = ext_sqlite_nolfs
				Sqlite_auth = ext_sqlite_auth
				Sqlite_row = ext_sqlite_row
				Sqlite_done = ext_sqlite_done
			end
		end

	error_message(code: INTEGER): STRING is
		do
			inspect code
			when Sqlite_ok then
				-- Successful result
				Result := "Successful"
			when Sqlite_error then
				-- SQL error or missing database
				Result := "SQL error or missing database"
			when Sqlite_internal then
				-- An internal logic error in SQLite
				Result := "An internal logic error in SQLite"
			when Sqlite_perm then
				-- Access permission denied
				Result := "Access permission denied"
			when Sqlite_abort then
				-- Callback routine requested an abort
				Result := "Callback routine requested an abort"
			when Sqlite_busy then
				-- The database file is locked
				Result := "The database file is locked"
			when Sqlite_locked then
				-- A table in the database is locked
				Result := "A table in the database is locked"
			when Sqlite_nomem then
				-- A malloc() failed	
				Result := "A malloc() failed"
			when Sqlite_readonly then
				-- Attempt to write a readonly database
				Result := "Attempt to write a readonly database"
			when Sqlite_interrupt then
				-- Operation terminated by sqlite_interrupt()
				Result := "Operation terminated by sqlite_interrupt()"
			when Sqlite_ioerr then
				-- Some kind of disk I/O error occurred
				Result := "Some kind of disk I/O error occurred"
			when Sqlite_corrupt then
				-- The database disk image is malformed
				Result := "The database disk image is malformed"
			when Sqlite_notfound then
				-- (Internal Only) Table or record not found	
				Result := "Table or record not found"
			when Sqlite_full then
				-- Insertion failed because database is full
				Result := "Insertion failed because database is full"
			when Sqlite_cantopen then
				-- Unable to open the database file
				Result := "Unable to open the database file"
			when Sqlite_protocol then
				-- Database lock protocol error
				Result := "Database lock protocol error"
			when Sqlite_empty then
				-- (Internal Only) Database table is empty	
				Result := "Database table is empty"
			when Sqlite_schema then
				-- The database schema changed
				Result := "The database schema changed"
			when Sqlite_toobig then
				-- Too much data for one row of a table
				Result := "Too much data for one row of a table"
			when Sqlite_constraint then
				-- Abort due to constraint violation	
				Result := "Abort due to constraint violation"
			when Sqlite_mismatch then
				-- Data type mismatch
				Result := "Data type mismatch"
			when Sqlite_misuse then
				-- Library used incorrectly	
				Result := "Library used incorrectly"
			when Sqlite_nolfs then
				-- Uses OS features not supported on host	
				Result := "Uses OS features not supported on host"
			when Sqlite_auth then
				-- Authorization denied	
				Result := "Authorization denied"
			when Sqlite_row then
				-- sqlite_step() has another row ready	
				Result := "sqlite_step() has another row ready"
			else
				Result := "unknown return code"
				check
					pls_define_the_code: False
				end
			end
		end
end

