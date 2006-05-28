class SQLITE_EXAMPLE

creation make

feature 
	make is
		do
			create database.connect ("test.sqlite")
			use_exec
			use_prepared_insert
			use_prepared_query
			delete_inserted_data
		end

	use_exec is
		do
			database.execute ("SELECT * FROM programmers;")
			iter := database.result_set.get_new_iterator
			check iter_not_void: iter /= Void end
			print ("Programmers in the database are: ")
			from iter.start until iter.is_off
			loop
				row := iter.item
				check row_not_void: row /= Void end
				print (row.item(0).out)
				print (" aged ")
				print (row.item(1).out)
				iter.next
				if not iter.is_off then print (", ") else print (".%N") end
			end
		end

feature 
	entries: ARRAY[FAST_ARRAY[ANY]] is
		once
			Result := << 
							{FAST_ARRAY[ANY] <<"Linus Torvalds", create {REFERENCE[INTEGER]}.set_item(50)>>},
							{FAST_ARRAY[ANY] <<"Richard Stallman", create {REFERENCE[INTEGER]}.set_item(50)>>}
							>>
		end
		
	use_prepared_insert is
		local a_command: PREPARED_COMMAND; i: INTEGER
		do
			a_command := database.prepare_command("INSERT INTO programmers VALUES(?,?);")
			from i:=entries.lower until i>entries.upper
			loop 
				print ("Inserting "+entries.item(i).out+"%N")
				a_command.execute (entries.item(i))
				i := i+1
			end
		end
	
	delete_inserted_data is
		local a_command: PREPARED_COMMAND; i: INTEGER
		do			
			a_command := database.prepare_command("DELETE FROM programmers WHERE name=?;")
			from i:=entries.lower until i>entries.upper
			loop 
				print ("Deleting `"+entries.item(i).item(0).out+"'%N")
				a_command.execute ({FAST_ARRAY[ANY] <<entries.item(i).item(0)>>})
				i := i+1
			end
		end

	age_limit: INTEGER is 32
			-- Age above which a programmer is considered "old" 8-)

	use_prepared_query is
		local name: STRING; age: INTEGER; results: RESULT_SET[RESULT_ROW]
		do
			query := database.prepare_query("SELECT * FROM programmers WHERE age>?;")
			results := query.execute (<<create {REFERENCE[INTEGER]}.set_item(age_limit)>>)
			iter := results.get_new_iterator
			debug print ("Query results: "+results.out+"%N") end
			from iter.start; print ("Programmers over "+age_limit.out+" years old: ")
			until iter.is_off
			loop
				row := iter.item
				check
					row_not_void: row /= Void
					first_is_string: row.is_string (0)
					second_is_integer: row.is_integer (1)
				end
				name := row.string_item(0); age := row.integer_item(1)
				print (name+" aged "+age.out)
				iter.next
				if iter.is_off then print (".%N") else print (", ") end
			end
		end
	

	database: SQLITE_DATABASE
	query: PREPARED_QUERY
	iter: ITERATOR[RESULT_ROW]
	row: RESULT_ROW
end
