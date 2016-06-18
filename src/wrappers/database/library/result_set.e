note
	description: "Result set of an SQL query."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- TODO: review this class
	
deferred class RESULT_SET [ROW_-> RESULT_ROW] 
inherit
	TRAVERSABLE [ROW_]
		undefine
			fill_tagged_out_memory
		end

feature {ANY} 
	columns: INTEGER
			-- the number of columns of each result row

feature {PREPARED_STATEMENT}
	set_columns_number (a_number: INTEGER)
			-- set `columns' to `a_number'
		do
			columns:= a_number
		end

-- features inherited from TRAVERSABLE 	
-- lower: INTEGER_32
-- upper: INTEGER_32
-- valid_index (i: INTEGER_32): BOOLEAN
-- count: INTEGER_32
-- is_empty: BOOLEAN
-- item (i: INTEGER_32): E_
-- first: E_
-- last: E_
-- get_new_iterator: ITERATOR[E_]
end
