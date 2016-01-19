class TEST_COMPLEX01

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			a, b, c, d: GSL_COMPLEX_REAL_64
		do
			a.make_rect(1.0,1.0)
			b.make_rect(1.0,2.0)
			d.make_rect(2.0,3.0)
			c := a + b
			assert(c.real = 2.0)
			assert(c.imag = 3.0)
			assert(c = d)
		end

end -- TEST_COMPLEX00
