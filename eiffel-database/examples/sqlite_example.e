class SQLITE_EXAMPLE

creation make

feature 
	make is
		local
			results: RESULT_SET
			iter: ITERATOR[RESULT_ROW]
		do
			create database.connect ("test.sqlite")
			database.execute ("SELECT * FROM programmers;")
			iter := database.result_set.get_new_iterator
			print ("Programmers in the database are: ")
			from iter.start until iter.is_off
			loop
				print (iter.item.item(0).out)
				print (" aged ")
				print (iter.item.item(1).out)
				iter.next
				if not iter.is_off then print (", ") else print (".%N") end
			end
		end

	database: SQLITE_DATABASE
end
