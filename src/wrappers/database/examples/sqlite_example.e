class SQLITE_EXAMPLE

create {ANY}  make

feature {ANY} 
	make
		do
			create database.connect ("test.sqlite")
				-- TODO: create table if it does not exist
			use_exec_and_create_if_inexistant
			use_prepared_insert
			use_prepared_query
			delete_inserted_data
		end

	use_exec_and_create_if_inexistant
		do
			database.execute ("SELECT * FROM programmers;")
			if not database.last_action_success then
				database.execute ("CREATE TABLE programmers (name VARCHAR(32), age INTEGER);")
				database.execute ("SELECT * FROM programmers;")
			end
			if database.last_action_success then
				iter := database.result_set.new_iterator
				
				io.put_string ("Programmers in the database are: ")
				from
					iter.start
				until
					iter.is_off
				loop
					row := iter.item
                    ("#(1), #(2) years old%N" # &row.item(0) # &row.item(1) ).print_on(std_output)
					iter.next
					if not iter.is_off then
						io.put_string (", ")
					end
				end
				io.put_string (".%N")
			end
		end
feature {ANY} 
    entries: ARRAY[FAST_ARRAY[SQLITE_VALUE]] once
        Result := << 
            {FAST_ARRAY[SQLITE_VALUE] <<s("Linus Torvalds"), int(50)>>},
            {FAST_ARRAY[SQLITE_VALUE] <<s("Richard Stallman"), int(60)>>},
            {FAST_ARRAY[SQLITE_VALUE] <<s("Raphael Mack"), int(35)>>},
            {FAST_ARRAY[SQLITE_VALUE] <<s("Cyril Adrian"), int(40)>>}
        >>
    end

feature {ANY} -- Commodities
    -- Those commodity features are just shortcuts needed because current
    -- compiler (as of March 2016) does not support convert
    s(a_str: STRING): SQLITE_STRING_VALUE do create Result.set_item(a_str) end  
    int (an_i: INTEGER): SQLITE_INTEGER_VALUE do create Result.set_item(an_i) end

feature {ANY}
    use_prepared_insert 
		local
			a_command: SQLITE_PREPARED_COMMAND
            -- TODO: 2016-04-15 if a_command is only a PREPARED_COMMAND the code is correct but the compiler currently produces wrong, uncompilable code
            -- when you use ITERABLE features you don't need a counter i: INTEGER
		do
			a_command := database.prepare_command("INSERT INTO programmers VALUES(?,?);")
            entries.for_each(agent (an_entry: TRAVERSABLE[SQLITE_VALUE]) do
                io.put_string ("Inserting "+an_entry.first.out+" ... %N")
				a_command.execute (an_entry)
            end(?))

			-- from
			-- 	i := entries.lower
			-- until
			-- 	i > entries.upper
			-- loop 
			-- 	io.put_string ("Inserting " + entries.item(i).out + "... %N")
			-- 	a_command.execute (entries.item(i))
			-- 	i := i + 1
			-- end
		end
	
	delete_inserted_data 
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
				-- a_command.execute ({FAST_ARRAY[ANY] <<entries.item(i).item(0)>>})
				a_command.execute (<<entries.item(i).item(0)>>)
				io.put_string (a_command.last_affected_rows.out + " rows affected%N")
				i := i + 1
			end
		end
	
	age_limit: INTEGER is 32
			-- Age above which a programmer is considered "old" 8-)

	use_prepared_query 
		local
			name,age: STRING
		do
			query := database.prepare_query("SELECT * FROM programmers WHERE age>?;")
			query.execute (<<create {SQLITE_INTEGER_VALUE}.set_item(age_limit)>>)
			-- query.execute (<<int(age_limit)>>)
			if query.last_exec_success then
				iter := query.last_result.new_iterator
				from
					iter.start
					io.put_string ("Programmers over " + age_limit.out + " years old: ")
				until
					iter.is_off
				loop
					row := iter.item
					name := row.item(0).out
					age := row.item(1).out
					print (name+" aged "+age)
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
