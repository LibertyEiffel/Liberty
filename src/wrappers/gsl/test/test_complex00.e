class TEST_COMPLEX00

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			c: GSL_COMPLEX_REAL_64
		do
			assert(c.out.is_equal("0.000000+0.000000i"))
		end

end -- TEST_COMPLEX00
