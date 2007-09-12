indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_PREPARED_COMMAND

inherit
	PREPARED_COMMAND
		undefine
			copy,
			is_equal
		end

	SQLITE_PREPARED_STATEMENT

creation dummy, {SQLITE_DATABASE} make

feature
	execute (some_parameters: TRAVERSABLE[ANY]) is
			-- Execute the current query with `some_parameters'
		local 
			i: INTEGER
			query_index: INTEGER 
		do
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
			res_code := sqlite3_step (handle)
			last_exec_success := res_code = Sqlite_done
			if last_exec_success then
				last_affected_rows := sqlite3_changes (sqlite_db.handle)
			else
				last_affected_rows := 0
			end
			res_code := sqlite3_clear_bindings (handle)
			res_code := sqlite3_reset (handle)
			is_prepared := True
			is_stepped := False
		end

	last_affected_rows: INTEGER

end
