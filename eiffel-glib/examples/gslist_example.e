indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GSLIST_EXAMPLE

creation make

feature
	list: G_SLIST[G_STRING]
	first: G_STRING
feature make is
		do
			create list.make
			list.prepend (create {G_STRING}.from_string("Third and last Foo"))
			list.prepend (create {G_STRING}.from_string("Second Foo"))
			list.prepend (create {G_STRING}.from_string("First Foo"))
			list.append (create {G_STRING}.from_string("Fourth and new last Foo"))
				check
					list_not_empty: not list.is_empty
				end
			first := list.first
			print (first.to_string)
		end
end
	
