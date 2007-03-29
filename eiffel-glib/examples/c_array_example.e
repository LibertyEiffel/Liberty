indexing
	copyright: "(C) 2007 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"

class C_ARRAY_EXAMPLE

creation make

feature
	array: C_ARRAY[G_STRING]
	
	make is
		local s: G_STRING; i: INTEGER
		do
			create array.with_capacity(4)
			create s.from_string("First Foo"); array.put(s,0)
			create s.from_string("Second Foo"); array.put(s,1)
			create s.from_string("Third and last Foo"); array.put(s,2)
			array.put(Void,3)
			check
				array_not_empty: not array.is_empty
			end
			
			print ("First is: ") print (array.first.to_string) print ("%N")
			from i:=array.lower  until i>array.upper
			loop
				s:=array.item(i)
				if s/=Void then print (s.to_string) print (", ")
				else print ("Void, ")
				end
				i:=i+1
			end
			print ("%N")
		end
end
	
