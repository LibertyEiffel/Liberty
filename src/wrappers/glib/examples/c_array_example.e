note
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

class C_ARRAY_EXAMPLE

inherit WRAPPER_HANDLER -- to play with pointers

create {ANY} make

feature {ANY}
	array: C_ARRAY[G_STRING]

	make is
		local s: G_STRING; i: INTEGER
		do
			create array.with_capacity(4)
			create s.from_string(first); array.force(s,0)
			create s.from_string(second); array.force(s,1)
			create s.from_string(third); array.force(s,2)
			array.force(Void,3)
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
			test_null_terminated_array
		end

	test_null_terminated_array is
		local i: INTEGER; it: ITERATOR[G_STRING]; s: G_STRING
		do
			create {NULL_TERMINATED_C_ARRAY[G_STRING]} array.from_external(null_terminated_array_pointer)
			check array.count=3 end
			from print("Using indexes: "); i:=array.lower until i>array.upper
			loop
				s:=array.item(i)
				print(i.out+": ") 
				if s/=Void then print (s.to_string) print (", ")
				else print ("Void, ")
				end
				i:=i+1
			end

			print("%NUsing iterator: ") 
			from it:=array.get_new_iterator; it.start until it.is_off
			loop
				s:=it.item
				if s/=Void then print (s.to_string) print (", ")
				else print ("Void, ")
				end
				it.next
			end
			print ("%N")
		end

	null_terminated_array_pointer: POINTER is
		do
			native:=native.calloc(4)
			-- creating temporary G_STRING objects and throwing them away
			-- after having added their wrapped string. This tests
			-- storing/unstorig/disposing of C_STRUCTs.
			native.put( (create {G_STRING}.from_string(first)).handle,0)
			native.put( (create {G_STRING}.from_string(second)).handle,1)
			native.put( (create {G_STRING}.from_string(third)).handle,2)
			Result:=native.to_external
		end

	native: NATIVE_ARRAY[POINTER]

	first: STRING is "First Foo"
	second: STRING is "Second Foo"
	third: STRING is "Third and last Foo"
end
	
