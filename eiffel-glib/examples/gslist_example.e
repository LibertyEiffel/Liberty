indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GSLIST_EXAMPLE

creation  make

feature
	list: G_SLIST[G_STRING]
	first: G_STRING
feature
	make is
		local i: ITERATOR [G_STRING]
		do
			create list.make(create {MAGICAL_FACTORY[G_STRING]})
			list.prepend (gstring("Third and last Foo"))
			list.prepend (gstring("Second Foo"))
			list.prepend (gstring("First Foo"))
			list.append  (gstring("Fourth and new last Foo"))
			check 
				list_not_empty: not list.is_empty
			end
			
			print("First is: "+list.first.to_string+"%N")
			from i:=list.get_new_iterator; i.start  until i.is_off
			loop
				print (i.item.to_string) print (", ")
				i.next
			end
			print ("%N")
		end

	gstring(a_str: STRING): G_STRING is
		require a_str/=Void
		do
			create Result.from_string(a_str)
		end
end
	
