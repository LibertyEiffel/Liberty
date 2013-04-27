indexing
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

	make is
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

			it := db.result_set.get_new_iterator
			it.start
			assert (not it.is_off)
			assert (it.item.is_string(0))
			assert (it.item.string_item(0).is_equal("Raphael Mack"))
			
			assert (it.item.is_string(1))
			assert (it.item.string_item(1).is_equal("24"))
			
			db.close
		 
			if file_exists (file_name) then
				delete (file_name)
			end
		end

end
