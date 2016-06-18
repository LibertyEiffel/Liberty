note
	description: "Result set of an SQL query from an SQLite database."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_SET

inherit
	-- Features inheriting
	RESULT_SET[SQLITE_RESULT_ROW] undefine default_create end
	-- Implementation
	LINKED_LIST[SQLITE_RESULT_ROW] undefine copy, is_equal end

create {ANY}
   make

feature {ANY} -- feature get_new_iterator: ITERATOR [SQLITE_RESULT_ROW] do end
   
end -- class SQLITE_RESULT_SET
