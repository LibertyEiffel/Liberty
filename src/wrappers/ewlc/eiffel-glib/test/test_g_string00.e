class TEST_G_STRING00

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
         s: G_STRING
         s2: G_STRING
         c: CHARACTER
		do
			create s.make(10)

         assert(s.count = 0)
         
			from
            c := 'a'
         until
            c > 'j'
         loop
				s.add_last(c)
				c := c.next
			end
         
         assert(s.count = 10)

         create s2.from_string("abcdefghij")         
         assert(s.is_equal(s2))
         
			assert(s.to_string.is_equal("abcdefghij"))
		end

end -- GLIST_TEST00
