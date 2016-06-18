note
	description: "Test case"
	copyright: "(C) 2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	author: "$Author$"
	date: "$Date$"
	revision "$Revision$"

class TEST_INSERT

inherit
	EIFFELTEST_TOOLS

insert
	FILE_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make
		local
			db: SQLITE_DATABASE
			file_name: STRING
			it: ITERATOR[RESULT_ROW]
		do
			file_name := "test_db.sqlite"
			if file_exists (file_name) then
				delete (file_name)
			end
			create db.connect (file_name)
			db.execute ("CREATE TABLE existant (name VARCHAR(32), age INTEGER);")

			db.execute ("INSERT INTO existant VALUES ('Raphael Mack', 24);")
			assert (db.last_action_success)
			
			db.execute ("SELECT * FROM existant;")
			assert (db.last_action_success)

			it := db.result_set.new_iterator
			it.start
			assert (not it.is_off)
			assert ({SQLITE_STRING_VALUE} ?:= it.item.item(0) )
			assert (it.item.item(0).out.is_equal("Raphael Mack"))
			
			-- This will fail since SQLite tends to return string values...
            -- assert ({SQLITE_INTEGER_VALUE} ?:= it.item.item(1))
            assert (it.item.item(1).out.is_equal("24"))
			
			db.close
		 
			if file_exists (file_name) then
				delete (file_name)
			end
		end

end
