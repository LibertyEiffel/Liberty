class TEST_CONST_STRING

inherit
	EIFFELTEST_TOOLS

create {ANY} make

feature {ANY}
	make is
		local
			cs: CONST_STRING
			s: STRING
		do
			s := "teststring"
			create cs.from_external(const_s_ptr)

			assert (cs.count = 10)
			assert (s.is_equal(cs))
			assert (s <= cs)
			assert (s >= cs)
			assert (cs >  "test")
			assert (cs >= "test")
			assert (cs <= "teststring-long")
			assert (cs <  "teststring-long")
			assert (cs.in_range(create {CONST_STRING}.from_external(short_const_s_ptr),
									  create {CONST_STRING}.from_external(long_const_s_ptr)))
		end

feature {} -- externals
	const_s_ptr: POINTER is
		external "C macro"
		alias "%"teststring%""
		end

	short_const_s_ptr: POINTER is
		external "C macro"
		alias "%"test%""
		end
	
	long_const_s_ptr: POINTER is
		external "C macro"
		alias "%"teststring-long%""
		end
	
end
