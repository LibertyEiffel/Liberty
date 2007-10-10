class TEST_CONST_STRING

inherit
	EIFFELTEST_TOOLS

creation  make

feature
	make is
		local
			cs: CONST_STRING
			s: STRING
		do
			s := "teststring"
			create cs.from_external(const_s_ptr)

			assert (cs.count = 10)
			assert (s.is_equal(cs))

		end

feature {} -- externals
	const_s_ptr: POINTER is
		external "C macro"
		alias "%"teststring%""
		end
	
end
