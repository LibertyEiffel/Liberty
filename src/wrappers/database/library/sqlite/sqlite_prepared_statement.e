indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class SQLITE_PREPARED_STATEMENT
inherit
	PREPARED_STATEMENT
		undefine
			copy,
			is_equal
		end

	C_STRUCT

	DISPOSABLE
		undefine
			copy,
			is_equal
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
	
	SQLITE_TYPE_CODES
		undefine
			copy,
			is_equal
		end
	
feature {ANY} -- size
	struct_size: like size_t is
		external "C inline "
		alias "sizeof(sqlite3_stmt)"
		end

feature {} -- Disposing
	dispose is
		local
			res: INTEGER
		do
			res := sqlite3_finalize (handle)
			-- TODO: use the result call of the finalize somehow
			handle := default_pointer
		end

feature {ANY} -- parameters validity
	parameter_count: INTEGER is
		do
			Result := sqlite3_bind_parameter_count (handle)
		end

	are_valid_parameters (some_parameters: TRAVERSABLE[SQLITE_VALUE]): BOOLEAN is
		local 
			an_iter: ITERATOR[SQLITE_VALUE]
			j: INTEGER -- binded parameters index
		do
			Result := True
			from
				an_iter := some_parameters.get_new_iterator
				an_iter.start
				j := 1
			until
				an_iter.is_off or not Result
			loop
				Result := is_valid_parameter(an_iter.item, j)
				j := j + 1
				an_iter.next
			end
		end

	is_valid_parameter (a_parameter: SQLITE_VALUE; an_index: INTEGER): BOOLEAN is
		local column_type: INTEGER
		do
			Result := (a_parameter.type = sqlite3_column_type(handle, an_index))
		end

	bind_parameter (a_parameter: SQLITE_VALUE; an_index: INTEGER) is
			-- Bind `a_parameter' to `an_index' placeholder in the statement.
		require
			parameter_not_void: a_parameter /= Void
			valid_index: an_index.in_range (1, parameter_count)
			valid_parameter: is_valid_parameter(a_parameter, an_index)
		do
			a_parameter.bind_in (Current,an_index)
		end

	clear_bindings is
			-- Unsets all host parameters to Void. Note that contrary to
			-- the intuition of many, `reset' does not reset the bindings
			-- on a prepared statement.
		do
			res_code := sqlite3_clear_bindings(handle)
		end

feature {} -- Creation of heirs (command and query)
	make (a_sqlite_db: SQLITE_DATABASE; some_sql: STRING) is
			-- Makes a prepared query from `some_sql'
		local
			unused_portion: POINTER -- unused part of `some_sql'
		do
			sqlite_db := a_sqlite_db
			res_code := sqlite3_prepare (sqlite_db.handle,
												  some_sql.to_external,
												  some_sql.count,
												  $handle,
												  $unused_portion)
		ensure
			state: is_prepared or is_failed
		end

feature {ANY} 
	reset is
			-- Reset the compiled SQL statement back to it's initial
			-- state, ready to be re-executed. Any SQL statement
			-- variables that had values bound to them using the
			-- `bind_parameter', `bind_*' retain their values. Use
			-- `clear_bindings' to reset the bindings.
		do
			res_code :=sqlite3_reset(handle)
		end

feature {ANY} -- Statement state
	-- `step' sets `res_code' to `sqlite_row' if it is returning
	-- a single row of the result set, `sqlite_done' if execution has
	-- completed, either normally or due to an error. It might also
	-- return `sqlite_busy' if it is unable to open the database file. 

	-- TODO: If the return value is `sqlite_row,' then the following
	-- routines can be used to extract information about that row of
	-- the result set:

	--        const void *sqlite3_column_blob(sqlite3_stmt*, int iCol);
	--        int sqlite3_column_bytes(sqlite3_stmt*, int iCol);
	--        int sqlite3_column_bytes16(sqlite3_stmt*, int iCol);
	--        int sqlite3_column_count(sqlite3_stmt*);
	--        const char *sqlite3_column_decltype(sqlite3_stmt *, int iCol);
	--        const void *sqlite3_column_decltype16(sqlite3_stmt *, int iCol);
	--        double sqlite3_column_double(sqlite3_stmt*, int iCol);
	--        int sqlite3_column_int(sqlite3_stmt*, int iCol);
	--        long long int sqlite3_column_int64(sqlite3_stmt*, int iCol);
	--        const char *sqlite3_column_name(sqlite3_stmt*, int iCol);
	--        const void *sqlite3_column_name16(sqlite3_stmt*, int iCol);
	--        const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol);
	--        const void *sqlite3_column_text16(sqlite3_stmt*, int iCol);
	--        int sqlite3_column_type(sqlite3_stmt*, int iCol);


	-- TODO: Temporary implementation
	is_prepared: BOOLEAN do Result:=(res_code=sqlite_ok) end
	is_stepped: BOOLEAN do Result:=(res_code=sqlite_row) end
	is_failed: BOOLEAN do Result:=((not is_prepared) and (not is_stepped)) end
	last_exec_success: BOOLEAN
		do
			Result := (not is_failed) or else res_code = sqlite_done
		end

feature {} -- Implementation
	res_code: INTEGER 
			-- The result code of the last sqlite function call

	sqlite_db: SQLITE_DATABASE
	
-- invariant correct_state: is_prepared xor is_stepped xor is_failed
end
