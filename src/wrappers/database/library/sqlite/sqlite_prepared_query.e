note
	description: "."
	copyright: "(C) 2006, 2014 Paolo Redaelli (C) 2007,2008 Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision: "$Revision$"

class SQLITE_PREPARED_QUERY
inherit
    PREPARED_QUERY
		undefine
			copy,
			is_equal
        redefine
            last_result
        end
	SQLITE_PREPARED_STATEMENT

insert
    SQLITE3_EXTERNALS
    SQLITE_ERROR_CODES undefine copy, is_equal end
    SQLITE_TYPE_CODES
	undefine
		copy,
		is_equal
	end

create  {SQLITE_DATABASE} make

feature {ANY}
    last_result: SQLITE_RESULT_SET

    execute (some_parameters: TRAVERSABLE[SQLITE_VALUE])
            -- Execute the current query with `some_parameters'
	local 
		i: INTEGER -- the parameters index, 
		query_index: INTEGER 
	do
		debug print ("SQLITE_PREPARED_COMMAND.execute rescode:" + res_code.out + "%N") end
		res_code := sqlite3_reset (handle)
		from
			i := some_parameters.lower
			query_index := 1 
		until
			i > some_parameters.upper
		loop
			bind_parameter (some_parameters.item(i), query_index)
			i := i + 1
			query_index := query_index + 1
		end
		fill_in_results
	end

	execute_callback (some_parameters: TRAVERSABLE[SQLITE_VALUE]; callback: ROUTINE[TUPLE[RESULT_ROW]]) is
        -- Execute the current query with `some_parameters'
        -- call callback for every result_row
    require
        useful_callback: callback /= Void
        valid_count: some_parameters.count = parameter_count
    local 
        i: INTEGER -- the parameters index, 
        query_index: INTEGER 
    do
        sedb_breakpoint
        res_code := sqlite3_reset (handle)
        from
            i := some_parameters.lower
            query_index := 1
        until
            i > some_parameters.upper
        loop
            bind_parameter (some_parameters.item(i), query_index)
            i := i + 1
            query_index := query_index + 1
        end

        create {SQLITE_RESULT_SET} last_result.make
        from 
            res_code := sqlite3_step(handle)
            last_result.set_columns_number (sqlite3_column_count(handle))
        until
            res_code /= sqlite_row
        loop
            callback.call([fetch_one_row])
            res_code := sqlite3_step (handle)
        end

end

feature {} -- Implementation
    -- TODO: Evaluate An SQL Statement

    --     int sqlite3_step(sqlite3_stmt*);

    -- After an SQL statement has been prepared with a call to either
    -- sqlite3_prepare_v2() or sqlite3_prepare16_v2() or to one of the
    -- legacy interfaces sqlite3_prepare() or sqlite3_prepare16(), then
    -- this function must be called one or more times to evaluate the
    -- statement.

    -- The details of the behavior of this sqlite3_step() interface
    -- depend on whether the statement was prepared using the newer
    -- "v2" interface sqlite3_prepare_v2() and sqlite3_prepare16_v2()
    -- or the older legacy interface sqlite3_prepare() and
    -- sqlite3_prepare16(). The use of the new "v2" interface is
    -- recommended for new applications but the legacy interface will
    -- continue to be supported.

    -- In the lagacy interface, the return value will be either
    -- SQLITE_BUSY, SQLITE_DONE, SQLITE_ROW, SQLITE_ERROR, or
    -- SQLITE_MISUSE. With the "v2" interface, any of the other result
    -- code or extended result code might be returned as well.

    -- SQLITE_BUSY means that the database engine was unable to acquire
    -- the database locks it needs to do its job. If the statement is a
    -- COMMIT or occurs outside of an explicit transaction, then you
    -- can retry the statement. If the statement is not a COMMIT and
    -- occurs within a explicit transaction then you should rollback
    -- the transaction before continuing.

    -- SQLITE_DONE means that the statement has finished executing
    -- successfully. sqlite3_step() should not be called again on this
    -- virtual machine without first calling sqlite3_reset() to reset
    -- the virtual machine back to its initial state.

    -- If the SQL statement being executed returns any data, then
    -- SQLITE_ROW is returned each time a new row of data is ready for
    -- processing by the caller. The values may be accessed using the
    -- column access functions. sqlite3_step() is called again to
    -- retrieve the next row of data.

    -- SQLITE_ERROR means that a run-time error (such as a constraint
    -- violation) has occurred. sqlite3_step() should not be called
    -- again on the VM. More information may be found by calling
    -- sqlite3_errmsg(). With the legacy interface, a more specific
    -- error code (example: SQLITE_INTERRUPT, SQLITE_SCHEMA,
    -- SQLITE_CORRUPT, and so forth) can be obtained by calling
    -- sqlite3_reset() on the prepared statement. In the "v2"
    -- interface, the more specific error code is returned directly by
    -- sqlite3_step().

    -- SQLITE_MISUSE means that the this routine was called
    -- inappropriately. Perhaps it was called on a prepared statement
    -- that has already been finalized or on one that had previously
    -- returned SQLITE_ERROR or SQLITE_DONE. Or it could be the case
    -- that the same database connection is being used by two or more
    -- threads at the same moment in time.

    -- Goofy Interface Alert: In the legacy interface, the
    -- sqlite3_step() API always returns a generic error code,
    -- SQLITE_ERROR, following any error other than SQLITE_BUSY and
    -- SQLITE_MISUSE. You must call sqlite3_reset() or
    -- sqlite3_finalize() in order to find one of the specific result
    -- codes that better describes the error. We admit that this is a
    -- goofy design. The problem has been fixed with the "v2"
    -- interface. If you prepare all of your SQL statements using
    -- either sqlite3_prepare_v2() or sqlite3_prepare16_v2() instead of
    -- the legacy sqlite3_prepare() and sqlite3_prepare16(), then the
    -- more specific result codes are returned directly by
    -- sqlite3_step(). The use of the "v2" interface is recommended.


    fill_in_results is
        require 
            correct_sqlite_status: res_code = sqlite_ok
        do
            -- Build results
            create {SQLITE_RESULT_SET} last_result.make
            from 
                res_code := sqlite3_step(handle)
                last_result.set_columns_number (sqlite3_column_count(handle))
            until
                res_code /= sqlite_row
            loop
                last_result.add_last (fetch_one_row)
                res_code := sqlite3_step (handle)
            end
            debug
            if not last_exec_success then
                io.put_string("Unexpected sqlite result code: " + res_code.out + "(" + error_message(res_code) + ")%N")
            end
        end
end

    fetch_one_row: SQLITE_RESULT_ROW is
        local 
            a_column: INTEGER
            a_type_number: INTEGER
            cstr: POINTER
        do
            create Result.make (last_result.columns)
            from
                a_column := Result.lower
            until
                a_column > Result.upper
            loop
                a_type_number := sqlite3_column_type (handle, a_column)
                if a_type_number=sqlite_integer then
                    Result.put (
                        create {SQLITE_INTEGER_VALUE}.from_integer_64(
                            sqlite3_column_int64 (handle,a_column)
                        ), a_column)
                elseif a_type_number=sqlite_float then 	
                    Result.put (
                        create {SQLITE_REAL_VALUE}.set_item(
                            sqlite3_column_double (handle, a_column)
                        ), a_column)
                elseif a_type_number=sqlite_text then 
                    cstr := sqlite3_column_text (handle, a_column)
                    if cstr.is_not_null then 
                        Result.put (create {SQLITE_STRING_VALUE}.from_external_copy(cstr), a_column)
                    else
                        debug
                            io.put_line(once "Warning: SQLITE_PREPARED_QUERY fill_in_row found a NULL string.")
                        end
                    end
                elseif a_type_number=sqlite_blob then 
                    debug
                        io.put_string ("Warning: an SQLITE_PREPARED_QUERY returned a blob. Since it is currently not handled Void takes its place%N")
                    end
                    Result.put (Void, a_column)
                elseif a_type_number=sqlite_null then
                    Result.put (Void, a_column)
                else
                    raise ("SQLITE_PREPARED_QUERY.fill_in_row: got unknown type number " + a_type_number.out + "%N")
                end
                a_column := a_column + 1
            end
        end
end
