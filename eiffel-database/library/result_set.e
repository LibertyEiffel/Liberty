indexing
	description: "Result set of an SQL query."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class RESULT_SET [ROW-> RESULT_ROW] 
inherit TRAVERSABLE [ROW] undefine fill_tagged_out_memory end

feature 

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
