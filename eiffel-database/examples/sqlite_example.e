class SQLITE_EXAMPLE

creation make

feature 
	make is
		do
			create database.connect ("test.sqlite")
			database.execute ("SELECT * FROM programmers;")
			iter := database.result_set.get_new_iterator
			check iter_not_void: iter /= Void end
			print ("Programmers in the database are: ")
			from iter.start until iter.is_off
			loop
				a_row := iter.item
				check row_not_void: a_row /= Void end
				print (a_row.item(0).out)
				print (" aged ")
				print (a_row.item(1).out)
				iter.next
				if not iter.is_off then print (", ") else print (".%N") end
			end
		end

	database: SQLITE_DATABASE
	iter: ITERATOR[RESULT_ROW]
	a_row: RESULT_ROW
end
