indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_PREPARED_QUERY
inherit
	PREPARED_QUERY redefine results end
	SQLITE_PREPARED_STATEMENT

insert
	SQLITE3_EXTERNALS
	
creation make
	
feature
	results: SQLITE_RESULT_SET 

	execute (some_parameters: TRAVERSABLE[ANY]): SQLITE_RESULT_SET is
			-- Execute the current query with `some_parameters'
		local 
			i: INTEGER -- the parameters index, 
			query_index: INTEGER 
		do
			debug print ("SQLITE_PREPARED_COMMAND.execute rescode:"+res_code.out+"%N") end
			res_code := sqlite3_reset (handle)
			from i:=some_parameters.lower; query_index:=1 
			until i > some_parameters.upper
			loop
				bind_parameter (some_parameters.item(i),query_index)
				i := i+1; query_index := query_index + 1
			end
			fill_in_results
			Result := results
		end

feature {} -- Implementation
	fill_in_results is
		require 
			correct_sqlite_status: res_code = sqlite_ok
		do
			-- Build results
			create {SQLITE_RESULT_SET} results.make 
			from 
				res_code := sqlite3_step(handle)
				results.set_columns_number (sqlite3_column_count(handle))
			until res_code = sqlite_done
			loop
				inspect res_code
				when sqlite_busy then
					debug print ("SQlite busy%N") end
				when sqlite_done then
					debug print ("SQlite done%N") end
				when sqlite_row then
					debug print ("SQlite row%N") end
					fill_in_row
				when sqlite_error then
					debug print ("SQlite error%N") end
				when sqlite_misuse then
					debug print ("SQlite misuse%N") end
				end
				res_code:=sqlite3_step (handle)
			end
		end
	
	fill_in_row is
		local 
			a_column: INTEGER; a_type_number: INTEGER
			a_row: SQLITE_RESULT_ROW
		do
			create a_row.make (results.columns)
			results.add_last (a_row)
			from a_column:=a_row.lower until a_column>=a_row.upper
			loop
				a_type_number := sqlite3_column_type (handle, a_column)
				inspect a_type_number
				when sqlite_integer then
					debug print ("Putting "+sqlite3_column_int (handle,a_column).out +
									 " into column "+ a_column.out +"%N") end
					a_row.put (create {REFERENCE[INTEGER]}.set_item
								  (sqlite3_column_int (handle,a_column)),
								  a_column)
				when sqlite_float then 	
					a_row.put (create {REFERENCE[REAL]}.set_item
								  (sqlite3_column_double (handle, a_column)),
								  a_column)
				when sqlite_text then 
					a_row.put (create {STRING}.from_external_copy
								  (sqlite3_column_text (handle, a_column)),
								  a_column)
				when sqlite_blob then 
					debug print ("Warning: an SQLITE_PREPARED_QUERY returned a blob. Since it is currently not handled Void takes its place%N") end
					a_row.put (Void, a_column)
				when sqlite_null then a_row.put (Void, a_column)
					debug print ("Warning: an SQLITE_PREPARED_QUERY returned a Void.%N") end
					a_row.put (Void, a_column)
				else
					raise ("SQLITE_PREPARED_QUERY.fill_in_row: got type number "+a_type_number.out+"%N")
				end
				a_column := a_column+1
			end -- loop
		end
end
