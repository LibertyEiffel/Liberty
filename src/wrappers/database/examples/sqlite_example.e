class SQLITE_EXAMPLE

create {ANY}  make

feature {ANY} 
	make is
		do
			create database.connect ("test.sqlite")
				-- TODO: create table if it does not exist
			use_exec_and_create_if_inexistant
			use_prepared_insert
			use_prepared_query
			delete_inserted_data
		end

	use_exec_and_create_if_inexistant is
		do
			database.execute ("SELECT * FROM programmers;")
			if not database.last_action_success then
				database.execute ("CREATE TABLE programmers (name VARCHAR(32), age INTEGER);")
				database.execute ("SELECT * FROM programmers;")
			end
			if database.last_action_success then
				iter := database.result_set.get_new_iterator
				
				io.put_string ("Programmers in the database are: ")
				from
					iter.start
				until
					iter.is_off
				loop
					row := iter.item
					print (row.item(0).out)
					print (" aged ")
					print (row.item(1).out)
					iter.next
					if not iter.is_off then
						io.put_string (", ")
					end
				end
				io.put_string ("%N")
			end
		end
feature {ANY} 
	entries: ARRAY[FAST_ARRAY[ANY]] is
		once
			Result := << 
							{FAST_ARRAY[ANY] <<"Linus Torvalds", create {REFERENCE[INTEGER]}.set_item(50)>>},
							{FAST_ARRAY[ANY] <<"Richard Stallman", create {REFERENCE[INTEGER]}.set_item(50)>>},
							{FAST_ARRAY[ANY] <<"Raphael Mack", create {REFERENCE[INTEGER]}.set_item(24)>>}
							{FAST_ARRAY[ANY] <<"Raphael Mack", create {REFERENCE[INTEGER]}.set_item(24)>>}
							>>
		end
		
	use_prepared_insert is
		local
			a_command: PREPARED_COMMAND
			i: INTEGER
		do
			a_command := database.prepare_command("INSERT INTO programmers VALUES(?,?);")
			from
				i := entries.lower
			until
				i > entries.upper
			loop 
				io.put_string ("Inserting " + entries.item(i).out + "... %N")
				a_command.execute (entries.item(i))
				i := i + 1
			end
		end
	
	delete_inserted_data is
		local
			a_command: PREPARED_COMMAND
			i: INTEGER
		do			
			a_command := database.prepare_command("DELETE FROM programmers WHERE name=?;")
			from
				i := entries.lower
			until
				i > entries.upper
			loop 
				io.put_string ("Deleting '" + entries.item(i).item(0).out + "' ... ")
				a_command.execute ({FAST_ARRAY[ANY] <<entries.item(i).item(0)>>})
				io.put_string (a_command.last_affected_rows.out + " rows affected%N")
				i := i + 1
			end
		end
	
	age_limit: INTEGER is 32
			-- Age above which a programmer is considered "old" 8-)

	use_prepared_query is
		local
			name: STRING
			age: INTEGER
		do
			query := database.prepare_query("SELECT * FROM programmers WHERE age>?;")
			query.execute (<<create {REFERENCE[INTEGER]}.set_item(age_limit)>>)
			if query.last_exec_success then
				iter := query.last_result.get_new_iterator
				from
					iter.start
					io.put_string ("Programmers over " + age_limit.out + " years old: ")
				until
					iter.is_off
				loop
					row := iter.item
					check
						row_not_void: row /= Void
						first_is_string: row.is_string (0)
						second_is_integer: row.is_integer (1)
					end
					name := row.string_item(0)
					age := row.integer_item(1)
					print (name+" aged "+age.out)
					iter.next
					if iter.is_off then
						print (".%N")
					else
						print (", ")
					end
				end
			end
		end
			
	database: SQLITE_DATABASE
	query: PREPARED_QUERY
	iter: ITERATOR[RESULT_ROW]
	row: RESULT_ROW
end


-- 
