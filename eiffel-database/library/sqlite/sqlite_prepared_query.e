indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
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
		undefine
			copy,
			is_equal
		end

	SQLITE_TYPE_CODES
		undefine
			copy,
			is_equal
		end
	
creation  {SQLITE_DATABASE} make
	
feature
	last_result: SQLITE_RESULT_SET

	execute (some_parameters: TRAVERSABLE[ANY]) is
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

feature {} -- Implementation
	fill_in_results is
		require 
			correct_sqlite_status: res_code = Sqlite_ok
		local
			code: SQLITE_ERROR_CODES
		do
			-- Build results
			create {SQLITE_RESULT_SET} last_result.make
			from 
				res_code := sqlite3_step(handle)
				last_result.set_columns_number (sqlite3_column_count(handle))
			until
				res_code /= Sqlite_row
			loop
				fill_in_row
				res_code := sqlite3_step (handle)
			end
			debug
				if not last_exec_success then
					io.put_string("Unexpected sqlite result code: " + res_code.out + "(" + code.error_message(res_code) + ")%N")
				end
			end
		end
	
	fill_in_row is
		local 
			a_column: INTEGER
			a_type_number: INTEGER
			a_row: SQLITE_RESULT_ROW
			cstr: POINTER
		do
			create a_row.make (last_result.columns)
			last_result.add_last (a_row)
			from
				a_column := a_row.lower
			until
				a_column > a_row.upper
			loop
				a_type_number := sqlite3_column_type (handle, a_column)
				inspect a_type_number
				when Sqlite_integer then
					a_row.put (create {REFERENCE[INTEGER]}.set_item
								  (sqlite3_column_int (handle,a_column)),
								  a_column)
				when Sqlite_float then 	
					a_row.put (create {REFERENCE[REAL]}.set_item
								  (sqlite3_column_double (handle, a_column)),
								  a_column)
				when Sqlite_text then 
					cstr := sqlite3_column_text (handle, a_column)
					if cstr.is_not_null then 
						a_row.put (create {STRING}.from_external_copy(cstr),
									  a_column)
					else
						debug
							io.put_line(once "Warning: SQLITE_PREPARED_QUERY fill_in_row found a NULL string.")
						end
					end
				when Sqlite_blob then 
					debug
						io.put_string ("Warning: an SQLITE_PREPARED_QUERY returned a blob. Since it is currently not handled Void takes its place%N")
					end
					a_row.put (Void, a_column)
				when Sqlite_null then
					a_row.put (Void, a_column)
				else
					raise ("SQLITE_PREPARED_QUERY.fill_in_row: got unknown type number " + a_type_number.out + "%N")
				end
				a_column := a_column + 1
			end
		end
end
