class TEST_ONCE10
-- test that a once feature with multiple names is executed only once
   
insert
   EIFFELTEST_TOOLS

creation {ANY}
	make

feature {ANY}
	foo, bar: INTEGER is
		once
         count := count + 1
			Result := count
		end

   
	make is
		do
         assert(foo = 1)
         assert(bar = 1)
         assert(foo = 1)
         assert(count = 1)

         count := count + 1
         assert(bar = 1)
         assert(foo = 1)
         assert(count = 2)

		end

feature {NONE}
   count: INTEGER
end
