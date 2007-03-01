indexing
	
	copyright: "(C) 2007 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class TREE_EXAMPLE

creation make

feature
	tree: G_TREE[G_DATE, G_STRING]
	first: G_STRING
feature
	make is
		do
			create tree.make(agent compare)

			create epoch.make_dmy(1,1,1970)
			create gnu_birthday.make_dmy(10,3,1984)
			create linux_birthday.make_dmy(17,9,1991)
			tree.insert_value (epoch, create {G_STRING}.from_string("Epoch"))
			tree.insert_value (gnu_birthday, create {G_STRING}.from_string("Gnu birthday"))
			tree.insert_value (linux_birthday, create {G_STRING}.from_string("Linux birthday"))

			print (gnu_birthday.to_string+": "+tree.lookup(gnu_birthday).to_string+"%N")
			-- from i:=list.get_new_iterator; i.start until i.is_off loop
			-- print (i.item.to_string) print (", ") i.next end print
			-- ("%N")
		end

	epoch, gnu_birthday, linux_birthday: G_DATE 
	
 	compare(a_date,another_date: COMPARABLE_SHARED_C_STRUCT): INTEGER is
		require -- SHARED_C_STRUCT
			date_not_void: a_date/=Void
			another_not_void: another_date/=Void
		do
			Result:=a_date.compare(another_date)
		end
end
	
