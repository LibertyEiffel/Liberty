note
	description: "values of the the sqlite error code"
	copyright: "2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"
	wrapper_version: "3.4.2"
    comments_format: "markdown"
	
expanded class SQLITE_ERROR_CODES

feature {} -- Result codes 

	sqlite_ok: INTEGER
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_OK"
			}"
		end

	sqlite_error: INTEGER
			-- SQL error or missing database 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_ERROR"
			}"
		end

	sqlite_internal: INTEGER
			-- An internal logic error in SQLite 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_INTERNAL"
			}"
		end

	sqlite_perm: INTEGER
			-- Access permission denied 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_PERM"
			}"
		end

	sqlite_abort: INTEGER
			-- Callback routine requested an abort 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_ABORT"
			}"
		end
	
	sqlite_busy: INTEGER
			-- The database file is locked 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_BUSY"
			}"
		end
	
	sqlite_locked: INTEGER
			-- A table in the database is locked 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_LOCKED"
			}"
		end
	
	sqlite_nomem: INTEGER
			-- A malloc() failed 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_NOMEM"
			}"
		end
	
	sqlite_readonly: INTEGER
			-- Attempt to write a readonly database 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_READONLY"
			}"
		end
	
	sqlite_interrupt: INTEGER
			-- Operation terminated by sqlite_interrupt() 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_INTERRUPT"
			}"
		end
	
	sqlite_ioerr: INTEGER
			-- Some kind of disk I/O error occurred 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_IOERR"
			}"
		end
	
	sqlite_corrupt: INTEGER
			-- The database disk image is malformed 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_CORRUPT"
			}"
		end
	
	sqlite_notfound: INTEGER
			-- (Internal Only) Table or record not found 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_NOTFOUND"
			}"
		end
	
	sqlite_full: INTEGER
			-- Insertion failed because database is full 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_FULL"
			}"
		end
	
	sqlite_cantopen: INTEGER
			-- Unable to open the database file 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_CANTOPEN"
			}"
		end
	
	sqlite_protocol: INTEGER
			-- Database lock protocol error 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_PROTOCOL"
			}"
		end
	
	sqlite_empty: INTEGER
			-- (Internal Only) Database table is empty 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_EMPTY"
			}"
		end
	
	sqlite_schema: INTEGER
			-- The database schema changed 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_SCHEMA"
			}"
		end
	
	sqlite_toobig: INTEGER
			-- Too much data for one row of a table 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_TOOBIG"
			}"
		end
	
	sqlite_constraint: INTEGER
			-- Abort due to constraint violation 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_CONSTRAINT"
			}"
		end
	
	sqlite_mismatch: INTEGER
			-- Data type mismatch 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_MISMATCH"
			}"
		end
	
	sqlite_misuse: INTEGER
			-- Library used incorrectly 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_MISUSE"
			}"
		end
	
	sqlite_nolfs: INTEGER
			-- Uses OS features not supported on host 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_NOLFS"
			}"
		end
	
	sqlite_auth: INTEGER
			-- Authorization denied 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_AUTH"
			}"
		end
	
	sqlite_row: INTEGER
			-- sqlite_step() has another row ready 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_ROW"
			}"
		end
	
	sqlite_done: INTEGER
			-- sqlite_step() has finished executing 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_DONE"
			}"
		end

	error_message(code: INTEGER): STRING
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

--   SQLite Result Codes
-- 
-- Many of the routines in the SQLite C-language Interface
-- <https://www.sqlite.org/c3ref/intro.html> return numeric result codes
-- indicating either success or failure, and in the event of a failure,
-- providing some idea of the cause of the failure. This document strives
-- to explain what each of those numeric result codes means.

-- 
--     Result Codes versus Error Codes
-- 
-- "Error codes" are a subset of "result codes" that indicate that
-- something has gone wrong. There are only a few non-error result codes:
-- SQLITE_OK <https://www.sqlite.org/rescode.html#ok>, SQLITE_ROW
-- <https://www.sqlite.org/rescode.html#row>, and SQLITE_DONE
-- <https://www.sqlite.org/rescode.html#done>. The term "error code" means
-- any result code other than these three.
-- 

--     Primary Result Codes versus Extended Result Codes

-- Result codes are signed 32-bit integers. The least significant 8 bits of
-- the result code define a broad category and are called the "primary
-- result code". More significant bits provide more detailed information
-- about the error and are called the "extended result code"
-- 
-- Note that the primary result code is always a part of the extended
-- result code. Given a full 32-bit extended result code, the application
-- can always find the corresponding primary result code merely by
-- extracting the least significant 8 bits of the extended result code.
-- 
-- All extended result codes are also error codes. Hence the terms
-- "extended result code" and "extended error code" are interchangeable.

-- For historic compatibility, the C-language interfaces return primary
-- result codes by default. The extended result code for the most recent
-- error can be retrieved using the sqlite3_extended_errcode()
-- <https://www.sqlite.org/c3ref/errcode.html> interface. The
-- sqlite3_extended_result_codes()
-- <https://www.sqlite.org/c3ref/extended_result_codes.html> interface can
-- be used to put a database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> into a mode where it returns
-- the extended result codes instead of the primary result codes.


--     Definitions
-- 
-- All result codes are integers. Symbolic names for all result codes are
-- created using "#define" macros in the sqlite3.h header file. There are
-- separate sections in the sqlite3.h header file for the result code
-- definitions <https://www.sqlite.org/c3ref/c_abort.html> and the extended
-- result code definitions
-- <https://www.sqlite.org/c3ref/c_abort_rollback.html>.

-- Primary result code symbolic names are of the form "SQLITE_XXXXXX" where
-- XXXXXX is a sequence of uppercase alphabetic characters. Extended result
-- code names are of the form "SQLITE_XXXXXX_YYYYYYY" where the XXXXXX part
-- is the corresponding primary result code and the YYYYYYY is an extension
-- that further classifies the result code.
-- 
-- The names and numeric values for existing result codes are fixed and
-- unchanging. However, new result codes, and especially new extended
-- result codes, might appear in future releases of SQLite.
-- 
-- 
--     Primary Result Code List
-- 
-- The 31 result codes are defined in sqlite3.h
-- <https://www.sqlite.org/c3ref/c_abort.html> and are listed in
-- alphabetical order below:

--   * SQLITE_ABORT <https://www.sqlite.org/rescode.html#abort> (4)
--   * SQLITE_AUTH <https://www.sqlite.org/rescode.html#auth> (23)
--   * SQLITE_BUSY <https://www.sqlite.org/rescode.html#busy> (5)
--   * SQLITE_CANTOPEN <https://www.sqlite.org/rescode.html#cantopen> (14)
--   * SQLITE_CONSTRAINT <https://www.sqlite.org/rescode.html#constraint> (19)
--   * SQLITE_CORRUPT <https://www.sqlite.org/rescode.html#corrupt> (11)
--   * SQLITE_DONE <https://www.sqlite.org/rescode.html#done> (101)
--   * SQLITE_EMPTY <https://www.sqlite.org/rescode.html#empty> (16)
--   * SQLITE_ERROR <https://www.sqlite.org/rescode.html#error> (1)
--   * SQLITE_FORMAT <https://www.sqlite.org/rescode.html#format> (24)
--   * SQLITE_FULL <https://www.sqlite.org/rescode.html#full> (13) 
-- 
-- 	
-- 
--   * SQLITE_INTERNAL <https://www.sqlite.org/rescode.html#internal> (2)
--   * SQLITE_INTERRUPT <https://www.sqlite.org/rescode.html#interrupt> (9)
--   * SQLITE_IOERR <https://www.sqlite.org/rescode.html#ioerr> (10)
--   * SQLITE_LOCKED <https://www.sqlite.org/rescode.html#locked> (6)
--   * SQLITE_MISMATCH <https://www.sqlite.org/rescode.html#mismatch> (20)
--   * SQLITE_MISUSE <https://www.sqlite.org/rescode.html#misuse> (21)
--   * SQLITE_NOLFS <https://www.sqlite.org/rescode.html#nolfs> (22)
--   * SQLITE_NOMEM <https://www.sqlite.org/rescode.html#nomem> (7)
--   * SQLITE_NOTADB <https://www.sqlite.org/rescode.html#notadb> (26)
--   * SQLITE_NOTFOUND <https://www.sqlite.org/rescode.html#notfound> (12)
--   * SQLITE_NOTICE <https://www.sqlite.org/rescode.html#notice> (27) 
-- 
-- 	
-- 
--   * SQLITE_OK <https://www.sqlite.org/rescode.html#ok> (0)
--   * SQLITE_PERM <https://www.sqlite.org/rescode.html#perm> (3)
--   * SQLITE_PROTOCOL <https://www.sqlite.org/rescode.html#protocol> (15)
--   * SQLITE_RANGE <https://www.sqlite.org/rescode.html#range> (25)
--   * SQLITE_READONLY <https://www.sqlite.org/rescode.html#readonly> (8)
--   * SQLITE_ROW <https://www.sqlite.org/rescode.html#row> (100)
--   * SQLITE_SCHEMA <https://www.sqlite.org/rescode.html#schema> (17)
--   * SQLITE_TOOBIG <https://www.sqlite.org/rescode.html#toobig> (18)
--   * SQLITE_WARNING <https://www.sqlite.org/rescode.html#warning> (28) 
-- 
-- 
--     Extended Result Code List
-- 
-- The 52 extended result codes are defined in sqlite3.h
-- <https://www.sqlite.org/c3ref/c_abort_rollback.html> and are listed in
-- alphabetical order below:
-- 
--   * SQLITE_ABORT_ROLLBACK
--     <https://www.sqlite.org/rescode.html#abort_rollback> (516)
--   * SQLITE_BUSY_RECOVERY
--     <https://www.sqlite.org/rescode.html#busy_recovery> (261)
--   * SQLITE_BUSY_SNAPSHOT
--     <https://www.sqlite.org/rescode.html#busy_snapshot> (517)
--   * SQLITE_CANTOPEN_CONVPATH
--     <https://www.sqlite.org/rescode.html#cantopen_convpath> (1038)
--   * SQLITE_CANTOPEN_FULLPATH
--     <https://www.sqlite.org/rescode.html#cantopen_fullpath> (782)
--   * SQLITE_CANTOPEN_ISDIR
--     <https://www.sqlite.org/rescode.html#cantopen_isdir> (526)
--   * SQLITE_CANTOPEN_NOTEMPDIR
--     <https://www.sqlite.org/rescode.html#cantopen_notempdir> (270)
--   * SQLITE_CONSTRAINT_CHECK
--     <https://www.sqlite.org/rescode.html#constraint_check> (275)
--   * SQLITE_CONSTRAINT_COMMITHOOK
--     <https://www.sqlite.org/rescode.html#constraint_commithook> (531)
--   * SQLITE_CONSTRAINT_FOREIGNKEY
--     <https://www.sqlite.org/rescode.html#constraint_foreignkey> (787)
--   * SQLITE_CONSTRAINT_FUNCTION
--     <https://www.sqlite.org/rescode.html#constraint_function> (1043)
--   * SQLITE_CONSTRAINT_NOTNULL
--     <https://www.sqlite.org/rescode.html#constraint_notnull> (1299)
--   * SQLITE_CONSTRAINT_PRIMARYKEY
--     <https://www.sqlite.org/rescode.html#constraint_primarykey> (1555)
--   * SQLITE_CONSTRAINT_ROWID
--     <https://www.sqlite.org/rescode.html#constraint_rowid> (2579)
--   * SQLITE_CONSTRAINT_TRIGGER
--     <https://www.sqlite.org/rescode.html#constraint_trigger> (1811)
--   * SQLITE_CONSTRAINT_UNIQUE
--     <https://www.sqlite.org/rescode.html#constraint_unique> (2067)
--   * SQLITE_CONSTRAINT_VTAB
--     <https://www.sqlite.org/rescode.html#constraint_vtab> (2323)
--   * SQLITE_CORRUPT_VTAB
--     <https://www.sqlite.org/rescode.html#corrupt_vtab> (267)
--   * SQLITE_IOERR_ACCESS
--     <https://www.sqlite.org/rescode.html#ioerr_access> (3338)
--   * SQLITE_IOERR_BLOCKED
--     <https://www.sqlite.org/rescode.html#ioerr_blocked> (2826)
--   * SQLITE_IOERR_CHECKRESERVEDLOCK
--     <https://www.sqlite.org/rescode.html#ioerr_checkreservedlock> (3594)
--   * SQLITE_IOERR_CLOSE <https://www.sqlite.org/rescode.html#ioerr_close>
--     (4106)
--   * SQLITE_IOERR_CONVPATH
--     <https://www.sqlite.org/rescode.html#ioerr_convpath> (6666)
--   * SQLITE_IOERR_DELETE
--     <https://www.sqlite.org/rescode.html#ioerr_delete> (2570)
--   * SQLITE_IOERR_DELETE_NOENT
--     <https://www.sqlite.org/rescode.html#ioerr_delete_noent> (5898)
--   * SQLITE_IOERR_DIR_CLOSE
--     <https://www.sqlite.org/rescode.html#ioerr_dir_close> (4362) 
-- 
-- 	
-- 
--   * SQLITE_IOERR_DIR_FSYNC
--     <https://www.sqlite.org/rescode.html#ioerr_dir_fsync> (1290)
--   * SQLITE_IOERR_FSTAT <https://www.sqlite.org/rescode.html#ioerr_fstat>
--     (1802)
--   * SQLITE_IOERR_FSYNC <https://www.sqlite.org/rescode.html#ioerr_fsync>
--     (1034)
--   * SQLITE_IOERR_GETTEMPPATH
--     <https://www.sqlite.org/rescode.html#ioerr_gettemppath> (6410)
--   * SQLITE_IOERR_LOCK <https://www.sqlite.org/rescode.html#ioerr_lock>
--     (3850)
--   * SQLITE_IOERR_MMAP <https://www.sqlite.org/rescode.html#ioerr_mmap>
--     (6154)
--   * SQLITE_IOERR_NOMEM <https://www.sqlite.org/rescode.html#ioerr_nomem>
--     (3082)
--   * SQLITE_IOERR_RDLOCK
--     <https://www.sqlite.org/rescode.html#ioerr_rdlock> (2314)
--   * SQLITE_IOERR_READ <https://www.sqlite.org/rescode.html#ioerr_read>
--     (266)
--   * SQLITE_IOERR_SEEK <https://www.sqlite.org/rescode.html#ioerr_seek>
--     (5642)
--   * SQLITE_IOERR_SHMLOCK
--     <https://www.sqlite.org/rescode.html#ioerr_shmlock> (5130)
--   * SQLITE_IOERR_SHMMAP
--     <https://www.sqlite.org/rescode.html#ioerr_shmmap> (5386)
--   * SQLITE_IOERR_SHMOPEN
--     <https://www.sqlite.org/rescode.html#ioerr_shmopen> (4618)
--   * SQLITE_IOERR_SHMSIZE
--     <https://www.sqlite.org/rescode.html#ioerr_shmsize> (4874)
--   * SQLITE_IOERR_SHORT_READ
--     <https://www.sqlite.org/rescode.html#ioerr_short_read> (522)
--   * SQLITE_IOERR_TRUNCATE
--     <https://www.sqlite.org/rescode.html#ioerr_truncate> (1546)
--   * SQLITE_IOERR_UNLOCK
--     <https://www.sqlite.org/rescode.html#ioerr_unlock> (2058)
--   * SQLITE_IOERR_WRITE <https://www.sqlite.org/rescode.html#ioerr_write>
--     (778)
--   * SQLITE_LOCKED_SHAREDCACHE
--     <https://www.sqlite.org/rescode.html#locked_sharedcache> (262)
--   * SQLITE_NOTICE_RECOVER_ROLLBACK
--     <https://www.sqlite.org/rescode.html#notice_recover_rollback> (539)
--   * SQLITE_NOTICE_RECOVER_WAL
--     <https://www.sqlite.org/rescode.html#notice_recover_wal> (283)
--   * SQLITE_READONLY_CANTLOCK
--     <https://www.sqlite.org/rescode.html#readonly_cantlock> (520)
--   * SQLITE_READONLY_DBMOVED
--     <https://www.sqlite.org/rescode.html#readonly_dbmoved> (1032)
--   * SQLITE_READONLY_RECOVERY
--     <https://www.sqlite.org/rescode.html#readonly_recovery> (264)
--   * SQLITE_READONLY_ROLLBACK
--     <https://www.sqlite.org/rescode.html#readonly_rollback> (776)
--   * SQLITE_WARNING_AUTOINDEX
--     <https://www.sqlite.org/rescode.html#warning_autoindex> (284) 
-- 
-- 
--     Result Code Meanings
-- 
-- The meanings for all 83 result code values are shown below, in numeric
-- order.
-- 
-- 
--       (0) SQLITE_OK
-- 
-- The SQLITE_OK result code means that the operation was successful and
-- that there were no errors. Most other result codes indicate an error.
-- 
-- 
--       (1) SQLITE_ERROR
-- 
-- The SQLITE_ERROR result code is a generic error code that is used when
-- no other more specific error code is available.
-- 
-- 
--       (2) SQLITE_INTERNAL
-- 
-- The SQLITE_INTERNAL result code indicates an internal malfunction. In a
-- working version of SQLite, an application should never see this result
-- code. If application does encounter this result code, it shows that
-- there is a bug in the database engine.
-- 
-- SQLite does not currently generate this result code. However,
-- application-defined SQL functions
-- <https://www.sqlite.org/c3ref/create_function.html> or virtual tables
-- <https://www.sqlite.org/vtab.html>, or VFSes
-- <https://www.sqlite.org/vfs.html>, or other extensions might cause this
-- result code to be returned.
-- 
-- 
--       (3) SQLITE_PERM
-- 
-- The SQLITE_PERM result code indicates that the requested access mode for
-- a newly created database could not be provided.
-- 
-- 
--       (4) SQLITE_ABORT
-- 
-- The SQLITE_ABORT result code indicates that an operation was aborted
-- prior to completion, usually be application request. See also:
-- SQLITE_INTERRUPT <https://www.sqlite.org/rescode.html#interrupt>.
-- 
-- If the callback function to sqlite3_exec()
-- <https://www.sqlite.org/c3ref/exec.html> returns non-zero, then
-- sqlite3_exec() will return SQLITE_ABORT.
-- 
-- If a ROLLBACK <https://www.sqlite.org/lang_transaction.html> operation
-- occurs on the same database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> as a pending read or write,
-- then the pending read or write may fail with an SQLITE_ABORT or
-- SQLITE_ABORT_ROLLBACK
-- <https://www.sqlite.org/rescode.html#abort_rollback> error.
-- 
-- In addition to being a result code, the SQLITE_ABORT value is also used
-- as a conflict resolution mode <https://www.sqlite.org/c3ref/c_fail.html>
-- returned from the sqlite3_vtab_on_conflict()
-- <https://www.sqlite.org/c3ref/vtab_on_conflict.html> interface.
-- 
-- 
--       (5) SQLITE_BUSY
-- 
-- The SQLITE_BUSY result code indicates that the database file could not
-- be written (or in some cases read) because of concurrent activity by
-- some other database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html>, usually a database
-- connection in a separate process.
-- 
-- For example, if process A is in the middle of a large write transaction
-- and at the same time process B attempts to start a new write
-- transaction, process B will get back an SQLITE_BUSY result because
-- SQLite only supports one writer at a time. Process B will need to wait
-- for process A to finish its transaction before starting a new
-- transaction. The sqlite3_busy_timeout()
-- <https://www.sqlite.org/c3ref/busy_timeout.html> and
-- sqlite3_busy_handler() <https://www.sqlite.org/c3ref/busy_handler.html>
-- interfaces and the busy_timeout pragma
-- <https://www.sqlite.org/pragma.html#pragma_busy_timeout> are available
-- to process B to help it deal with SQLITE_BUSY errors.
-- 
-- An SQLITE_BUSY error can occur at any point in a transaction: when the
-- transaction is first started, during any write or update operations, or
-- when the transaction commits. To avoid encountering SQLITE_BUSY errors
-- in the middle of a transaction, the application can use BEGIN IMMEDIATE
-- <https://www.sqlite.org/lang_transaction.html#immediate> instead of just
-- BEGIN <https://www.sqlite.org/lang_transaction.html> to start a
-- transaction. The BEGIN IMMEDIATE
-- <https://www.sqlite.org/lang_transaction.html#immediate> command might
-- itself return SQLITE_BUSY, but if it succeeds, then SQLite guarantees
-- that no subsequent operations on the same database through the next
-- COMMIT <https://www.sqlite.org/lang_transaction.html> will return
-- SQLITE_BUSY.
-- 
-- See also: SQLITE_BUSY_RECOVERY
-- <https://www.sqlite.org/rescode.html#busy_recovery> and
-- SQLITE_BUSY_SNAPSHOT <https://www.sqlite.org/rescode.html#busy_snapshot>.
-- 
-- The SQLITE_BUSY result code differs from SQLITE_LOCKED
-- <https://www.sqlite.org/rescode.html#locked> in that SQLITE_BUSY
-- indicates a conflict with a separate database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html>, probably in a separate
-- process, whereas SQLITE_LOCKED
-- <https://www.sqlite.org/rescode.html#locked> indicates a conflict within
-- the same database connection <https://www.sqlite.org/c3ref/sqlite3.html>
-- (or sometimes a database connection with a shared cache
-- <https://www.sqlite.org/sharedcache.html>).
-- 
-- 
--       (6) SQLITE_LOCKED
-- 
-- The SQLITE_LOCKED result code indicates that a write operation could not
-- continue because of a conflict within the same database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> or a conflict with a
-- different database connection that uses a shared cache
-- <https://www.sqlite.org/sharedcache.html>.
-- 
-- For example, a DROP TABLE <https://www.sqlite.org/lang_droptable.html>
-- statement cannot be run while another thread is reading from that table
-- on the same database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> because dropping the table
-- would delete the table out from under the concurrent reader.
-- 
-- The SQLITE_LOCKED result code differs from SQLITE_BUSY
-- <https://www.sqlite.org/rescode.html#busy> in that SQLITE_LOCKED
-- indicates a conflict on the same database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> (or on a connection with a
-- shared cache <https://www.sqlite.org/sharedcache.html>) whereas
-- SQLITE_BUSY <https://www.sqlite.org/rescode.html#busy> indicates a
-- conflict with a different database connection, probably in a different
-- process.
-- 
-- 
--       (7) SQLITE_NOMEM
-- 
-- The SQLITE_NOMEM result code indicates that SQLite was unable to
-- allocate all the memory it needed to complete the operation. In other
-- words, an internal call to sqlite3_malloc()
-- <https://www.sqlite.org/c3ref/free.html> or sqlite3_realloc()
-- <https://www.sqlite.org/c3ref/free.html> has failed in a case where the
-- memory being allocated was required in order to continue the operation.
-- 
-- 
--       (8) SQLITE_READONLY
-- 
-- The SQLITE_READONLY result code is returned when an attempt is made to
-- alter some data for which the current database connection does not have
-- write permission.
-- 
-- 
--       (9) SQLITE_INTERRUPT
-- 
-- The SQLITE_INTERRUPT result code indicates that an operation was
-- interrupted by the sqlite3_interrupt()
-- <https://www.sqlite.org/c3ref/interrupt.html> interface. See also:
-- SQLITE_ABORT <https://www.sqlite.org/rescode.html#abort>
-- 
-- 
--       (10) SQLITE_IOERR
-- 
-- The SQLITE_IOERR result code says that the operation could not finish
-- because the operating system reported an I/O error.
-- 
-- A full disk drive will normally give an SQLITE_FULL
-- <https://www.sqlite.org/rescode.html#full> error rather than an
-- SQLITE_IOERR error.
-- 
-- There are many different extended result codes for I/O errors that
-- identify the specific I/O operation that failed.
-- 
-- 
--       (11) SQLITE_CORRUPT
-- 
-- The SQLITE_CORRUPT result code indicates that the database file has been
-- corrupted. See the How To Corrupt Your Database Files
-- <https://www.sqlite.org/lockingv3.html#how_to_corrupt> for further
-- discussion on how corruption can occur.
-- 
-- 
--       (12) SQLITE_NOTFOUND
-- 
-- The SQLITE_NOTFOUND result code is used in two contexts. SQLITE_NOTFOUND
-- can be returned by the sqlite3_file_control()
-- <https://www.sqlite.org/c3ref/file_control.html> interface to indicate
-- that the file control opcode
-- <https://www.sqlite.org/c3ref/c_fcntl_busyhandler.html> passed as the
-- third argument was not recognized by the underlying VFS
-- <https://www.sqlite.org/vfs.html>. SQLITE_NOTFOUND can also be returned
-- by the xSetSystemCall() method of an sqlite3_vfs
-- <https://www.sqlite.org/c3ref/vfs.html> object.
-- 
-- The SQLITE_NOTFOUND result code is also used internally by the SQLite
-- implementation, but those internal uses are not exposed to the application.
-- 
-- 
--       (13) SQLITE_FULL
-- 
-- The SQLITE_FULL result code indicates that a write could not complete
-- because the disk is full. Note that this error can occur when trying to
-- write information into the main database file, or it can also occur when
-- writing into temporary disk files <https://www.sqlite.org/tempfiles.html>.
-- 
-- Sometimes applications encounter this error even though there is an
-- abundance of primary disk space because the error occurs when writing
-- into temporary disk files <https://www.sqlite.org/tempfiles.html> on a
-- system where temporary files are stored on a separate partition with
-- much less space that the primary disk.
-- 
-- 
--       (14) SQLITE_CANTOPEN
-- 
-- The SQLITE_CANTOPEN result code indicates that SQLite was unable to open
-- a file. The file in question might be a primary database file or on of
-- several temporary disk files <https://www.sqlite.org/tempfiles.html>.
-- 
-- 
--       (15) SQLITE_PROTOCOL
-- 
-- The SQLITE_PROTOCOL result code indicates a problem with the file
-- locking protocol used by SQLite. The SQLITE_PROTOCOL error is currently
-- only returned when using WAL mode <https://www.sqlite.org/wal.html> and
-- attempting to start a new transaction. There is a race condition that
-- can occur when two separate database connections
-- <https://www.sqlite.org/c3ref/sqlite3.html> both try to start a
-- transaction at the same time in WAL mode
-- <https://www.sqlite.org/wal.html>. The loser of the race backs off and
-- tries again, after a brief delay. If the same connection loses the
-- locking race dozens of times over a span of multiple seconds, it will
-- eventually give up and return SQLITE_PROTOCOL. The SQLITE_PROTOCOL error
-- should appear in practice very, very rarely, and only when there are
-- many separate processes all competing intensely to write to the same
-- database.
-- 
-- 
--       (16) SQLITE_EMPTY
-- 
-- The SQLITE_EMPTY result code is not currently used.
-- 
-- 
--       (17) SQLITE_SCHEMA
-- 
-- The SQLITE_SCHEMA result code indicates that the database schema has
-- changed. This result code can be returned from sqlite3_step()
-- <https://www.sqlite.org/c3ref/step.html> for a prepared statement
-- <https://www.sqlite.org/c3ref/stmt.html> that was generated using
-- sqlite3_prepare() <https://www.sqlite.org/c3ref/prepare.html> or
-- sqlite3_prepare16() <https://www.sqlite.org/c3ref/prepare.html>. If the
-- database schema was changed by some other process in between the time
-- that the statement was prepared and the time the statement was run, this
-- error can result.
-- 
-- If a prepared statement <https://www.sqlite.org/c3ref/stmt.html> is
-- generated from sqlite3_prepare_v2()
-- <https://www.sqlite.org/c3ref/prepare.html> then the statement is
-- automatically re-prepared if the schema changes, up to
-- SQLITE_MAX_SCHEMA_RETRY
-- <https://www.sqlite.org/compile.html#max_schema_retry> times (default:
-- 50). The sqlite3_step() <https://www.sqlite.org/c3ref/step.html>
-- interface will only return SQLITE_SCHEMA back to the application if the
-- failure persists after these many retries.
-- 
-- 
--       (18) SQLITE_TOOBIG
-- 
-- The SQLITE_TOOBIG error code indicates that a string or BLOB was too
-- large. The default maximum length of a string or BLOB in SQLite is
-- 1,000,000,000 bytes. This maximum length can be changed at compile-time
-- using the SQLITE_MAX_LENGTH
-- <https://www.sqlite.org/limits.html#max_length> compile-time option, or
-- at run-time using the sqlite3_limit
-- <https://www.sqlite.org/c3ref/limit.html>(db,SQLITE_LIMIT_LENGTH
-- <https://www.sqlite.org/c3ref/c_limit_attached.html#sqlitelimitlength>,...)
-- interface. The SQLITE_TOOBIG error results when SQLite encounters a
-- string or BLOB that exceeds the compile-time or run-time limit.
-- 
-- The SQLITE_TOOBIG error code can also result when an oversized SQL
-- statement is passed into one of the sqlite3_prepare_v2()
-- <https://www.sqlite.org/c3ref/prepare.html> interfaces. The maximum
-- length of an SQL statement defaults to a much smaller value of 1,000,000
-- bytes. The maximum SQL statement length can be set at compile-time using
-- SQLITE_MAX_SQL_LENGTH
-- <https://www.sqlite.org/limits.html#max_sql_length> or at run-time using
-- sqlite3_limit
-- <https://www.sqlite.org/c3ref/limit.html>(db,SQLITE_LIMIT_SQL_LENGTH
-- <https://www.sqlite.org/c3ref/c_limit_attached.html#sqlitelimitsqllength>,...).
-- 
-- 
-- 
--       (19) SQLITE_CONSTRAINT
-- 
-- The SQLITE_CONSTRAINT error code means that an SQL constraint violation
-- occurred while trying to process an SQL statement. Additional
-- information about the failed constraint can be found by consulting the
-- accompanying error message (returned via sqlite3_errmsg()
-- <https://www.sqlite.org/c3ref/errcode.html> or sqlite3_errmsg16()
-- <https://www.sqlite.org/c3ref/errcode.html>) or by looking at the
-- extended error code <https://www.sqlite.org/rescode.html#extrc>.
-- 
-- 
--       (20) SQLITE_MISMATCH
-- 
-- The SQLITE_MISMATCH error code indicates a datatype mismatch.
-- 
-- SQLite is normally very forgiving about mismatches between the type of a
-- value and the declared type of the container in which that value is to
-- be stored. For example, SQLite allows the application to store a large
-- BLOB in a column with a declared type of BOOLEAN. But in a few cases,
-- SQLite is strict about types. The SQLITE_MISMATCH error is returned in
-- those few cases when the types do not match.
-- 
-- The rowid <https://www.sqlite.org/lang_createtable.html#rowid> of a
-- table must be an integer. Attempt to set the rowid
-- <https://www.sqlite.org/lang_createtable.html#rowid> to anything other
-- than an integer (or a NULL which will be automatically converted into
-- the next available integer rowid) results in an SQLITE_MISMATCH error.
-- 
-- 
--       (21) SQLITE_MISUSE
-- 
-- The SQLITE_MISUSE return code might be returned if the application uses
-- any SQLite interface in a way that is undefined or unsupported. For
-- example, using a prepared statement
-- <https://www.sqlite.org/c3ref/stmt.html> after that prepared statement
-- has been finalized <https://www.sqlite.org/c3ref/finalize.html> might
-- result in an SQLITE_MISUSE error.
-- 
-- SQLite tries to detect misuse and report the misuse using this result
-- code. However, there is no guarantee that the detection of misuse will
-- be successful. Misuse detection is probabilistic. Applications should
-- never depend on an SQLITE_MISUSE return value.
-- 
-- If SQLite ever returns SQLITE_MISUSE from any interface, that means that
-- the application is incorrectly coded and needs to be fixed. Do not ship
-- an application that sometimes returns SQLITE_MISUSE from a standard
-- SQLite interface because that application contains potentially serious
-- bugs.
-- 
-- 
--       (22) SQLITE_NOLFS
-- 
-- The SQLITE_NOLFS error can be returned on systems that do not support
-- large files when the database grows to be larger than what the
-- filesystem can handle. "NOLFS" stands for "NO Large File Support".
-- 
-- 
--       (23) SQLITE_AUTH
-- 
-- The SQLITE_AUTH error is returned when the authorizer callback
-- <https://www.sqlite.org/c3ref/set_authorizer.html> indicates that an SQL
-- statement being prepared is not authorized.
-- 
-- 
--       (24) SQLITE_FORMAT
-- 
-- The SQLITE_FORMAT error code is not currently used by SQLite.
-- 
-- 
--       (25) SQLITE_RANGE
-- 
-- The SQLITE_RANGE error indices that the parameter number argument to one
-- of the sqlite3_bind <https://www.sqlite.org/c3ref/bind_blob.html>
-- routines or the column number in one of the sqlite3_column
-- <https://www.sqlite.org/c3ref/column_blob.html> routines is out of range.
-- 
-- 
--       (26) SQLITE_NOTADB
-- 
-- When attempting to open a file, the SQLITE_NOTADB error indicates that
-- the file being opened does not appear to be an SQLite database file.
-- 
-- 
--       (27) SQLITE_NOTICE
-- 
-- The SQLITE_NOTICE result code is not returned by any C/C++ interface.
-- However, SQLITE_NOTICE (or rather one of its extended error codes
-- <https://www.sqlite.org/rescode.html#extrc>) is sometimes used as the
-- first argument in an sqlite3_log()
-- <https://www.sqlite.org/c3ref/log.html> callback to indicate that an
-- unusual operation is taking place.
-- 
-- 
--       (28) SQLITE_WARNING
-- 
-- The SQLITE_WARNING result code is not returned by any C/C++ interface.
-- However, SQLITE_WARNING (or rather one of its extended error codes
-- <https://www.sqlite.org/rescode.html#extrc>) is sometimes used as the
-- first argument in an sqlite3_log()
-- <https://www.sqlite.org/c3ref/log.html> callback to indicate that an
-- unusual and possibly ill-advised operation is taking place.
-- 
-- 
--       (100) SQLITE_ROW
-- 
-- The SQLITE_ROW result code returned by sqlite3_step()
-- <https://www.sqlite.org/c3ref/step.html> indicates that another row of
-- output is available.
-- 
-- 
--       (101) SQLITE_DONE
-- 
-- The SQLITE_DONE result code indicates that an operation has completed.
-- The SQLITE_DONE result code is most commonly seen as a return value from
-- sqlite3_step() <https://www.sqlite.org/c3ref/step.html> indicating that
-- the SQL statement has run to completion. But SQLITE_DONE can also be
-- returned by other multi-step interfaces such as sqlite3_backup_step()
-- <https://www.sqlite.org/c3ref/backup_finish.html#sqlite3backupstep>.
-- 
-- 
--       (261) SQLITE_BUSY_RECOVERY
-- 
-- The SQLITE_BUSY_RECOVERY error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_BUSY
-- <https://www.sqlite.org/rescode.html#busy> that indicates that an
-- operation could not continue because another process is busy recovering
-- a WAL mode <https://www.sqlite.org/wal.html> database file following a
-- crash. The SQLITE_BUSY_RECOVERY error code only occurs on WAL mode
-- <https://www.sqlite.org/wal.html> databases.
-- 
-- 
--       (262) SQLITE_LOCKED_SHAREDCACHE
-- 
-- The SQLITE_LOCKED_SHAREDCACHE error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_LOCKED
-- <https://www.sqlite.org/rescode.html#locked> indicating that the locking
-- conflict has occurred due to contention with a different database
-- connection <https://www.sqlite.org/c3ref/sqlite3.html> that happens to
-- hold a shared cache <https://www.sqlite.org/sharedcache.html> with the
-- database connection to which the error was returned. For example, if the
-- other database connection is holding an exclusive lock
-- <https://www.sqlite.org/lockingv3.html#excl_lock> on the database, then
-- the database connection that receives this error will be unable to read
-- or write any part of the database file unless it has the
-- read_uncommitted pragma
-- <https://www.sqlite.org/pragma.html#pragma_read_uncommitted> enabled.
-- 
-- The SQLITE_LOCKED_SHARECACHE error code works very much like the
-- SQLITE_BUSY <https://www.sqlite.org/rescode.html#busy> error code except
-- that SQLITE_LOCKED_SHARECACHE is for separate database connections that
-- share a cache whereas SQLITE_BUSY is for the much more common case of
-- separate database connections that do not share the same cache. Also,
-- the sqlite3_busy_handler()
-- <https://www.sqlite.org/c3ref/busy_handler.html> and
-- sqlite3_busy_timeout() <https://www.sqlite.org/c3ref/busy_timeout.html>
-- interfaces do not help in resolving SQLITE_LOCKED_SHAREDCACHE conflicts.
-- 
-- 
--       (264) SQLITE_READONLY_RECOVERY
-- 
-- The SQLITE_READONLY_RECOVERY error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_READONLY
-- <https://www.sqlite.org/rescode.html#readonly>. The
-- SQLITE_READONLY_RECOVERY error code indicates that a WAL mode
-- <https://www.sqlite.org/wal.html> database cannot be opened because the
-- database file needs to be recovered and recovery requires write access
-- but only read access is available.
-- 
-- 
--       (266) SQLITE_IOERR_READ
-- 
-- The SQLITE_IOERR_READ error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to read
-- from a file on disk. This error might result from a hardware malfunction
-- or because a filesystem came unmounted while the file was open.
-- 
-- 
--       (267) SQLITE_CORRUPT_VTAB
-- 
-- The SQLITE_CORRUPT_VTAB error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CORRUPT
-- <https://www.sqlite.org/rescode.html#corrupt> used by virtual tables
-- <https://www.sqlite.org/vtab.html>. A virtual table
-- <https://www.sqlite.org/vtab.html> might return SQLITE_CORRUPT_VTAB to
-- indicate that content in the virtual table is corrupt.
-- 
-- 
--       (270) SQLITE_CANTOPEN_NOTEMPDIR
-- 
-- The SQLITE_CANTOPEN_NOTEMPDIR error code is no longer used.
-- 
-- 
--       (275) SQLITE_CONSTRAINT_CHECK
-- 
-- The SQLITE_CONSTRAINT_CHECK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a CHECK
-- constraint <https://www.sqlite.org/lang_createtable.html#ckconst> failed.
-- 
-- 
--       (283) SQLITE_NOTICE_RECOVER_WAL
-- 
-- The SQLITE_NOTICE_RECOVER_WAL result code is passed to the callback of
-- sqlite3_log() <https://www.sqlite.org/c3ref/log.html> when a WAL mode
-- <https://www.sqlite.org/wal.html> database file is recovered.
-- 
-- 
--       (284) SQLITE_WARNING_AUTOINDEX
-- 
-- The SQLITE_WARNING_AUTOINDEX result code is passed to the callback of
-- sqlite3_log() <https://www.sqlite.org/c3ref/log.html> whenever automatic
-- indexing <https://www.sqlite.org/optoverview.html#autoindex> is used.
-- This can serve as a warning to application designers that the database
-- might benefit from additional indexes.
-- 
-- 
--       (516) SQLITE_ABORT_ROLLBACK
-- 
-- The SQLITE_ABORT_ROLLBACK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_ABORT
-- <https://www.sqlite.org/rescode.html#abort> indicating that an SQL
-- statement aborted because the transaction that was active when the SQL
-- statement first started was rolled back. Pending write operations always
-- fail with this error when a rollback occurs. A ROLLBACK
-- <https://www.sqlite.org/lang_transaction.html> will cause a pending read
-- operation to fail only if the schema was changed within the transaction
-- being rolled back.
-- 
-- 
--       (517) SQLITE_BUSY_SNAPSHOT
-- 
-- The SQLITE_BUSY_SNAPSHOT error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_BUSY
-- <https://www.sqlite.org/rescode.html#busy> that occurs on WAL mode
-- <https://www.sqlite.org/wal.html> databases when a database connection
-- tries to promote a read transaction into a write transaction but finds
-- that another database connection
-- <https://www.sqlite.org/c3ref/sqlite3.html> has already written to the
-- database and thus invalidated prior reads.
-- 
-- The following scenario illustrates how an SQLITE_BUSY_SNAPSHOT error
-- might arise:
-- 
--  1. Process A starts a read transaction on the database and does one or
--     more SELECT statement. Process A keeps the transaction open.
--  2. Process B updates the database, changing values previous read by
--     process A.
--  3. Process A now tries to write to the database. But process A's view
--     of the database content is now obsolete because process B has
--     modified the database file after process A read from it. Hence
--     process A gets an SQLITE_BUSY_SNAPSHOT error. 
-- 
-- 
--       (520) SQLITE_READONLY_CANTLOCK
-- 
-- The SQLITE_READONLY_CANTLOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_READONLY
-- <https://www.sqlite.org/rescode.html#readonly>. The
-- SQLITE_READONLY_CANTLOCK error code indicates that SQLite is unable to
-- obtain a read lock on a WAL mode <https://www.sqlite.org/wal.html>
-- database because the shared-memory file associated with that database is
-- read-only.
-- 
-- 
--       (522) SQLITE_IOERR_SHORT_READ
-- 
-- The SQLITE_IOERR_SHORT_READ error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating that a read
-- attempt in the VFS <https://www.sqlite.org/vfs.html> layer was unable to
-- obtain as many bytes as was requested. This might be due to a truncated
-- file.
-- 
-- 
--       (526) SQLITE_CANTOPEN_ISDIR
-- 
-- The SQLITE_CANTOPEN_ISDIR error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CANTOPEN
-- <https://www.sqlite.org/rescode.html#cantopen> indicating that a file
-- open operation failed because the file is really a directory.
-- 
-- 
--       (531) SQLITE_CONSTRAINT_COMMITHOOK
-- 
-- The SQLITE_CONSTRAINT_COMMITHOOK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a
-- commit hook callback <https://www.sqlite.org/c3ref/commit_hook.html>
-- returned non-zero that thus caused the SQL statement to be rolled back.
-- 
-- 
--       (539) SQLITE_NOTICE_RECOVER_ROLLBACK
-- 
-- The SQLITE_NOTICE_RECOVER_ROLLBACK result code is passed to the callback
-- of sqlite3_log() <https://www.sqlite.org/c3ref/log.html> when a hot
-- journal <https://www.sqlite.org/lockingv3.html#hotjrnl> is rolled back.
-- 
-- 
--       (776) SQLITE_READONLY_ROLLBACK
-- 
-- The SQLITE_READONLY_ROLLBACK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_READONLY
-- <https://www.sqlite.org/rescode.html#readonly>. The
-- SQLITE_READONLY_ROLLBACK error code indicates that a database cannot be
-- opened because it has a hot journal
-- <https://www.sqlite.org/lockingv3.html#hotjrnl> that needs to be rolled
-- back but cannot because the database is readonly.
-- 
-- 
--       (778) SQLITE_IOERR_WRITE
-- 
-- The SQLITE_IOERR_WRITE error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to write
-- into a file on disk. This error might result from a hardware malfunction
-- or because a filesystem came unmounted while the file was open. This
-- error should not occur if the filesystem is full as there is a separate
-- error code (SQLITE_FULL) for that purpose.
-- 
-- 
--       (782) SQLITE_CANTOPEN_FULLPATH
-- 
-- The SQLITE_CANTOPEN_FULLPATH error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CANTOPEN
-- <https://www.sqlite.org/rescode.html#cantopen> indicating that a file
-- open operation failed because the operating system was unable to convert
-- the filename into a full pathname.
-- 
-- 
--       (787) SQLITE_CONSTRAINT_FOREIGNKEY
-- 
-- The SQLITE_CONSTRAINT_FOREIGNKEY error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a
-- foreign key constraint <https://www.sqlite.org/foreignkeys.html> failed.
-- 
-- 
--       (1032) SQLITE_READONLY_DBMOVED
-- 
-- The SQLITE_READONLY_DBMOVED error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_READONLY
-- <https://www.sqlite.org/rescode.html#readonly>. The
-- SQLITE_READONLY_DBMOVED error code indicates that a database cannot be
-- modified because the database file has been moved since it was opened,
-- and so any attempt to modify the database might result in database
-- corruption if the processes crashes because the rollback journal
-- <https://www.sqlite.org/lockingv3.html#rollback> would not be correctly
-- named.
-- 
-- 
--       (1034) SQLITE_IOERR_FSYNC
-- 
-- The SQLITE_IOERR_FSYNC error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to flush
-- previously written content out of OS and/or disk-control buffers and
-- into persistent storage. In other words, this code indicates a problem
-- with the fsync() system call in unix or the FlushFileBuffers() system
-- call in windows.
-- 
-- 
--       (1038) SQLITE_CANTOPEN_CONVPATH
-- 
-- The SQLITE_CANTOPEN_CONVPATH error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CANTOPEN
-- <https://www.sqlite.org/rescode.html#cantopen> used only by Cygwin VFS
-- <https://www.sqlite.org/vfs.html> and indicating that the
-- cygwin_conv_path() system call failed while trying to open a file. See
-- also: SQLITE_IOERR_CONVPATH
-- <https://www.sqlite.org/rescode.html#ioerr_convpath>
-- 
-- 
--       (1043) SQLITE_CONSTRAINT_FUNCTION
-- 
-- The SQLITE_CONSTRAINT_FUNCTION error code is not currently used by the
-- SQLite core. However, this error code is available for use by extension
-- functions.
-- 
-- 
--       (1290) SQLITE_IOERR_DIR_FSYNC
-- 
-- The SQLITE_IOERR_DIR_FSYNC error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to invoke
-- fsync() on a directory. The unix VFS <https://www.sqlite.org/vfs.html>
-- attempts to fsync() directories after creating or deleting certain files
-- to ensure that those files will still appear in the filesystem following
-- a power loss or system crash. This error code indicates a problem
-- attempting to perform that fsync().
-- 
-- 
--       (1299) SQLITE_CONSTRAINT_NOTNULL
-- 
-- The SQLITE_CONSTRAINT_NOTNULL error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a NOT
-- NULL constraint
-- <https://www.sqlite.org/lang_createtable.html#notnullconst> failed.
-- 
-- 
--       (1546) SQLITE_IOERR_TRUNCATE
-- 
-- The SQLITE_IOERR_TRUNCATE error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to truncate
-- a file to a smaller size.
-- 
-- 
--       (1555) SQLITE_CONSTRAINT_PRIMARYKEY
-- 
-- The SQLITE_CONSTRAINT_PRIMARYKEY error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a
-- PRIMARY KEY constraint
-- <https://www.sqlite.org/lang_createtable.html#primkeyconst> failed.
-- 
-- 
--       (1802) SQLITE_IOERR_FSTAT
-- 
-- The SQLITE_IOERR_FSTAT error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the VFS <https://www.sqlite.org/vfs.html> layer while trying to invoke
-- fstat() (or the equivalent) on a file in order to determine information
-- such as the file size or access permissions.
-- 
-- 
--       (1811) SQLITE_CONSTRAINT_TRIGGER
-- 
-- The SQLITE_CONSTRAINT_TRIGGER error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a RAISE
-- function <https://www.sqlite.org/lang_createtrigger.html#raise> within a
-- trigger <https://www.sqlite.org/lang_createtrigger.html> fired, causing
-- the SQL statement to abort.
-- 
-- 
--       (2058) SQLITE_IOERR_UNLOCK
-- 
-- The SQLITE_IOERR_UNLOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within xUnlock method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object.
-- 
-- 
--       (2067) SQLITE_CONSTRAINT_UNIQUE
-- 
-- The SQLITE_CONSTRAINT_UNIQUE error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a
-- UNIQUE constraint
-- <https://www.sqlite.org/lang_createtable.html#uniqueconst> failed.
-- 
-- 
--       (2314) SQLITE_IOERR_RDLOCK
-- 
-- The SQLITE_IOERR_UNLOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within xLock method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- obtain a read lock.
-- 
-- 
--       (2323) SQLITE_CONSTRAINT_VTAB
-- 
-- The SQLITE_CONSTRAINT_VTAB error code is not currently used by the
-- SQLite core. However, this error code is available for use by
-- application-defined virtual tables <https://www.sqlite.org/vtab.html>.
-- 
-- 
--       (2570) SQLITE_IOERR_DELETE
-- 
-- The SQLITE_IOERR_UNLOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within xDelete method on the sqlite3_vfs
-- <https://www.sqlite.org/c3ref/vfs.html> object.
-- 
-- 
--       (2579) SQLITE_CONSTRAINT_ROWID
-- 
-- The SQLITE_CONSTRAINT_ROWID error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_CONSTRAINT
-- <https://www.sqlite.org/rescode.html#constraint> indicating that a rowid
-- <https://www.sqlite.org/lang_createtable.html#rowid> is not unique.
-- 
-- 
--       (2826) SQLITE_IOERR_BLOCKED
-- 
-- The SQLITE_IOERR_BLOCKED error code is no longer used.
-- 
-- 
--       (3082) SQLITE_IOERR_NOMEM
-- 
-- The SQLITE_IOERR_NOMEM error code is sometimes returned by the VFS
-- <https://www.sqlite.org/vfs.html> layer to indicate that an operation
-- could not be completed due to the inability to allocate sufficient
-- memory. This error code is normally converted into SQLITE_NOMEM
-- <https://www.sqlite.org/rescode.html#nomem> by the higher layers of
-- SQLite before being returned to the application.
-- 
-- 
--       (3338) SQLITE_IOERR_ACCESS
-- 
-- The SQLITE_IOERR_ACCESS error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xAccess method on the sqlite3_vfs
-- <https://www.sqlite.org/c3ref/vfs.html> object.
-- 
-- 
--       (3594) SQLITE_IOERR_CHECKRESERVEDLOCK
-- 
-- The SQLITE_IOERR_CHECKRESERVEDLOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xCheckReservedLock method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object.
-- 
-- 
--       (3850) SQLITE_IOERR_LOCK
-- 
-- The SQLITE_IOERR_LOCK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error in
-- the advisory file locking logic. Usually an SQLITE_IOERR_LOCK error
-- indicates a problem obtaining a PENDING lock
-- <https://www.sqlite.org/lockingv3.html#pending_lock>. However it can
-- also indicate miscellaneous locking errors on some of the specialized
-- VFSes <https://www.sqlite.org/vfs.html> used on Macs.
-- 
-- 
--       (4106) SQLITE_IOERR_CLOSE
-- 
-- The SQLITE_IOERR_ACCESS error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xClose method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object.
-- 
-- 
--       (4362) SQLITE_IOERR_DIR_CLOSE
-- 
-- The SQLITE_IOERR_DIR_CLOSE error code is no longer used.
-- 
-- 
--       (4618) SQLITE_IOERR_SHMOPEN
-- 
-- The SQLITE_IOERR_SHMOPEN error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xShmMap method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- open a new shared memory segment.
-- 
-- 
--       (4874) SQLITE_IOERR_SHMSIZE
-- 
-- The SQLITE_IOERR_SHMSIZE error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xShmMap method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- resize an existing shared memory segment.
-- 
-- 
--       (5130) SQLITE_IOERR_SHMLOCK
-- 
-- The SQLITE_IOERR_SHMLOCK error code is no longer used.
-- 
-- 
--       (5386) SQLITE_IOERR_SHMMAP
-- 
-- The SQLITE_IOERR_SHMMAP error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xShmMap method on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- map a shared memory segment into the process address space.
-- 
-- 
--       (5642) SQLITE_IOERR_SEEK
-- 
-- The SQLITE_IOERR_SEEK error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xRead or xWrite methods on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- seek a file descriptor to the beginning point of the file where the read
-- or write is to occur.
-- 
-- 
--       (5898) SQLITE_IOERR_DELETE_NOENT
-- 
-- The SQLITE_IOERR_DELETE_NOENT error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating that the xDelete
-- method on the sqlite3_vfs <https://www.sqlite.org/c3ref/vfs.html> object
-- failed because the file being deleted does not exist.
-- 
-- 
--       (6154) SQLITE_IOERR_MMAP
-- 
-- The SQLITE_IOERR_MMAP error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating an I/O error
-- within the xFetch or xUnfetch methods on the sqlite3_io_methods
-- <https://www.sqlite.org/c3ref/io_methods.html> object while trying to
-- map or unmap part of the database file into the process address space.
-- 
-- 
--       (6410) SQLITE_IOERR_GETTEMPPATH
-- 
-- The SQLITE_IOERR_GETTEMPPATH error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> indicating that the VFS
-- <https://www.sqlite.org/vfs.html> is unable to determine a suitable
-- directory in which to place temporary files.
-- 
-- 
--       (6666) SQLITE_IOERR_CONVPATH
-- 
-- The SQLITE_IOERR_CONVPATH error code is an extended error code
-- <https://www.sqlite.org/rescode.html#pve> for SQLITE_IOERR
-- <https://www.sqlite.org/rescode.html#ioerr> used only by Cygwin VFS
-- <https://www.sqlite.org/vfs.html> and indicating that the
-- cygwin_conv_path() system call failed. See also:
-- SQLITE_CANTOPEN_CONVPATH
-- <https://www.sqlite.org/rescode.html#cantopen_convpath>
end

