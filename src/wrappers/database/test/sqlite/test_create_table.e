note
   description: "Test case"
   copyright: "(C) 2007 Raphael Mack <mail@raphael-mack.de>"
   license: "LGPL v2 or later"
   author: "$Author$"
   date: "$Date$"
   revision "$Revision$"

class TEST_CREATE_TABLE

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
         db.execute ("SELECT * FROM inexist;")
         assert (not db.last_action_success) -- selecting from inexisting tables should failed

         db.execute ("CREATE TABLE existant (name VARCHAR(32), age INTEGER);")
         assert (db.last_action_success) -- creating a simple table should work

         db.execute ("SELECT * FROM existant;")
         assert (db.last_action_success)

         it := db.result_set.new_iterator
         it.start
         assert (it.is_off) -- should be empty

         db.close
       
         if file_exists (file_name) then
            delete (file_name)
         end
      end

end
