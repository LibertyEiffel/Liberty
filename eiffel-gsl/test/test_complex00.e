class TEST_COMPLEX00

inherit
	EIFFELTEST_TOOLS

creation 
	make
	
feature

	make is
		local
			c: GSL_COMPLEX_REAL_64
		do
			create c.make_rect(0, 0)
			assert(c.out.is_equal("0.000000+0.000000i"))

		end

end -- TEST_COMPLEX00
