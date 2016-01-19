indexing
	description: "values of the the sqlite error code"
	copyright: "2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"
	wrapper_version: "3.4.2"
	
expanded class SQLITE_ERROR_CODES

feature {ANY} -- Result codes 

	sqlite_ok: INTEGER is
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_OK"
			}"
		end

	sqlite_error: INTEGER is
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_ERROR"
			}"
		end

	sqlite_internal: INTEGER is
			-- An internal logic error in SQLite 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_INTERNAL"
			}"
		end

	sqlite_perm: INTEGER is
			-- Access permission denied 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_PERM"
			}"
		end

	sqlite_abort: INTEGER is
			-- Callback routine requested an abort 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_ABORT"
			}"
		end
	
	sqlite_busy: INTEGER is
			-- The database file is locked 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_BUSY"
			}"
		end
	
	sqlite_locked: INTEGER is
			-- A table in the database is locked 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_LOCKED"
			}"
		end
	
	sqlite_nomem: INTEGER is
			-- A malloc() failed 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_NOMEM"
			}"
		end
	
	sqlite_readonly: INTEGER is
			-- Attempt to write a readonly database 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_READONLY"
			}"
		end
	
	sqlite_interrupt: INTEGER is
			-- Operation terminated by sqlite_interrupt() 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_INTERRUPT"
			}"
		end
	
	sqlite_ioerr: INTEGER is
			-- Some kind of disk I/O error occurred 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_IOERR"
			}"
		end
	
	sqlite_corrupt: INTEGER is
			-- The database disk image is malformed 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_CORRUPT"
			}"
		end
	
	sqlite_notfound: INTEGER is
			-- (Internal Only) Table or record not found 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_NOTFOUND"
			}"
		end
	
	sqlite_full: INTEGER is
			-- Insertion failed because database is full 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_FULL"
			}"
		end
	
	sqlite_cantopen: INTEGER is
			-- Unable to open the database file 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_CANTOPEN"
			}"
		end
	
	sqlite_protocol: INTEGER is
			-- Database lock protocol error 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_PROTOCOL"
			}"
		end
	
	sqlite_empty: INTEGER is
			-- (Internal Only) Database table is empty 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_EMPTY"
			}"
		end
	
	sqlite_schema: INTEGER is
			-- The database schema changed 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_SCHEMA"
			}"
		end
	
	sqlite_toobig: INTEGER is
			-- Too much data for one row of a table 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_TOOBIG"
			}"
		end
	
	sqlite_constraint: INTEGER is
			-- Abort due to constraint violation 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_CONSTRAINT"
			}"
		end
	
	sqlite_mismatch: INTEGER is
			-- Data type mismatch 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_MISMATCH"
			}"
		end
	
	sqlite_misuse: INTEGER is
			-- Library used incorrectly 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_MISUSE"
			}"
		end
	
	sqlite_nolfs: INTEGER is
			-- Uses OS features not supported on host 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_NOLFS"
			}"
		end
	
	sqlite_auth: INTEGER is
			-- Authorization denied 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_AUTH"
			}"
		end
	
	sqlite_row: INTEGER is
			-- sqlite_step() has another row ready 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_ROW"
			}"
		end
	
	sqlite_done: INTEGER is
			-- sqlite_step() has finished executing 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "SQLITE_DONE"
			}"
		end

	error_message(code: INTEGER): STRING is
		do
			if     code=sqlite_ok then Result := once "Successful"
			elseif code=sqlite_error then Result := once "SQL error or missing database"
			elseif code=sqlite_internal then Result := once "An internal logic error in SQLite"
			elseif code=sqlite_perm then Result := once "Access permission denied"
			elseif code=sqlite_abort then Result := once "Callback routine requested an abort"
			elseif code=sqlite_busy then Result := once "The database file is locked"
			elseif code=sqlite_locked then Result := once "A table in the database is locked"
			elseif code=sqlite_nomem then Result := once "A malloc() failed"
			elseif code=sqlite_readonly then Result := once "Attempt to write a readonly database"
			elseif code=sqlite_interrupt then Result := once "Operation terminated by sqlite_interrupt()"
			elseif code=sqlite_ioerr then Result := once "Some kind of disk I/O error occurred"
			elseif code=sqlite_corrupt then Result := once "The database disk image is malformed"
			elseif code=sqlite_notfound then Result := once "Table or record not found"
			elseif code=sqlite_full then Result := once "Insertion failed because database is full"
			elseif code=sqlite_cantopen then Result := once "Unable to open the database file"
			elseif code=sqlite_protocol then Result := once "Database lock protocol error"
			elseif code=sqlite_empty then Result := once "Database table is empty"
			elseif code=sqlite_schema then Result := once "The database schema changed"
			elseif code=sqlite_toobig then Result := once "Too much data for one row of a table"
			elseif code=sqlite_constraint then Result := once "Abort due to constraint violation"
			elseif code=sqlite_mismatch then Result := once "Data type mismatch"
			elseif code=sqlite_misuse then Result := once "Library used incorrectly"
			elseif code=sqlite_nolfs then Result := once "Uses OS features not supported on host"
			elseif code=sqlite_auth then Result := once "Authorization denied"
			elseif code=sqlite_row then Result := once "sqlite_step() has another row ready"
			elseif code=sqlite_done then Result := once " sqlite3_step() has finished executing"
			else Result := once "unknown return code"
			end
		end
end

