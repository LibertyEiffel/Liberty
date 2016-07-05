note
   description: "Test case"
   copyright: "(C) 2007 Raphael Mack <mail@raphael-mack.de>"
   license: "LGPL v2 or later"
   author: "$Author$"
   date: "$Date$"
   revision "$Revision$"

class TEST_CREATE_DB

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
      do
         file_name := "new_db.sqlite"
         if file_exists (file_name) then
            delete (file_name)
         end
         create db.connect (file_name)
         db.close
         assert (file_exists (file_name))
       
         if file_exists (file_name) then
            delete (file_name)
         end
      end

end
