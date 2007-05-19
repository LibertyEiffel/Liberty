indexing
	description: "Test case"
	copyright: "(C) 2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	author: "$Author:$"
	date: "$Date:$"
	revision "$Revision:$"

class TEST_CODES

inherit
   EIFFELTEST_TOOLS

creation
   make
   
feature

   make is
      local
         err: SQLITE_ERROR_CODES
		 type: SQLITE_TYPE_CODES
      do
	     err.check_error_codes
		 type.check_type_codes
      end

end
