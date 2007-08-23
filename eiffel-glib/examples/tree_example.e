indexing
	
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class TREE_EXAMPLE

creation make

feature
	tree: G_TREE[G_STRING,G_DATE]
	first: G_STRING
feature
	make is
		do
			setup
			test
		end

	setup is
		do
			create tree.with_comparer(agent compare)

			tree.put (gstring("Epoch"), gdate(1,1,1970))
			tree.put (gstring("Gnu birthday"), gdate(10,3,1984))
			tree.put (gstring("Linux birthday"), gdate(17,9,1991))
		end

	test is
		local
			a_date: G_DATE;
			test_dates: FAST_ARRAY[G_DATE]; i: INTEGER
			event: G_STRING
		do
			test_dates:={FAST_ARRAY[G_DATE] <<gdate(17,9,1991), gdate(10,7,1976), gdate(10,3,1984)>> }
			from i:=test_dates.lower
			until i>test_dates.upper
			loop
				a_date:=test_dates.item(i)
				event:=tree.reference_at(a_date)
				if event/=Void
				 then print (a_date.to_string+": "+event.to_string+"%N")
				else print ("No known events on "+a_date.to_string+"%N")
				end
				i:=i+1
			end
			-- from i:=list.get_new_iterator; i.start until i.is_off loop
			-- print (i.item.to_string) print (", ") i.next end print
			-- ("%N")
		end
					 
 	compare(a_date,another_date: G_DATE): INTEGER is --COMPARABLE_SHARED_C_STRUCT): INTEGER is
		require 
			date_not_void: a_date/=Void
			another_not_void: another_date/=Void
		do
			Result:=a_date.compare(another_date)
		end

	gstring(a_string: STRING): G_STRING is
			-- A new G_STRING initialized to `a_string'
		require a_string/=Void
		do
			create Result.from_string(a_string)
		end

	gdate(a_day, a_month:INTEGER_8; a_year:INTEGER_16): G_DATE is
		do
			create Result.make_dmy(a_day,a_month,a_year)
		end
	
end
	
